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
		(dolist (p premisses OK)
			(setq OK (and OK (checkPremisse p)))
		)
	)
)

(defun candidate-rules ()
	(let
		((candidates nil))
		(dolist (r *BR* (reverse candidates))
			(if (is-triggerable (car r))
				(push (car r) candidates)
			)
		)
	)
)

(defun debug-candidates-rules ()
	(dolist (x (candidate-rules))
		(print (getRule x))
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

; TANT QUE UVs_choisies != 5 ou 6 ou 7 ET analyse = en_cours ET il existe une règle applicable FAIRE
;	R = filtrage(Ensemble_des_règles_applicables) // On filtre pour cibler en profondeur sur les règles applicables
; 	BF = BF + conclusion(R)
; 	BR = BR - R
; FIN_TANT_QUE

; SI UVs_choisies = 5 ou 6 ou 7 ET analyse = terminée ALORS
; 	Afficher les UVs
; SINON
; 	Afficher "Vous êtes dans la merde !"

; Idée générale, faut affiner (notamment dans le choix des UVs etc.)
; (defun engine ()
; 	(loop while (candidate-rules)
; 		(dolist (r (candidate-rules))
; 			(triggerRule r)
; 		)
; 	)
; 	(getTargetedUVs)
; )