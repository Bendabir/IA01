;Recuperer la valeur d'un élèment dans la BF
(defun getValue (elem)
	(cadr (assoc elem *BF*))
)

;Recuperer les premisses d'une règle
(defun getPremisses (r)
	(cadr (assoc r *BR*))
)

;recuperer la conclusion d'une règle
(defun getGoal (r)
	(cddr (assoc r *BR*))
)


;Affichage du menu
(defun displayMenu()
	(format T "_________________________________________________~%")
	(format T "|                     Menu                      |~%")
	(format T "_________________________________________________~%")
	(format T "| Que souhaites-tu faire ?                      |~%")
	(format T "| 1 - Voir la base de fait actuelle             |~%")
	(format T "| 2 - Renseigner tes infos pour conseils        |~%")
	(format T "| 3 - Se barrer d'ici                           |~%")
	(format T "_________________________________________________~%")


)

;;On affiche la BF sauf les UVs non validées.
(defun displayBF()
	(dolist (Fait *BF*)
		(if (not (equal 'NON_VALIDEE (cadr Fait)))
			(print Fait)
		)
	)
)


(defun createBF()
	; A initialiser en dehors de la fonction oupas ?
	(setq *BF* '(
		(Credits 0)
		(Credits_CS 0)
		(Credits_TM 0)
		(Credits_CSTM (+ Credits_CS  Credits_TM))
		(FQ01 non_validee)
		(GE37 non_validee)
		(IA01 non_validee)
		(IA02 non_validee)
		(IA03 non_validee)
		(IA04 non_validee)
		(LO17 non_validee)
		(LO21 non_validee)
		(LO22 non_validee)
		(LO23 non_validee)
		(MB11 non_validee)
		(MI01 non_validee)
		(MI11 non_validee)
		(MI12 non_validee)
		(MP02 non_validee)
		(MP03 non_validee)
		(MT09 non_validee)
		(MT10 non_validee)
		(MT12 non_validee)
		(NF11 non_validee)
		(NF16 non_validee)
		(NF17 non_validee)
		(NF26 non_validee)
		(NF28 non_validee)
		(NF29 non_validee)
		(RO05 non_validee)
		(RO06 non_validee)
		(SR01 non_validee)
		(SR02 non_validee)
		(SR03 non_validee)
		(SR04 non_validee)
		(SR05 non_validee)
		(SR06 non_validee)
		(SY02 non_validee)
		(SY09 non_validee)
		(SY15 non_validee)
		(SY19 non_validee)	
		(SY23 non_validee)

		(EI03 non_validee) ; Communication
		(GE10 non_validee) ; Economie
		(GE15 non_validee) ; Entreprise
		(GE21 non_validee) ; Economie
		(GE22 non_validee) ; Economie
		(GE36 non_validee) ; Marketing / Entreprise
		(HE03 non_validee) ; Logique
		(LA00 non_validee)
		(LA01 non_validee)
		(LA02 non_validee)
		(LA03 non_validee)
		(LA12 non_validee)
		(LA13 non_validee)
		(LA20 non_validee)
		(LA21 non_validee)
		(LA22 non_validee)
		(LA23 non_validee)
		(LG60 non_validee) ; tching tchong
		(LG61 non_validee)
		(LG62 non_validee) ; Master Tching Tchong 
		(PH01 non_validee) ; Philo
		(PH03 non_validee) ; Philo
		(PH10 non_validee) ; Philo
		(SI28 non_validee) ; Ecriture interactive et multimedia
		(SP01 non_validee) ; Sport
		(TO01 non_validee) ;Preparation au TOEIC
	))
	(format T "En quel semestre entrez vous ? GI0X ( X = 1,2,4 ou 5) ~%")
	(let ((choice (parse-integer (read-line))))
		(cond
			((or (> choice 5) (< choice 1) (eq choice 3) (eq choice 6))
				(format T "~S n'est pas un choix correct" choice)
				(return-from createBR NIL))
			((eq choice 5)
				(add2BF '(semestre 5)))
			((eq choice 4)
				(add2BF '(semestre 4)))
			((eq choice 2)
				(add2BF '(semestre 2)))
			(T
				(add2BF '(semestre 1)))
		)
	)
	(format T "Quelle est la période (A pour Automne, P pour Printemps) ~%")
	(let ((choice (read-line)))
		(cond
			((not (or (equal choice "P") (equal choice "A")))
				(format T "~S n'est pas un choix correct" choice)
				(return-from createBR NIL))
			((equal choice "A")
				(add2BF '(periode A)))
			((equal choice "P")
				(add2BF '(periode P)))
		)
	)
	(format T "Auparavant, TC ou IUT ? ~%")
	(let ((choice (read-line)))
		(cond
			((not (or (equal choice "TC") (equal choice "IUT")))
				(format T "~S n'est pas un choix correct" choice)
				(return-from createBR NIL))
			((equal choice "IUT")
				(add2BF '(provenance IUT)))
			((equal choice "TC")
				(add2BF '(provenance TC)))
		)
	)
	(if (> (getValue 'semestre) 3)
		(progn
			(format T "Quelle est ta filière ?(SRI ICSI STRIE ADEL FDD) ~%")
			(let ((choice (read-line)))
				(cond
					((not (or (equal choice "SRI") (equal choice "ICSI") (equal choice "STRIE") (equal choice "ADEL") (equal choice "FDD")))
						(format T "~S n'est pas un choix correct" choice)
						(return-from createBR NIL))
					((equal choice "SRI")
						(add2BF '(filiere SRI)))
					((equal choice "ICSI")
						(add2BF '(filiere ICSI)))
					((equal choice "STRIE")
						(add2BF '(filiere STRIE)))
					((equal choice "ADEL")
						(add2BF '(filiere ADEL)))
					((equal choice "FDD")
						(add2BF '(filiere FDD)))
				)
			)
		)
		(add2BF '(filiere NIL))
	)
	(if (> (getValue 'semestre) 1)
		(progn
			(let ((answer T))
				(format T "Quelle sont les UVs déjà validées ? (Rentrer NIL pour quitter) ~%")
				(loop while (not (equal answer NIL)) do
					(setq answer (read))
					(dolist (fait *bf*) 
						(if (eq answer (car fait))
							(setf (cadr fait) 'VALIDEE))
					)
				)
			)
		)
	)
)


(defun add2BF (element)
	(if (listp element)
		(if (eq (length element) 2)
			(if (assoc (car element) *BF*)
				(progn
					(format T "Attention, l'élèment est déjà renseignée, Ajout avorté ! ~%")
					(print element)
				)
				(push element *BF*)
			)
			(progn
				(format T "Erreur, l'élèment n'est pas de la forme (Nom valeur) ~%")
				(print element)
			)
		)
		(progn
			(format T "Erreur, l'élèment n'est pas une liste ~%")
			(print element)
		)
	)
)

(defun generateBF ()
	(list
		'(semestre 2)
		'(periode P)
		'(provenance TC)
		'(filiere NIL)
		'(Credits 32)
		'(Credits_CS 18)
		'(Credits_TM 6)
		'(Credits_TSH 8)
		; La ligne du dessous va planter je pense
		'(Credits_CSTM (+ Credits_CS Credits_TM))
		'(FQ01 non_validee)
		'(GE37 non_validee)
		'(IA01 validee)
		'(IA02 non_validee)
		'(IA03 non_validee)
		'(IA04 non_validee)
		'(LO17 non_validee)
		'(LO21 non_validee)
		'(LO22 non_validee)
		'(LO23 non_validee)
		'(MB11 non_validee)
		'(MI01 non_validee)
		'(MI11 non_validee)
		'(MI12 non_validee)
		'(MP02 non_validee)
		'(MP03 non_validee)
		'(MT09 non_validee)
		'(MT10 non_validee)
		'(MT12 non_validee)
		'(NF11 non_validee)
		'(NF16 validee)
		'(NF17 non_validee)
		'(NF26 non_validee)
		'(NF28 non_validee)
		'(NF29 non_validee)
		'(RO05 non_validee)
		'(RO06 non_validee)
		'(SR01 validee)
		'(SR02 non_validee)
		'(SR03 non_validee)
		'(SR04 non_validee)
		'(SR05 non_validee)
		'(SR06 non_validee)
		'(SY02 validee)
		'(SY09 non_validee)
		'(SY15 non_validee)
		'(SY19 non_validee)	
		'(SY23 non_validee)
		
		'(EI03 non_validee) ; Communication
		'(GE10 non_validee) ; Economie
		'(GE15 non_validee) ; Entreprise
		'(GE21 non_validee) ; Economie
		'(GE22 non_validee) ; Economie
		'(GE36 non_validee) ; Marketing / Entreprise
		'(HE03 non_validee) ; Logique
		'(LA00 non_validee)
		'(LA01 non_validee)
		'(LA02 non_validee)
		'(LA03 non_validee)
		'(LA12 non_validee)
		'(LA13 non_validee)
		'(LA20 non_validee)
		'(LA21 non_validee)
		'(LA22 non_validee)
		'(LA23 non_validee)
		'(LG60 non_validee) ; tching tchong
		'(LG61 non_validee)
		'(LG62 non_validee) ; Master Tching Tchong 
		'(PH01 non_validee) ; Philo
		'(PH03 non_validee) ; Philo
		'(PH10 non_validee) ; Philo
		'(SI28 non_validee) ; Ecriture interactive et multimedia
		'(SP01 non_validee) ; Sport
		'(TO01 non_validee) ;Preparation au TOEIC
	)
)