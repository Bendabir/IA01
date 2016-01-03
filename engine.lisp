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

; Petit affichage pour du debug
(defun debug-candidates-rules ()
	(dolist (x (candidate-rules))
		(print (getRule x)) ; On affiche toute la règle, et pas seulement l'étiquette
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
					(format T " - Déclenchement de ~S (~S) ~%" r target)
					; Si on a déclenché une UV, alors on décompte en conséquence
					(cond
						((member target *listeCS*)
							(setValue 'NB_CS (- (getValue 'NB_CS) 1))
							(format T "   ~S (~S) faisait référence à une CS.~%" r target)
						)
						((member target *listeTM*)
							(setValue 'NB_TM (- (getValue 'NB_TM) 1))
							(format T "   ~S (~S) faisait référence à une TM.~%" r target)
						)
						((member target *listeTSH*)
							(setValue 'NB_TSH (- (getValue 'NB_TSH) 1))
							(format T "   ~S (~S) faisait référence à une TSH.~%" r target)
						)
					)

					; On passe à la règle suivante
					(setq r (car (candidate-rules)))
				)
			)
			; On retourne les UVs ciblées
			(format t "~%") ; Saut de ligne izy
			(format t "Après examen de ton dossier étudiant, je te conseilles les UVs suivantes : ~%")
			(dolist (UV (getTargetedUVs))
				(format t "~S (~S) ~%" UV (getUVCategory UV))
			)
		)
		(format T "Entre d'abord ton dossier étudiant ! ~%")
	)
)