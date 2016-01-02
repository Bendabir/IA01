; Récupérer une règle à partir de son étiquette (ex: R50)
(defun getRule (r)
	(assoc r *BR*)
)

;Recuperer les premisses d'une règle
(defun getPremisses (r)
	(cadr (getRule r))
)

;recuperer la conclusion d'une règle
(defun getGoal (r)
	(cddr (getRule r))
)

(defun removeRule (r)
	; Si la règle existe
	(if (getRule r)
		(setq *BR* (remove (getRule r) *BR*))
	)
)

;Recuperer la valeur d'un élèment dans la BF
(defun getValue (elem)
	(cadr (assoc elem *BF*))
)

(defun setValue (elem value)
	(if (getValue elem)
		(setf (cadr (assoc elem *BF*)) value)
	)
)

(defun displayWelcome()
	(format t "~50%###############################################################~%")
	(format t "#         __~%")
	(format t "# _(\\    |@@|~%")
	(format t "#(__/\\__ \\--/ __~Vd~%" 36 "Bonjour humain UTCéen")
	(format t "#   \\___|----|  |   __~%")
	(format t "#       \\ }{ /\\ )_ / _\\~%")
	(format t "#       /\\__/\\ \\__O (__~Vd~%" 40 "Besoin d'aide pour choisir tes UV ?")
	(format t "#      (--/\\--)    \\__/~Vd~%" 40 "Pas de panique, je suis là !")
	(format t "#      _)(  )(_~Vd~%" 48 "Je vais analyser ton cas puis je")
	(format t "#     `---''---`~Vd~%" 47 "te conseillerai une liste d'UV !")
	(format t "#~%")
	(format t "###############################################################~%")
)

(defun displayGoodbye()
	(format t "~%###############################################################~%")
	(format t "#         __~%")
	(format t "# _(\\    |@@|~%")
	(format t "#(__/\\__ \\--/ __~Vd~%" 36 "En espérant avoir été utile !")
	(format t "#   \\___|----|  |   __~%")
	(format t "#       \\ }{ /\\ )_ / _\\~%")
	(format t "#       /\\__/\\ \\__O (__~Vd~%" 40 "A la rentrée prochaine, humain :)")
	(format t "#      (--/\\--)    \\__/~%")
	(format t "#      _)(  )(_~%" )
	(format t "#     `---''---`~%")
	(format t "#~%")
	(format t "###############################################################~%")
)

;Affichage du menu
(defun menu()
	(format T "~%")
	(format T "_________________________________________________~%")
	(format T "|                     Menu                      |~%")
	(format T "_________________________________________________~%")
	(format T "| Que souhaites-tu faire, humain ?              |~%")
	(format T "| 1 - Voir mon dossier étudiant	                |~%")
	(format T "| 2 - Renseigner mon dossier étudiant           |~%")
	(format T "| 3 - Recherche en chainage avant en profondeur |~%")
	(format T "| 4 - Recherche en chainage avant en largeur (bonus si on veut faire les bg)|~%")
	(format T "| 5 - Je ne veux plus de tes conseils, droïde ! |~%")
	(format T "_________________________________________________~%")
	(format T "~%") ; Petit saut de ligne au calme

	(let
		((choice (read-line)))
		(setq choice (parse-integer choice))
		(cond
			((or (< choice 1) (> choice 5))
				(format T "Ce choix n'est pas valide. ~%")
			)
			((eq choice 1)
				(displayBF)
			)
			((eq choice 2)
				(format T "Voulez-vous prendre un dossier etudiant (pour faire une démo) ou bien construire le tiens ? ~%( Réponses : prefabriquer / initialiser) ~%")
				(let ((answer (read-line)))
				(loop while (and (not (equal answer "prefabriquer")) (not (equal answer "initialiser"))) do
					(print "Veuillez rentrer seulement prefabriquer ou initialiser ")
					(setq answer (read-line))
				)

				(if (equal answer "initialiser")
					(progn
						(format T "C'est parti, on va s'occuper de ton cas ! ~%~%")
						(createBF)
						(displayBF)
					)
					(progn
						(format T "Très bien ! On va prendre le cas de Jean-Karim, un étudiant qui rentre en GI02 !~%~% ")
						(setq *BF* (generateBF))
						(format T "Son dossier etudiant est le suivant : ~%")
						(displayBF)
					)
				)
			))
			((eq choice 5)
				(return-from menu NIL)
			)						
		)
	)
	T
)

;;On affiche la BF sauf les UVs non validées.
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

