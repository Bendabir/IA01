; Ce fichier contient les fonctions relatives à la manipulation de la BF

; Actualiser les credits totaux et les credits CS/TM
(defun refreshCredits ()
	(add2BF (list 'Credits_CSTM (+ (getValue 'Credits_CS) (getValue 'Credits_TM))))
	(add2BF (list 'Credits (+ (getValue 'Credits_CS) (getValue 'Credits_TSH) (getValue 'Credits_TM))))
)

; On affiche la BF sauf les UVs non validées.
(defun displayBF()
	(if (> (getValue 'Semestre) 0)
		(dolist (fait *BF*)
			(if (not (equal "non_validee" (cadr fait)))
				(print fait)
			)
		)
		(format T "Le dossier étudiant n'est pas encore renseigné ! ~%")
	)
)

; Permet d'ajouter un élément (attribut valeur) à la BF
; Si l'attribut existe déjà, on modifie la valeur sinon on l'ajoute
(defun add2BF (element)
	(if (listp element)
		(if (eq (length element) 2)
			(if (assoc (car element) *BF*)
				; Si l'élément existe déjà, on le modifie juste
				(not (null (setValue (car element) (cadr element)))) ; On renvoie vrai
				(not (null (push element *BF*))) ; On renvoie vrai si la modif a eu lieu
			)
			(progn
				(format T "Erreur, l'élèment n'est pas de la forme (nom valeur) ~%")
				(print element)
			)
		)
		(progn
			(format T "Erreur, l'élèment n'est pas une liste ~%")
			(print element)
		)
	)
)

; Permet de réinitialiser la BF
; Sans cela, on est sujet à de gros effets de bords à cause des pointeurs et du cache
(defun initBF ()
	(dolist (fait *BF*)
		(cond
			; Si on a une liste en valeur, alors on passe à nil
			((listp (cadr fait))
				(setf (cadr fait) nil)
			)
			; Si c'est un nombre, on le passe à 0
			((numberp (cadr fait))
				(setf (cadr fait) 0)
			)
			; Si c'est une chaine de longueur <= 5, alors c'est la filière, la période ou la provenance
			((stringp (cadr fait))
				(if (<= (length (cadr fait)) 5)
					(setf (cadr fait) nil)
					(setf (cadr fait) "non_validee")
				)	
			)
		)
	)
)

; Permet de créer une BF à partir de questions posées à l'utilisateur
(defun createBF()
	(initBF) ; Réinitialisation
 	(format T "En quel semestre entrez vous ? GI0X ( X = 1,2,4 ou 5) ~%")
 	(let ((choice (parse-integer (read-line))))
 		(if (not (member choice '(1 2 4 5)))
 			(progn
 				(format T "~S n'est pas un choix correct. ~%" choice)
 				(return-from createBF NIL)
 			)
 			(add2BF (list 'semestre choice))
 		)
 	)
 	(format T "Quelle est la période (A pour Automne, P pour Printemps) ~%")
 	(let ((choice (read-line)))
 		(if (not (superMember choice '("A" "P")))
 			(progn
 				(format T "~S n'est pas un choix correct. ~%" choice)
 				(return-from createBF NIL)
 			)
 			(add2BF (list 'periode choice))
 		)
 	)
 	(format T "Auparavant : TC, Prepa ou IUT ? ~%")
 	(let ((choice (read-line)))
 		(if (not (superMember choice '("TC" "IUT" "Prepa")))
 			(progn
 				(format T "~S n'est pas un choix correct. ~%" choice)
 				(return-from createBF NIL)
 			)
 			(add2BF (list 'provenance choice))
 		)
 	)
 	; Si on est en 2ème année, on demande la filière
 	(if (> (getValue 'semestre) 3)
 		(progn
 			(format T "Quelle est ta filière ? (SRI, ICSI, STRIE, ADEL ou FDD) ~%")
 			(let ((choice (read-line)))
 				(if (not (superMember choice '("SRI" "ICSI" "STRIE" "ADEL" "FDD")))
 					(progn
 						(format T "~S n'est pas un choix correct. ~%" choice)
 						(return-from createBF NIL)
 					)
 					(add2BF (list 'filiere choice))
 				)
 			)
 		)
 		(add2BF '(filiere NIL))
 	)
 	; Aucune UVs de validée en GI01 (on suppose que l'on n'a pas d'avance)
 	(if (> (getValue 'semestre) 1)
 		(progn
 			(let ((answer T))
 				(format T "Quelles sont les UVs déjà validées ? (Entrer NIL pour quitter) ~%")
 				(loop while answer do
 					(setq answer (read))
 					(if (getValue answer)
 						(progn
 							(setValue answer "validee")
 							(if (superMember answer *listeCS*)
 								(setValue 'Credits_CS (+ (getValue 'Credits_CS) 6))
 							)
 							(if (superMember answer *listeTM*)
 								(setValue 'Credits_TM (+ (getValue 'Credits_TM) 6))
 							)
 							(if (superMember answer *listeTSH*)
 								(setValue 'Credits_TSH (+ (getValue 'Credits_TSH) 4))
 							)
 						)
 					)
 				)
 			)
 		)
 	)
 	(refreshCredits) ; Calcul des crédits
 	(format T "Base de faits générée ! ~%")
)

; Génère une BF d'exemple
(defun generateBF ()
	(initBF)

	; On modifie localement
	(let
		(
			(params '(
				(semestre 4)
				(periode "P")
				(provenance "TC")
				(filiere "SRI")
				(Credits_CS 24)
				(Credits_TM 24)
				(Credits_TSH 16)
				(GE37 "validee")
				(LO21 "validee")
				(NF16 "validee")
				(NF17 "validee")
				(IA01 "validee")
				(SR01 "validee")
				(SR02 "validee")
				(SY02 "validee")
				(GE10 "validee")
				(LA12 "validee")
				(LA23 "validee")
				(LG60 "validee")
			))
		)
		(dolist (fait params)
			(add2BF fait)
		)
	)
)