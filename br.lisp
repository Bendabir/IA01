(setq *BR* '(
	; On détermine le nombre d'UVs à prendre
	(R1 ((equal Semestre 1)) (NB_UV 6))
	(R2 ((equal Semestre 2) (< Credits 27)) (NB_UV 7))
	(R3 ((equal Semestre 2) (> Credits 26)) (NB_UV 6))
	(R4 ((equal Semetre 4) (< Credits 85)) (NB_UV 7))
	(R5 ((equal Semetre 4) (> Credits 84)) (NB_UV 6))
	(R6 ((equal Semestre 5) (< Credits 115)) (NB_UV 7))
	(R7 ((equal Semestre 5) (> Credits 114) (< Credits 127)) (NB_UV 6))
	(R8 ((equal Semestre 5) (> Credits 126)) (NB_UV 5))


	; On détermine le nombre d'UVs à prendre par catégorie
	(R9 ((equal Semestre 1)) (NB_CS 2))
	(R10 ((equal Semestre 1)) (NB_TM 2))
	(R11 ((equal Semestre 1)) (NB_TSH 2))

	(R12 ((equal Semestre 2) (< Credits_CS 12)) (NB_CS 3))
	(R13 ((equal Semestre 2) (> Credits_CS 11)) (NB_CS (- NB_UV 5)))
	(R14 ((equal Semestre 2) (< Credits_TM 12)) (NB_TM 1)) ; 3 plutot ? Sinon c'est light
	(R15 ((equal Semestre 2) (> Credits_TM 11)) (NB_TM (- NB_UV 5)))
	; A revoir je pense que ca va pas : les deux regles ne peuvent pas aller ensemble
	;(R16 ((equal Semestre 2) (< (+ Credits_CS Credits_TM) 24) (< (+ NB_CS NB_TM) 5)) (+ NB_CS 1))
	;(R17 ((equal Semestre 2) (< (+ Credits_CS Credits_TM) 24) (< (+ NB_CS NB_TM) 5)) (+ NB_TM 1))
	(R18 ((equal Semestre 2)) (NB_TSH (- NB_UV (+ NB_CS NB_TM))))

	(R19 ((equal Semetre 4) (< Credits_CS 18)) (NB_CS 1)) ; 3 ?
	(R20 ((equal Semetre 4) (> Credits_CS 17)) (NB_CS (- NB_UV 5)))
	(R21 ((equal Semetre 4) (< Credits_TM 18)) (NB_TM 2)) ; 3 ?
	(R22 ((equal Semetre 4) (> Credits_TM 17)) (NB_TM (- NB_UV 5)))
	; A revoir je pense que ca va pas : les deux regles ne peuvent pas aller ensemble
	;(R23 ((equal Semetre 4) (< (+ Credits_CS Credits_TM) 42) (< (+ NB_CS NB_TM) 5)) (+ NB_CS 1))
	;(R24 ((equal Semetre 4) (< (+ Credits_CS Credits_TM) 42) (< (+ NB_CS NB_TM) 5)) (+ NB_TM 1))
	(R25 ((equal Semetre 4)) (NB_TSH (- NB_UV (+ NB_CS NB_TM))))

	(R26 ((equal Semestre 5) (< Credits_CS 24)) (NB_CS 2)) ; 3? 
	(R27 ((equal Semestre 5) (> Credits_CS 23)) (NB_CS (- NB_UV 5)))
	(R28 ((equal Semestre 5) (< Credits_TM 24)) (NB_TM 2)) ;3?
	(R29 ((equal Semestre 5) (> Credits_TM 23)) (NB_TM (- NB_UV 5)))
	; A revoir je pense que ca va pas : les deux regles ne peuvent pas aller ensemble
	;(R30 ((equal Semestre 5) (< (+ Credits_CS Credits_TM) 42) (< (+ NB_CS NB_TM) 5)) (+ NB_CS 1))
	;(R31 ((equal Semestre 5) (< (+ Credits_CS Credits_TM) 42) (< (+ NB_CS NB_TM) 5)) (+ NB_TM 1))
	(R32 ((equal Semestre 5)) (NB_TSH (- NB_UV (+ NB_CS NB_TM))))

	; Les règles des UVs "obligatoires" pour les filières pourraient se placer comme une "surcouche". On peut quand même choisir ces UVs en dehors de la filière mais si on est dans la filière, le choix se porte plus sur ces UVs
	(R40 ((equal Filiere "SRI") (equal Periode "A") (equal SR04 "non_validee")) (SR04 "conseillee"))
	(R41 ((equal Filiere "SRI") (equal Periode "A") (equal SR06 "non_validee")) (SR06 "conseillee"))
	(R42 ((equal Filiere "SRI") (equal Periode "P") (equal SR03 "non_validee")) (SR03 "conseillee"))
	(R43 ((equal Filiere "SRI") (equal Periode "P") (equal SR05 "non_validee")) (SR05 "conseillee"))
	(R44 ((equal Filiere "ADEL") (equal Periode "A") (equal MP02 "non_validee")) (MP02 "conseillee"))
	(R45 ((equal Filiere "ADEL") (equal Periode "A") (equal MP03 "non_validee")) (MP03 "conseillee"))
	(R46 ((equal Filiere "ADEL") (equal Periode "A") (equal RO06 "non_validee")) (RO06 "conseillee"))
	(R47 ((equal Filiere "FDD") (equal Periode "A") (equal SY19 "non_validee")) (SY19 "conseillee"))
	(R48 ((equal Filiere "FDD") (equal Periode "P") (equal SY09 "non_validee")) (SY09 "conseillee"))
	(R49 ((equal Filiere "FDD") (equal Periode "P") (equal NF26 "non_validee")) (NF26 "conseillee"))
	(R50 ((equal Filiere "ICSI") (equal Periode "A") (equal NF29 "non_validee")) (NF29 "conseillee"))
	(R51 ((equal Filiere "ICSI") (equal Periode "A") (equal IA03 "non_validee")) (IA03 "conseillee"))
	(R52 ((equal Filiere "ICSI") (equal Periode "P") (equal NF28 "non_validee")) (NF28 "conseillee"))
	(R53 ((equal Filiere "ICSI") (equal Periode "P") (equal IA04 "non_validee")) (IA04 "conseillee"))
	(R54 ((equal Filiere "ICSI") (equal Periode "P") (equal LO17 "non_validee")) (LO17 "conseillee"))
	(R56 ((equal Filiere "STRIE") (equal Periode "P") (equal SY15 "non_validee")) (SY15 "conseillee"))
	(R57 ((equal Filiere "STRIE") (equal Periode "P") (equal MI11 "non_validee")) (MI11 "conseillee"))
	(R58 ((equal Filiere "STRIE") (equal Periode "P") (equal MI12 "non_validee")) (MI12 "conseillee"))

	;(R59 ((equal Semestre 2) (equal NF16 "validee") (equal Periode "P")) (NF17 CONSEILLEE))
	;(R60 ((equal Semestre 2) (equal SR01 "validee") (equal Periode "P")) (SR02 CONSEILLEE))

	; On pond une règle par UV, on affinera par la suite
	; LES CS :
	(R61 ((member IA01 CS_CONSEILLEES) (equal IA01 "non_validee") (equal Periode "A")) (IA01 "conseillee"))
	(R62 ((member MB11 CS_CONSEILLEES) (equal MB11 "non_validee") (equal Provenance "IUT")) (MB11 "conseillee"))
	(R63 ((member MT09 CS_CONSEILLEES) (equal MT09 "non_validee") (equal Periode "A")) (MT09 "conseillee"))
	(R73 ((member MT12 CS_CONSEILLEES) (equal MT12 "non_validee")) (MT12 "conseillee")) ; Pas vraiment de niveau conseillé
	(R65 ((member NF16 CS_CONSEILLEES) (equal NF16 "non_validee")) (NF16 "conseillee"))
	(R66 ((member RO05 CS_CONSEILLEES) (equal RO05 "non_validee") (equal Periode "A")) (RO05 "conseillee"))
	(R67 ((member SR04 CS_CONSEILLEES) (equal SR04 "non_validee") (equal Periode "A")) (SR04 "conseillee")) ; On pourrait peut-être ajouter une condition sur SR01 ou SR02 validée car il faut des pré-requis en OS
	(R68 ((member SR05 CS_CONSEILLEES) (equal SR05 "non_validee") (equal Periode "A") (equal SR01 "validee") (equal SR02 "validee") (equal RO03 "validee") (equal NF16 "validee")) (SR05 "conseillee"))
	(R69 ((member SY02 CS_CONSEILLEES) (equal SY02 "non_validee")) (SY02 "conseillee"))
	(R70 ((member SY08 CS_CONSEILLEES) (equal SY08 "non_validee") (equal Periode "A") (equal SY02 "validee")) (SY08 "conseillee")) ; Pas mal de pré-requis en maths/physique/elec issus du "TC"
	(R113 ((member BI01 CS_CONSEILLEES) (equal BI01 "non_validee") (equal Periode "P")) (BI01 "conseillee"))
	(R71 ((member IA02 CS_CONSEILLEES) (equal IA02 "non_validee") (equal Periode "P")) (IA02 "conseillee")) ; Pas vraiment de niveau conseillé
	(R72 ((member MT10 CS_CONSEILLEES) (equal MT10 "non_validee") (equal Periode "P")) (MT10 "conseillee")) ; Pas vraiment de niveau conseillé
	(R74 ((member NF11 CS_CONSEILLEES) (equal NF11 "non_validee") (equal NF16 "validee") (equal Periode "P")) (NF11 "conseillee"))
	(R75 ((member RO03 CS_CONSEILLEES) (equal RO03 "non_validee") (equal NF16 "validee") (equal Periode "P")) (RO03 "conseillee"))
	(R76 ((member RO04 CS_CONSEILLEES) (equal RO04 "non_validee") (equal Periode "P")) (RO04 "conseillee")) ; MT09 pourrait être un pré-requis (sinon MT22/MT23)
	(R77 ((member SR02 CS_CONSEILLEES) (equal SR02 "non_validee") (equal Periode "P") (or (equal SR01 "validee") (equal Provenance "IUT"))) (SR02 "conseillee"))
	(R78 ((member SY06 CS_CONSEILLEES) (equal SY06 "non_validee") (equal Periode "P") (equal SY02 "validee")) (SY06 "conseillee"))
	(R79 ((member SY09 CS_CONSEILLEES) (equal SY09 "non_validee") (equal Periode "P") (equal SY02 "validee")) (SY09 "conseillee"))
	(R80 ((member SY14 CS_CONSEILLEES) (equal SY14 "non_validee") (equal Periode "P")) (SY14 "conseillee"))
	(R81 ((member SY15 CS_CONSEILLEES) (equal SY15 "non_validee") (equal Periode "P") (or (equal SY14 "validee") (equal SY04 "validee") (equal SY05 "validee"))) (SY15 "conseillee"))

	; LES TM :
	(R82 ((member FQ01 TM_CONSEILLEES) (equal FQ01 "non_validee")) (FQ01 "conseillee"))
	(R83 ((member GE37 TM_CONSEILLEES) (equal GE37 "non_validee")) (GE37 "conseillee"))
	(R84 ((member GE38 TM_CONSEILLEES) (equal GE38 "non_validee")) (GE38 "conseillee"))
	(R85 ((member GE39 TM_CONSEILLEES) (equal GE39 "non_validee") (equal GE15 "validee")) (GE39 "conseillee"))
	(R86 ((member GE40 TM_CONSEILLEES) (equal GE40 "non_validee") (equal Periode "A") (equal GE37 "validee") (or (equal GE15 "validee") (equal GE27 "validee"))) (GE40 "conseillee"))
	(R87 ((member IA03 TM_CONSEILLEES) (equal IA03 "non_validee") (equal Periode "A")) (IA03 "conseillee"))
	(R88 ((member LO23 TM_CONSEILLEES) (equal LO23 "non_validee") (equal Periode "A") (equal LO21 "validee")) (LO23 "conseillee"))
	(R89 ((member MI01 TM_CONSEILLEES) (equal MI01 "non_validee") (equal Periode "A")) (MI01 "conseillee"))
	(R90 ((member MP03 TM_CONSEILLEES) (equal MP03 "non_validee") (equal Periode "A")) (MP03 "conseillee"))
	(R91 ((member NA17 TM_CONSEILLEES) (equal NA17 "non_validee") (equal NF17 "non_validee")) (NA17 "conseillee")) ; Passe après NF17 en priorité ?
	(R92 ((member NF29 TM_CONSEILLEES) (equal NF29 "non_validee") (equal Periode "A")) (NF29 "conseillee"))
	(R93 ((member RO06 TM_CONSEILLEES) (equal RO06 "non_validee") (equal Periode "A") (equal NF16 "validee")) (RO06 "conseillee"))
	(R94 ((member RV01 TM_CONSEILLEES) (equal RV01 "non_validee") (equal Periode "A") (or (equal LO12 "validee") (equal NF28 "validee"))) (RV01 "conseillee"))
	(R95 ((member SR01 TM_CONSEILLEES) (equal SR01 "non_validee") (equal Periode "A") (or (equal Provenance "TC") (equal Provenance "Prepa"))) (SR01 "conseillee"))
	(R96 ((member SR06 TM_CONSEILLEES) (equal SR06 "non_validee") (equal Periode "A") (or (equal SR01 "validee") (equal Provenance "IUT")) (equal SR02 "validee") (equal SR03 "validee")) (SR06 "conseillee"))
	(R97 ((member SY19 TM_CONSEILLEES) (equal SY19 "non_validee") (equal Periode "A") (or (equal SR01 "validee") (equal Provenance "IUT")) (equal SY02 "validee")) (SY19 "conseillee"))
	(R98 ((member SY27 TM_CONSEILLEES) (equal SY27 "non_validee") (equal Periode "A") (equal LO21 "validee")) (SY27 "conseillee"))
	(R99 ((member SY31 TM_CONSEILLEES) (equal SY31 "non_validee") (equal Periode "A")) (SY31 "conseillee"))
	(R100 ((member IA04 TM_CONSEILLEES) (equal IA04 "non_validee") (equal Periode "P") (equal LO21 "validee") (equal IA01 "validee") (or (equal SR01 "validee") (equal Provenance "IUT")) (equal SR02 "validee")) (IA04 "conseillee"))
	(R101 ((member LO17 TM_CONSEILLEES) (equal LO17 "non_validee") (equal Periode "P")) (LO17 "conseillee"))
	(R102 ((member LO21 TM_CONSEILLEES) (equal LO21 "non_validee") (equal Periode "P") (or (equal SR01 "validee") (equal Provenance "IUT"))) (LO21 "conseillee"))
	(R103 ((member LO22 TM_CONSEILLEES) (equal LO22 "non_validee") (equal Periode "P")) (LO22 "conseillee"))
	(R104 ((member MI11 TM_CONSEILLEES) (equal MI11 "non_validee") (equal Periode "P") (or (equal SR01 "validee") (equal Provenance "IUT"))) (MI11 "conseillee"))
	(R105 ((member MI12 TM_CONSEILLEES) (equal MI12 "non_validee") (equal Periode "P")) (MI12 "conseillee"))
	(R106 ((member MP02 TM_CONSEILLEES) (equal MP02 "non_validee") (equal Periode "P") (equal GE25 "validee")) (MP02 "conseillee"))
	(R107 ((member NF17 TM_CONSEILLEES) (equal NF17 "non_validee") (equal Periode "P") (equal NA17 "non_validee") ) (NF17 "conseillee"))
	(R108 ((member NF26 TM_CONSEILLEES) (equal NF26 "non_validee") (equal Periode "P") (or (equal SR01 "validee") (equal Provenance "IUT")) (equal SR02 "validee") (equal SY02 "validee") (or (equal NF17 "validee") (equal NA17 "validee"))) (NF26 "conseillee"))
	(R109 ((member NF28 TM_CONSEILLEES) (equal NF28 "non_validee") (equal Periode "P") (equal LO21 "validee")) (NF28 "conseillee"))
	(R110 ((member SR03 TM_CONSEILLEES) (equal SR03 "non_validee") (equal Periode "P") (or (equal SR01 "validee") (equal Provenance "IUT")) (equal SR02 "validee")) (SR03 "conseillee"))
	(R111 ((member SY26 TM_CONSEILLEES) (equal SY26 "non_validee") (equal Periode "P")) (SY26 "conseillee"))
	(R112 ((member SY32 TM_CONSEILLEES) (equal SY32 "non_validee") (equal Periode "P")) (SY32 "conseillee"))

	; LES TSH que l'on prend en compte
	(R114 ((member EI03 TSH_CONSEILLEES) (equal EI03 "non_validee")) (EI03 "conseillee")) ; Communication
	(R115 ((member GE10 TSH_CONSEILLEES) (equal GE10 "non_validee")) (GE10 "conseillee")) ; Economie
	(R116 ((member GE15 TSH_CONSEILLEES) (equal GE15 "non_validee")) (GE15 "conseillee")) ; Entreprise
	(R117 ((member GE21 TSH_CONSEILLEES) (equal GE21 "non_validee")) (GE21 "conseillee")) ; Economie
	(R118 ((member GE22 TSH_CONSEILLEES) (equal GE22 "non_validee")) (GE22 "conseillee")) ; Economie
	(R119 ((member GE36 TSH_CONSEILLEES) (equal GE36 "non_validee")) (GE36 "conseillee")) ; Marketing / Entreprise
	(R120 ((member HE03 TSH_CONSEILLEES) (equal HE03 "non_validee")) (HE03 "conseillee")) ; Logique
	(R121 ((member LA00 TSH_CONSEILLEES) (equal LA00 "non_validee")) (LA00 "conseillee"))
	(R122 ((member LA01 TSH_CONSEILLEES) (equal LA01 "non_validee") (equal LA00 "validee")) (LA01 "conseillee"))
	(R123 ((member LA02 TSH_CONSEILLEES) (equal LA02 "non_validee") (equal LA01 "validee")) (LA02 "conseillee"))
	(R124 ((member LA03 TSH_CONSEILLEES) (equal LA03 "non_validee") (equal LA02 "validee")) (LA03 "conseillee"))
	(R125 ((member LA12 TSH_CONSEILLEES) (equal LA12 "non_validee")) (LA12 "conseillee"))
	(R126 ((member LA13 TSH_CONSEILLEES) (equal LA13 "non_validee") (equal LA12 "validee")) (LA13 "conseillee"))
	(R127 ((member LA20 TSH_CONSEILLEES) (equal LA20 "non_validee")) (LA20 "conseillee"))
	(R128 ((member LA21 TSH_CONSEILLEES) (equal LA21 "non_validee") (equal LA20 "validee")) (LA21 "conseillee"))
	(R129 ((member LA22 TSH_CONSEILLEES) (equal LA22 "non_validee") (equal LA21 "validee")) (LA22 "conseillee"))
	(R130 ((member LA23 TSH_CONSEILLEES) (equal LA23 "non_validee") (equal LA22 "validee")) (LA23 "conseillee"))
	(R131 ((member LG60 TSH_CONSEILLEES) (equal LG60 "non_validee")) (LG60 "conseillee")) ; tching tchong
	(R132 ((member LG61 TSH_CONSEILLEES) (equal LG61 "non_validee") (equal LG60 "validee")) (LG61 "conseillee"))
	(R133 ((member LG62 TSH_CONSEILLEES) (equal LG62 "non_validee") (equal LG61 "validee")) (LG62 "conseillee")) ; Master Tching Tchong 
	(R134 ((member PH01 TSH_CONSEILLEES) (equal PH01 "non_validee")) (PH01 "conseillee")) ; Philo
	(R135 ((member PH03 TSH_CONSEILLEES) (equal PH03 "non_validee")) (PH03 "conseillee")) ; Philo
	(R136 ((member PH10 TSH_CONSEILLEES) (equal PH10 "non_validee")) (PH10 "conseillee")) ; Philo
	(R137 ((member SI28 TSH_CONSEILLEES) (equal SI28 "non_validee")) (SI28 "conseillee")) ; Ecriture interactive et multimedia
	(R138 ((member SP01 TSH_CONSEILLEES) (equal SP01 "non_validee")) (SP01 "conseillee")) ; Sport
	(R139 ((member GE25 TSH_CONSEILLEES) (equal GE25 "non_validee")) (GE25 "conseillee")) ; Eco
	(R140 ((member GE27 TSH_CONSEILLEES) (equal GE27 "non_validee")) (GE27 "conseillee")) ; Eco

	; On fait un semblant de classement pour inférer correctement après
	(R200 ((= Semestre 1)) (CS_conseillees (NF16 MB11 SY02 SR02 IA01 MT09 IA02 MT10 SY08 SY14 RO05)))
	(R201 ((= Semestre 2)) (CS_conseillees (NF16 MB11 SY02 SR02 IA01 MT09 IA02 RO03 MT10 SY08 SY14 NF11 SY06 RO05)))
	(R202 ((= Semestre 4)) (CS_conseillees (RO03 SR04 SR05 RO04 RO05 NF11 MT10 SY06 SY09 SY15 IA02 BI01)))
	(R203 ((= Semestre 5)) (CS_conseillees (SR04 SR05 RO04 RO05 SY09 SY15 MT10 IA02 BI01)))

	(R204 ((= Semestre 1)) (TM_conseillees (SR01 NF17 NA17 LO21 MI01 FQ01 LO22 SY31 IA04)))
	(R205 ((= Semestre 2)) (TM_conseillees (SR01 NF17 NA17 LO21 MI01 GE37 FQ01 LO22 IA04 SY31 SY32)))
	(R206 ((= Semestre 4)) (TM_conseillees (MP03 NF29 RO06 SR03 SR06 SY19 SY27 IA03 IA04 GE37 LO17 MI11 MI12 MP02 NF26 NF28 RV01 GE38 GE39 GE40 SY26 SY31 SY32)))
	(R207 ((= Semestre 5)) (TM_conseillees (MP03 NF29 RO06 SR03 SR06 SY19 SY27 IA03 LO23 GE37 LO17 MI11 MI12 MP02 NF26 NF28 RV01 GE38 GE39 GE40 SY26 SY31)))

	(R208 ((<= Semestre 2)) (TSH_conseillees (LA12 LA13 EI03 GE10 GE15 GE25 GE27 GE21 GE22 GE36 HE03 LA00 LA01 LA02 LA03 LA20 LA21 LA22 LA23 LG60 LG61 LG62 PH01 PH03 PH10 SI28 SP01)))
	(R209 ((>= Semestre 4)) (TSH_conseillees (LA12 LA13 GE10 GE15 GE25 GE27 GE21 GE22 GE36 HE03 LA00 LA01 LA02 LA03 LA20 LA21 LA22 LA23 LG60 LG61 LG62 PH01 PH03 PH10 SI28)))
	)
)