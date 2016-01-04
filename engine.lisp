; Ce fichier contient les fonctions relatives au moteur d'inférence

(defun checkPremisse (p)
	(let
		(
			; On récupère l'élément (sous forme de liste, comme ça, si on a un OR, on récupère une liste avec tous les sous-premisses)
			(element (cdr p))
			; Et sa valeur
			(value (caddr p))
			; L'opérateur
			(op (car p))
			; La valeur actuelle de l'élément dans la BF
			(current-value nil)
		)

		; Si la value est un atome, alors on est dans un cas normal (il faut tester sinon cela plante quand on récupère la valeur d'une liste, logique...)
		(cond
			((not (listp value))
				(setq current-value (getValue (car element)))
				; Si current-value vaut NIL, c'est que l'on a pas trouvé l'élément dans la BF, donc c'est pas vérifié dans tous les cas
				(if (not current-value)
					(return-from checkPremisse NIL)
				)
			)
		)

		; On traite
		(if (equal op 'or)
			; Si on a un or, on traite différement
			(let
				((OK NIL))
				; On vérifie chaque sous-premisse de manière récursive
				(dolist (sous-premisse element OK)
					(setq OK (or OK (checkPremisse sous-premisse)))
				)
			)
			; Sinon, on vérifie directement
			; On distingue le cas du member qui se comporte un peu différemment d'un opérateur de comparaison
			(if (equal op 'member)
				(member (car element) (getValue value))
				(eval (list op current-value value))
			)
		)
	)
)

; Est-ce que la règle est déclenchable ?
(defun is-triggerable (r)
	(let
		(
			(premisses (getPremisses r))
			(OK T)
		)
		; On vérifie que tous les prémisses sont vrais
		(dolist (p premisses OK)
			(setq OK (and OK (checkPremisse p)))
		)
	)
)

; Liste des règles applicables
(defun candidate-rules ()
	(let
		((candidates nil))
		(dolist (r *BR* (reverse candidates))
			; On récupère la liste de toutes les règles déclenchables
			(if (is-triggerable (car r))
				(push (car r) candidates)
			)
		)
	)
)


; Fonction pour calculer le but d'une règle lorsqu'il s'agit d'une expression mathématique
(defun calculateGoal (g)
	(if (listp (caddr g))
		; Si le dernier élement est une liste, alors on a encore une expression
		(eval (list (car g) (getValue (cadr g)) (calculateGoal (caddr g))))
		(eval (list (car g) (getValue (cadr g)) (getValue (caddr g))))
	)
)

; Permet de déclencher une règle
(defun triggerRule (r)
	(let*
		; On récupère le but de la fonction
		(
			(goal (car (getGoal r)))
			(value (cadr goal))
		)
		; On vérifie qu'elle est déclenchable
		(cond
			((is-triggerable r)
				; Si le but est une expression composée, alors on va l'évaluer
				(if (listp value)
					(if (member (car value) '(+ - * / or and))
						(setq value (calculateGoal value))
					)
				)

				(add2BF (list (car goal) value)) ; On ajoute le but dans la BF
				(removeRule r); On supprime la règle de la BR
			)
		)
		(is-triggerable r) ; On retourne T ou NIL selon si l'on a pu appliquer la règle
	)
)

; Permet de récupérer la liste des UVs conseillées
(defun getTargetedUVs ()
	(let
		((uvs nil))
		(dolist (fait *BF* (reverse uvs))
			(if (equal (cadr fait) "conseillee")
				(push (car fait) uvs)
			)
		)
	)
)

; Permet de réinitialiser la liste des UVs conseillées
(defun reinitUVs ()
	(dolist (fait *BF*)
		(if (equal (cadr fait) "conseillee")
			(setf (cadr fait) "non_validee")
		)
	)
)

; Moteur
(defun engine ()
	(if *BF*
		(progn
			(let
				(
					(r (car (candidate-rules)))
					(target nil)
				)
				(reinitUVs) ; On remet à 0 les UVs conseillées
				(format T "Déroulement du raisonnement : ~%")
				(loop while (candidate-rules) do
					; On récupère le but avant, sinon il n'existe plus car on supprime la règle lors de son déclenchement!
					(setq target (caar (getGoal r)))
					; On déclenche la première règle
					(triggerRule r)
					(format T " - Déclenchement de la règle ~S portant sur ~S ~%" r target)
					; Si on a déclenché une UV, alors on décompte en conséquence
					(cond
						((equal target 'NB_UV)
							(format T " 	Alright ! Il te faudrait ~S UVs pour ce semestre ~%" (getValue 'NB_UV))
						)
						((equal target 'NB_CS)
							(format T " 	Je te conseille ~S CS... ~%" (getValue 'NB_CS))
						)
						((equal target 'NB_TM)
							(format T " 	... Ainsi que ~S TM ...~%" (getValue 'NB_TM))
						)
						((equal target 'NB_TSH)
							(format T " 	... Et ~S TSH ! ~%" (getValue 'NB_TSH))
						)

						((member target *listeCS*)
							(setValue 'NB_CS (- (getValue 'NB_CS) 1))
							(format T "   Il semblerait que ~S soit une CS qui pourrait être utile... ~%" target)
						)
						((member target *listeTM*)
							(setValue 'NB_TM (- (getValue 'NB_TM) 1))
							(format T "   Il semblerait que ~S soit une TM qui pourrait être utile... ~%" target)
						)
						((member target *listeTSH*)
							(setValue 'NB_TSH (- (getValue 'NB_TSH) 1))
							(format T "   Il semblerait que ~S soit une TSH qui pourrait être utile... ~%" target)
						)
					)

					; On passe à la règle suivante
					(setq r (car (candidate-rules)))
				)
			)

			; On retourne les UVs ciblées
			(format t "~%")
			(format t "Après examen de ton dossier étudiant, je te conseille les UVs suivantes : ~%")
			(dolist (UV (getTargetedUVs))
				(format t "~S (~S) ~%" UV (getUVCategory UV))
			)
			(format T "~%")
			(cond
				; S'il manque une CS mais qu'on a toutes les TMs
				((and (> (getValue 'NB_CS) 0) (= (getValue 'NB_TM) 0))
					(format T "Il y a ~S CS que je ne peux pas proposer car tu ne possèdes pas les pré-requis nécessaires. ~%Je te suggère de compléter avec ~S TM à la place. Tu peux également prendre une TX/PR.~%" (getValue 'NB_CS) (getValue 'NB_CS))
				)
				((and (> (getValue 'NB_TM) 0) (= (getValue 'NB_CS) 0))
					(format T "Il y a ~S TM que je ne peux pas proposer car tu ne possèdes pas les pré-requis nécessaires. ~%Je te suggère de compléter avec ~S CS à la place. Tu peux également prendre une TX/PR.~%" (getValue 'NB_TM) (getValue 'NB_TM))
				)
				((and (> (getValue 'NB_CS) 0) (> (getValue 'NB_TM) 0))
					(format T "Il y a ~S CS et ~S TM que je ne peux pas proposer car tu ne possèdes pas les pré-requis nécessaires. ~%Une TX ou Pr ne suffira pas à rattraper ton retard. Je suis inquiet pour ton diplôme...~%" (getValue 'NB_CS) (getValue 'NB_TM))
				)
			)
		)
		(format T "Entre d'abord ton dossier étudiant ! ~%")
	)
)