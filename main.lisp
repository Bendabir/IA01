(defun main()
	; Permet de charger le fichier LISP relativement au dossier
	;(load (merge-pathnames "services.lisp" *load-truename*))
	;(load (merge-pathnames "br.lisp" *load-truename*))

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