(defun add2BF (element)
	(if (listp element)
		(if (eq (length element) 2)
			(if (assoc (car element) *BF*)
				; Si l'élément existe déjà, on le modifie juste
				(setValue (car element) (cadr element))
				(push element *BF*)
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

(defun createBF()
	(setq *BF* '(
		(Credits 0)
		(Credits_CS 0)
		(Credits_TM 0)
		(Credits_CSTM (+ Credits_CS  Credits_TM))
		(FQ01 "non_validee")
		(GE37 "non_validee")
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
		(NF17 "non_validee")
		(NF26 "non_validee")
		(NF28 "non_validee")
		(NF29 "non_validee")
		(RO05 "non_validee")
		(RO06 "non_validee")
		(SR01 "non_validee")
		(SR02 "non_validee")
		(SR03 "non_validee")
		(SR04 "non_validee")
		(SR05 "non_validee")
		(SR06 "non_validee")
		(SY02 "non_validee")
		(SY09 "non_validee")
		(SY15 "non_validee")
		(SY19 "non_validee")	
		(SY23 "non_validee")

		(EI03 "non_validee") ; Communication
		(GE10 "non_validee") ; Economie
		(GE15 "non_validee") ; Entreprise
		(GE21 "non_validee") ; Economie
		(GE22 "non_validee") ; Economie
		(GE36 "non_validee") ; Marketing / Entreprise
		(HE03 "non_validee") ; Logique
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
		(LG60 "non_validee") ; tching tchong
		(LG61 "non_validee")
		(LG62 "non_validee") ; Master Tching Tchong 
		(PH01 "non_validee") ; Philo
		(PH03 "non_validee") ; Philo
		(PH10 "non_validee") ; Philo
		(SI28 "non_validee") ; Ecriture interactive et multimedia
		(SP01 "non_validee") ; Sport
		(TO01 "non_validee") ; Preparation au TOEIC
	))
	(format T "En quel semestre entrez vous ? GI0X ( X = 1,2,4 ou 5) ~%")
	(let ((choice (parse-integer (read-line))))
		(if (or (> choice 5) (< choice 1) (eq choice 3) (eq choice 6))
			(progn
				(format T "~S n'est pas un choix correct" choice)
				(return-from createBR NIL)
			)
			(add2BF (list 'semestre choice))
		)
	)
	(format T "Quelle est la période (A pour Automne, P pour Printemps) ~%")
	(let ((choice (read-line)))
		(if (not (or (equal choice "P") (equal choice "A")))
			(progn
				(format T "~S n'est pas un choix correct" choice)
				(return-from createBR NIL)
			)
			(add2BF (list 'periode choice))
		)
	)
	(format T "Auparavant : TC, Prepa ou IUT ? ~%")
	(let ((choice (read-line)))
		(if (not (or (equal choice "TC") (equal choice "IUT") (equal choice "Prepa")))
			(progn
				(format T "~S n'est pas un choix correct" choice)
				(return-from createBR NIL)
			)
			(add2BF (list 'provenance choice))
		)
	)
	(if (> (getValue 'semestre) 3)
		(progn
			(format T "Quelle est ta filière ? (SRI, ICSI, STRIE, ADEL ou FDD) ~%")
			(let ((choice (read-line)))
				(if (not (or (equal choice "SRI") (equal choice "ICSI") (equal choice "STRIE") (equal choice "ADEL") (equal choice "FDD")))
					(progn
						(format T "~S n'est pas un choix correct" choice)
						(return-from createBR NIL)
					)
					(add2BF (list 'filiere choice))
				)
			)
		)
		(add2BF '(filiere NIL))
	)
	(if (> (getValue 'semestre) 1)
		(progn
			(let ((answer T))
				(format T "Quelles sont les UVs déjà validées ? (Entrer NIL pour quitter) ~%")
				(loop while answer do
					(setq answer (read))
					(if (getValue answer)
						(setValue answer "validee"))
				)
			)
		)
	)
	(format T "Base de faits générée ! ~%")
)

(defun generateBF ()
	(list
		'(semestre 2)
		'(periode "P")
		'(provenance "TC")
		'(filiere NIL)
		'(Credits 32)
		'(Credits_CS 18)
		'(Credits_TM 6)
		'(Credits_TSH 8)
		; La ligne du dessous va planter je pense
		'(Credits_CSTM (+ Credits_CS Credits_TM))
		'(FQ01 "non_validee")
		'(GE37 "non_validee")
		'(IA01 "validee")
		'(IA02 "non_validee")
		'(IA03 "non_validee")
		'(IA04 "non_validee")
		'(LO17 "non_validee")
		'(LO21 "non_validee")
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
		'(NF17 "non_validee")
		'(NF26 "non_validee")
		'(NF28 "non_validee")
		'(NF29 "non_validee")
		'(RO05 "non_validee")
		'(RO06 "non_validee")
		'(SR01 "validee")
		'(SR02 "non_validee")
		'(SR03 "non_validee")
		'(SR04 "non_validee")
		'(SR05 "non_validee")
		'(SR06 "non_validee")
		'(SY02 "validee")
		'(SY09 "non_validee")
		'(SY15 "non_validee")
		'(SY19 "non_validee")	
		'(SY23 "non_validee")
		
		'(EI03 "non_validee") ; Communication
		'(GE10 "non_validee") ; Economie
		'(GE15 "non_validee") ; Entreprise
		'(GE21 "non_validee") ; Economie
		'(GE22 "non_validee") ; Economie
		'(GE36 "non_validee") ; Marketing / Entreprise
		'(HE03 "non_validee") ; Logique
		'(LA00 "non_validee")
		'(LA01 "non_validee")
		'(LA02 "non_validee")
		'(LA03 "non_validee")
		'(LA12 "non_validee")
		'(LA13 "non_validee")
		'(LA20 "non_validee")
		'(LA21 "non_validee")
		'(LA22 "non_validee")
		'(LA23 "non_validee")
		'(LG60 "non_validee") ; tching tchong
		'(LG61 "non_validee")
		'(LG62 "non_validee") ; Master Tching Tchong 
		'(PH01 "non_validee") ; Philo
		'(PH03 "non_validee") ; Philo
		'(PH10 "non_validee") ; Philo
		'(SI28 "non_validee") ; Ecriture interactive et multimedia
		'(SP01 "non_validee") ; Sport
		'(TO01 "non_validee") ;Preparation au TOEIC
	)
)