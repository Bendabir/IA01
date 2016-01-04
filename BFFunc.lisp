; Ce fichier contient les fonctions relatives à la manipulation de la BF

; Actualiser les credits totaux et les credits CS/TM
(defun refreshCredits ()
	(add2BF (list 'Credits_CSTM (+ (getValue 'Credits_CS) (getValue 'Credits_TM))))
	(add2BF (list 'Credits (+ (getValue 'Credits_CS) (getValue 'Credits_TSH) (getValue 'Credits_TM))))
)

; On affiche la BF sauf les UVs non validées.
(defun displayBF()
	(if *BF*
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

; Permet de créer une BF à partir de questions posées à l'utilisateur
(defun createBF()
 	(setq *BF* '(
 		(Credits_CS 0)
 		(Credits_TM 0)
 		(credits_TSH 0)
 		(CS_POSSIBLES nil)
 		(TM_POSSIBLES nil)
 		(TSH_POSSIBLES nil)
 		(NB_UV 0)
 		(NB_CS 0)
 		(NB_TM 0)
 		(NB_TSH 0)

 		(BI01 "non_validee")
		(FQ01 "non_validee")
		(GE37 "non_validee")
		(GE38 "non_validee")
		(GE39 "non_validee")
		(GE40 "non_validee")
		(IA01 "non_validee")
		(IA02 "non_validee")
		(IA03 "non_validee")
		(IA04 "non_validee")
		(LO17 "non_validee")
		(LO21 "non_validee")
		(LO22 "non_validee")
		(LO23 "non_validee")
		(MB11 "non_validee")
		(MI01 "non_validee")
		(MI11 "non_validee")
		(MI12 "non_validee")
		(MP02 "non_validee")
		(MP03 "non_validee")
		(MT09 "non_validee")
		(MT10 "non_validee")
		(MT12 "non_validee")
		(NF11 "non_validee")
		(NF16 "non_validee")
		(NA17 "non_validee")
		(NF17 "non_validee")
		(NF26 "non_validee")
		(NF28 "non_validee")
		(NF29 "non_validee")
		(RV01 "non_validee")
		(RO03 "non_validee")
		(RO04 "non_validee")
		(RO05 "non_validee")
		(RO06 "non_validee")
		(SR01 "non_validee")
		(SR02 "non_validee")
		(SR03 "non_validee")
		(SR04 "non_validee")
		(SR05 "non_validee")
		(SR06 "non_validee")
		(SY02 "non_validee")
		(SY06 "non_validee")
		(SY08 "non_validee")
		(SY09 "non_validee")
		(SY14 "non_validee")
		(SY15 "non_validee")
		(SY19 "non_validee")	
		(SY26 "non_validee")
		(SY27 "non_validee")
		(SY31 "non_validee")
		(SY32 "non_validee")
		(EI03 "non_validee") ; Communication
		(GE10 "non_validee") ; Economie
		(GE15 "non_validee") ; Entreprise
		(GE21 "non_validee") ; Economie
		(GE22 "non_validee") ; Economie
		(GE25 "non_validee")
		(GE27 "non_validee")
		(GE36 "non_validee") ; Marketing / Entreprise
		(HE03 "non_validee") ; Logique
		(IC05 "non_validee") ; Représentation
		(LA00 "non_validee")
		(LA01 "non_validee")
		(LA02 "non_validee")
		(LA03 "non_validee")
		(LA12 "non_validee")
		(LA13 "non_validee")
		(LA20 "non_validee")
		(LA21 "non_validee")
		(LA22 "non_validee")
		(LA23 "non_validee")
		(LG60 "non_validee") ; Tching Tchong
		(LG61 "non_validee")
		(LG62 "non_validee") ; Master Tching Tchong 
		(PH01 "non_validee") ; Philo
		(PH03 "non_validee") ; Philo
		(PH10 "non_validee") ; Philo
		(SI28 "non_validee") ; Ecriture interactive et multimedia
		(SP01 "non_validee") ; Sport
 	))
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
	(list
		'(semestre 4)
		'(periode "P")
		'(provenance "TC")
		'(filiere "SRI")
		'(Credits_CS 24)
		'(Credits_TM 24)
		'(Credits_TSH 16)
 		'(CS_POSSIBLES nil)
 		'(TM_POSSIBLES nil)
 		'(TSH_POSSIBLES nil)
		'(NB_UV 0)
 		'(NB_CS 0)
 		'(NB_TM 0)
 		'(NB_TSH 0)
		
		'(BI01 "non_validee")
		'(FQ01 "non_validee")
		'(GE37 "validee")
		'(GE38 "non_validee")
		'(GE39 "non_validee")
		'(GE40 "non_validee")
		'(IA01 "validee")
		'(IA02 "non_validee")
		'(IA03 "non_validee")
		'(IA04 "non_validee")
		'(LO17 "non_validee")
		'(LO21 "validee")
		'(LO22 "non_validee")
		'(LO23 "non_validee")
		'(MB11 "non_validee")
		'(MI01 "non_validee")
		'(MI11 "non_validee")
		'(MI12 "non_validee")
		'(MP02 "non_validee")
		'(MP03 "non_validee")
		'(MT09 "non_validee")
		'(MT10 "non_validee")
		'(MT12 "non_validee")
		'(NF11 "non_validee")
		'(NF16 "validee")
		'(NA17 "non_validee")
		'(NF17 "validee")
		'(NF26 "non_validee")
		'(NF28 "non_validee")
		'(NF29 "non_validee")
		'(RV01 "non_validee")
		'(RO03 "non_validee")
		'(RO04 "non_validee")
		'(RO05 "non_validee")
		'(RO06 "non_validee")
		'(SR01 "validee")
		'(SR02 "validee")
		'(SR03 "non_validee")
		'(SR04 "non_validee")
		'(SR05 "non_validee")
		'(SR06 "non_validee")
		'(SY02 "validee")
		'(SY06 "non_validee")
		'(SY08 "non_validee")
		'(SY09 "non_validee")
		'(SY14 "non_validee")
		'(SY15 "non_validee")
		'(SY19 "non_validee")	
		'(SY26 "non_validee")
		'(SY27 "non_validee")
		'(SY31 "non_validee")
		'(SY32 "non_validee")
		'(EI03 "non_validee") ; Communication
		'(GE10 "validee") ; Economie
		'(GE15 "non_validee") ; Entreprise
		'(GE21 "non_validee") ; Economie
		'(GE22 "non_validee") ; Economie
		'(GE25 "non_validee")
		'(GE27 "non_validee")
		'(GE36 "non_validee") ; Marketing / Entreprise
		'(HE03 "non_validee") ; Logique
		'(IC05 "non_validee") ; Représentation
		'(LA00 "non_validee")
		'(LA01 "non_validee")
		'(LA02 "non_validee")
		'(LA03 "non_validee")
		'(LA12 "validee")
		'(LA13 "non_validee")
		'(LA20 "non_validee")
		'(LA21 "non_validee")
		'(LA22 "non_validee")
		'(LA23 "validee")
		'(LG60 "validee") ; Tching Tchong
		'(LG61 "non_validee")
		'(LG62 "non_validee") ; Master Tching Tchong 
		'(PH01 "non_validee") ; Philo
		'(PH03 "non_validee") ; Philo
		'(PH10 "non_validee") ; Philo
		'(SI28 "non_validee") ; Ecriture interactive et multimedia
		'(SP01 "non_validee") ; Sport
	)
)