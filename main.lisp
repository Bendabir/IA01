(defun main()
	; Permet de charger le fichier LISP relativement au dossier
	(load (merge-pathnames "services.lisp" *load-truename*))
	(load (merge-pathnames "br.lisp" *load-truename*))

	(defvar *BF* NIL)
	(defvar *listeCS* '(BI01 IA01 MB11 MT09 MT12 NF16 RO05 SR04 SR05 SY02 SY08 IA02 MT10 NF11 RO03 RO04 SR02 SY06 SY09 SY14 SY15)) ;21 CS
	(defvar *listeTM* '(FQ01 GE37 GE38 GE39 GE40 IA03 LO23 MI01 MP03 NA17 NF29 RO06 RV01 SR01 SR06 SY19 SY27 SY31 IA04 LO17 LO21 LO22 MI11 MI12 MP02 NF17 NF26 NF28 SR03 SY26 SY32)) ;31 TM
	(defvar *listeTSH* '(EI03 GE10 GE15 GE21 GE22 GE25 GE27 GE36 HE03 LA00 LA01 LA02 LA03 LA12 LA13 LA20 LA21 LA22 LA23 LG60 LG61 LG62 PH01 PH03 PH10 SI28 SP01 TO01)) ;28 TSH

	;Pas de regles pour obtenir GE25, GE27

	; Affichage du menu
	(displayWelcome)
	(loop while (menu))
	(displayGoodbye)
)

; Pour le moteur, on va partir sur du chainage avant je pense
; Ca me parait plus logique vu qu'on l'on veut arriver à plusieurs UVs proposées
; De toute façon, vu que l'on ne sait pas où l'on veut arriver, le chaînage arrière me parait compliqué
; Pour le parcourt, je pencherai plus pour de la profondeur
; D'abord on détermine le nombre d'UVs à prendre
; Ensuite le nombre d'UV par catégorie
; On choisie les UVs par catégorie
; Bref, c'est de la profondeur

; Algoritme :
; TANT QUE UVs_choisies != 5 ou 6 ou 7 ET analyse = en_cours ET il existe une règle applicable FAIRE
;	R = filtrage(Ensemble_des_règles_applicables) // On filtre pour cibler en profondeur sur les règles applicables
; 	BF = BF + conclusion(R)
; 	BR = BR - R
; FIN_TANT_QUE

; SI UVs_choisies = 5 ou 6 ou 7 ET analyse = terminée ALORS
; 	Afficher les UVs
; SINON
; 	Afficher "Vous êtes dans la merde !"

; Ici, c'est un algo de chainage avant général
; Il faut que le filtrage vise les règles en profondeur pour avoir un algo en profondeur d'abord
; On peut utiliser les faits stockés en dernier pour cela

; (defun chainageAvantProfondeur ()
; 	(let 
; 		(
; 			(L (candidateRules))
; 			(analyse T)
; 			(UVs_Choisies)
; 		)


; 	)
; )

; (defun candidateRules ()
; 	(let (RulesList (flag 0))
; 		(dolist (Rule *BR* (reverse RulesList))
; 			(dolist (Premisse (getPremisses (car Rule)))
; 				(let* ( (attribut (cadr Premisse))
; 						(FactValue (getValue attribut)))
; 					(if (not (checkPremisse Premisse FactValue))
; 						(setq flag 1)
; 					)
; 				)
; 			)
; 			(if (= flag 0)
; 				(push (car Rule) RulesList))
; 			(setq flag 0)
; 		)
; 	)
; )

; Permet de vérifier un premisse
; (defun checkPremisse (P &optional F)
; 	(cond
; 		((equal (car P) 'equal) (equal (caddr P) F))
; 		((equal (car P) '<) (< F (caddr P)))
; 		((equal (car P) '>) (> F (caddr P)))
; 		((equal (car P) '>=) (>= F (caddr P)))
; 		((equal (car P) '<=) (<= F (caddr P)))
; 		((equal (car P) 'or) (let ((result NIL))
; 			(dolist (Q (cdr P))
; 				(setq FactValue (getValue (cadr Q)))
; 				(push (checkPremisse Q FactValue) result)
; 			)
; 			(push 'OR result)
; 			(eval result)
; 		))
; 	)
; )

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
			(eval (list op current-value value))
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
			(if (is-triggerable r)
				; On ne garde que les index des règles
				(push (car r) candidates)
			)
		)
	)
)

; Permet de déclencher une règle
(defun triggerRule (r)
	(let
		; On récupère le but de la fonction
		(
			(goal (car (getGoal r)))
		)
		; On vérifie qu'elle est déclenchable
		(cond
			((is-triggerable r)
				(add2BF goal) ; On ajoute le but dans la BF
				(removeRule r); On supprime la règle de la BR
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
(defun engine ()
	(loop while (candidate-rules)
		(dolist (r (candidate-rules))
			(triggerRule r)
		)
	)
	(getTargetedUVs)
)