(defparameter *BR* '(
	; On détermine le nombre d'UVs à prendre
	(R1 ((= Semestre 1)) (NB_UV 6))
	(R2 ((= Semestre 2) (<= Credits 26)) (NB_UV 7))
	(R3 ((= Semestre 2) (> Credits 26)) (NB_UV 6))
	(R4 ((= Semestre 4) (<= Credits 56)) (NB_UV 7))
	(R5 ((= Semestre 4) (> Credits 56)) (NB_UV 6))
	(R6 ((= Semestre 5) (<= Credits 86)) (NB_UV 7))
	(R7 ((= Semestre 5) (> Credits 86) (<= Credits 97)) (NB_UV 6))
	(R8 ((= Semestre 5) (> Credits 97)) (NB_UV 5))

	; On détermine le nombre d'UVs à prendre par catégorie
	(R9 ((= Semestre 1)) (NB_CS 2))
	(R10 ((= Semestre 1)) (NB_TM 2))
	(R11 ((= Semestre 1)) (NB_TSH 2))

	(R12 ((= Semestre 2) (< Credits_CS 12)) (NB_CS 3))
	(R13 ((= Semestre 2) (> Credits_CS 11)) (NB_CS (- NB_UV 4)))
	(R14 ((= Semestre 2) (< Credits_TM 12)) (NB_TM 3))
	(R15 ((= Semestre 2) (> Credits_TM 11)) (NB_TM (- NB_UV 4)))
	(R18 ((= Semestre 2)) (NB_TSH (- NB_UV (+ NB_CS NB_TM))))

	(R19 ((= Semestre 4) (< Credits_CS 24)) (NB_CS 3)) ; 3 ?
	(R20 ((= Semestre 4) (> Credits_CS 23)) (NB_CS (- NB_UV 4)))
	(R21 ((= Semestre 4) (< Credits_TM 24)) (NB_TM 3)) ; 3 ?
	(R22 ((= Semestre 4) (> Credits_TM 23)) (NB_TM (- NB_UV 4)))
	(R25 ((= Semestre 4)) (NB_TSH (- NB_UV (+ NB_CS NB_TM))))

	(R26 ((= Semestre 5) (< Credits_CS 24)) (NB_CS 3)) ; 3? 
	(R27 ((= Semestre 5) (> Credits_CS 23)) (NB_CS (- NB_UV 4)))
	(R28 ((= Semestre 5) (< Credits_TM 24)) (NB_TM 3)) ;3?
	(R29 ((= Semestre 5) (> Credits_TM 23)) (NB_TM (- NB_UV 4)))
	(R32 ((= Semestre 5)) (NB_TSH (- NB_UV (+ NB_CS NB_TM))))

	; On fait un semblant de classement pour inférer correctement après
	(R200 ((= Semestre 1)) (CS_POSSIBLES (NF16 MB11 SY02 SR02 IA01 MT09 IA02 MT10 SY08 SY14 RO05)))
	(R201 ((= Semestre 2)) (CS_POSSIBLES (NF16 MB11 SY02 SR02 IA01 MT09 IA02 RO03 MT10 SY08 SY14 NF11 SY06 RO05)))
	(R202 ((= Semestre 4)) (CS_POSSIBLES (RO03 SR04 SR05 RO04 RO05 NF11 MT10 SY06 SY09 SY15 IA02 BI01)))
	(R203 ((= Semestre 5)) (CS_POSSIBLES (SR04 SR05 RO04 RO05 SY09 SY15 MT10 IA02 BI01)))

	(R204 ((= Semestre 1)) (TM_POSSIBLES (SR01 NF17 NA17 LO21 MI01 FQ01 LO22 SY31 IA04)))
	(R205 ((= Semestre 2)) (TM_POSSIBLES (SR01 NF17 NA17 LO21 MI01 GE37 FQ01 LO22 IA04 SY31 SY32)))
	(R206 ((= Semestre 4)) (TM_POSSIBLES (MP03 NF29 RO06 SR03 SR06 SY19 SY27 IA03 IA04 GE37 LO17 MI11 MI12 MP02 NF26 NF28 RV01 GE38 GE39 GE40 SY26 SY31 SY32)))
	(R207 ((= Semestre 5)) (TM_POSSIBLES (MP03 NF29 RO06 SR03 SR06 SY19 SY27 IA03 LO23 GE37 LO17 MI11 MI12 MP02 NF26 NF28 RV01 GE38 GE39 GE40 SY26 SY31)))

	(R208 ((<= Semestre 2)) (TSH_POSSIBLES (LA12 LA13 EI03 GE10 GE15 GE25 GE27 GE21 GE22 GE36 HE03 IC05 LA00 LA01 LA02 LA03 LA20 LA21 LA22 LA23 LG60 LG61 LG62 PH01 PH03 PH10 SI28 SP01)))
	(R209 ((>= Semestre 4)) (TSH_POSSIBLES (LA12 LA13 GE10 GE15 GE25 GE27 GE21 GE22 GE36 HE03 IC05 LA00 LA01 LA02 LA03 LA20 LA21 LA22 LA23 LG60 LG61 LG62 PH01 PH03 PH10 SI28)))

	; Les règles des UVs "obligatoires" pour les filières se placent comme une "surcouche". 
	; On peut quand même choisir ces UVs en dehors de la filière mais si on est dans la filière, 
	; le choix se porte plus sur ces UVs
	(R40 ((equal Filiere "SRI") (> NB_CS 0) (equal Periode "A") (equal SR04 "non_validee")) (SR04 "conseillee"))
	(R41 ((equal Filiere "SRI") (> NB_TM 0) (equal Periode "A") (equal SR06 "non_validee")) (SR06 "conseillee"))
	(R42 ((equal Filiere "SRI") (> NB_TM 0) (equal Periode "P") (equal SR03 "non_validee")) (SR03 "conseillee"))
	(R43 ((equal Filiere "SRI") (> NB_CS 0) (equal Periode "P") (equal SR05 "non_validee")) (SR05 "conseillee"))
	(R44 ((equal Filiere "ADEL") (> NB_TM 0) (equal Periode "A") (equal MP02 "non_validee")) (MP02 "conseillee"))
	(R45 ((equal Filiere "ADEL") (> NB_TM 0) (equal Periode "A") (equal MP03 "non_validee")) (MP03 "conseillee"))
	(R46 ((equal Filiere "ADEL") (> NB_TM 0) (equal Periode "A") (equal RO06 "non_validee")) (RO06 "conseillee"))
	(R47 ((equal Filiere "FDD") (> NB_TM 0) (equal Periode "A") (equal SY19 "non_validee")) (SY19 "conseillee"))
	(R48 ((equal Filiere "FDD") (> NB_CS 0) (equal Periode "P") (equal SY09 "non_validee")) (SY09 "conseillee"))
	(R49 ((equal Filiere "FDD") (> NB_TM 0) (equal Periode "P") (equal NF26 "non_validee")) (NF26 "conseillee"))
	(R50 ((equal Filiere "ICSI") (> NB_TM 0) (equal Periode "A") (equal NF29 "non_validee")) (NF29 "conseillee"))
	(R51 ((equal Filiere "ICSI") (> NB_TM 0) (equal Periode "A") (equal IA03 "non_validee")) (IA03 "conseillee"))
	(R52 ((equal Filiere "ICSI") (> NB_TM 0) (equal Periode "P") (equal NF28 "non_validee")) (NF28 "conseillee"))
	(R53 ((equal Filiere "ICSI") (> NB_TM 0) (equal Periode "P") (equal IA04 "non_validee")) (IA04 "conseillee"))
	(R54 ((equal Filiere "ICSI") (> NB_TM 0) (equal Periode "P") (equal LO17 "non_validee")) (LO17 "conseillee"))
	(R56 ((equal Filiere "STRIE") (> NB_CS 0) (equal Periode "P") (equal SY15 "non_validee")) (SY15 "conseillee"))
	(R57 ((equal Filiere "STRIE") (> NB_TM 0) (equal Periode "P") (equal MI11 "non_validee")) (MI11 "conseillee"))
	(R58 ((equal Filiere "STRIE") (> NB_TM 0) (equal Periode "P") (equal MI12 "non_validee")) (MI12 "conseillee"))

	; Une règle par UV
	; On ordonne les UVs selon l'ordre des listes par semestre, histoire de leurs donner des "priorités"
	; LES CS :
	(R77 ((member SR02 CS_POSSIBLES) (> NB_CS 0) (equal SR02 "non_validee") (equal Periode "P") (or (equal SR01 "validee") (equal Provenance "IUT"))) (SR02 "conseillee"))
	(R81 ((member SY15 CS_POSSIBLES) (> NB_CS 0) (equal SY15 "non_validee") (equal Periode "P") (or (equal SY14 "validee") (equal SY04 "validee") (equal SY05 "validee"))) (SY15 "conseillee"))
	(R68 ((member SR05 CS_POSSIBLES) (> NB_CS 0) (equal SR05 "non_validee") (equal Periode "A") (equal SR01 "validee") (equal SR02 "validee") (equal RO03 "validee") (equal NF16 "validee")) (SR05 "conseillee"))
	(R65 ((member NF16 CS_POSSIBLES) (> NB_CS 0) (equal NF16 "non_validee")) (NF16 "conseillee"))
	(R62 ((member MB11 CS_POSSIBLES) (> NB_CS 0) (equal MB11 "non_validee") (equal Provenance "IUT")) (MB11 "conseillee"))
	(R70 ((member SY08 CS_POSSIBLES) (> NB_CS 0) (equal SY08 "non_validee") (equal Periode "A") (equal SY02 "validee")) (SY08 "conseillee")) ; Pas mal de pré-requis en maths/physique/elec issus du "TC"
	(R74 ((member NF11 CS_POSSIBLES) (> NB_CS 0) (equal NF11 "non_validee") (equal NF16 "validee") (equal Periode "P")) (NF11 "conseillee"))
	(R75 ((member RO03 CS_POSSIBLES) (> NB_CS 0) (equal RO03 "non_validee") (equal NF16 "validee") (equal Periode "P")) (RO03 "conseillee"))
	(R61 ((member IA01 CS_POSSIBLES) (> NB_CS 0) (equal IA01 "non_validee") (equal Periode "A")) (IA01 "conseillee"))
	(R63 ((member MT09 CS_POSSIBLES) (> NB_CS 0) (equal MT09 "non_validee") (equal Periode "A")) (MT09 "conseillee"))
	(R78 ((member SY06 CS_POSSIBLES) (> NB_CS 0) (equal SY06 "non_validee") (equal Periode "P") (equal SY02 "validee")) (SY06 "conseillee"))
	(R79 ((member SY09 CS_POSSIBLES) (> NB_CS 0) (equal SY09 "non_validee") (equal Periode "P") (equal SY02 "validee")) (SY09 "conseillee"))
	(R73 ((member MT12 CS_POSSIBLES) (> NB_CS 0) (equal MT12 "non_validee")) (MT12 "conseillee")) ; Pas vraiment de niveau conseillé
	(R66 ((member RO05 CS_POSSIBLES) (> NB_CS 0) (equal RO05 "non_validee") (equal Periode "A")) (RO05 "conseillee"))
	(R67 ((member SR04 CS_POSSIBLES) (> NB_CS 0) (equal SR04 "non_validee") (equal Periode "A")) (SR04 "conseillee")) ; On pourrait peut-être ajouter une condition sur SR01 ou SR02 validée car il faut des pré-requis en OS
	(R69 ((member SY02 CS_POSSIBLES) (> NB_CS 0) (equal SY02 "non_validee")) (SY02 "conseillee"))
	(R113 ((member BI01 CS_POSSIBLES) (> NB_CS 0) (equal BI01 "non_validee") (equal Periode "P")) (BI01 "conseillee"))
	(R71 ((member IA02 CS_POSSIBLES) (> NB_CS 0) (equal IA02 "non_validee") (equal Periode "P")) (IA02 "conseillee")) ; Pas vraiment de niveau conseillé
	(R72 ((member MT10 CS_POSSIBLES) (> NB_CS 0) (equal MT10 "non_validee") (equal Periode "P")) (MT10 "conseillee")) ; Pas vraiment de niveau conseillé
	(R76 ((member RO04 CS_POSSIBLES) (> NB_CS 0) (equal RO04 "non_validee") (equal Periode "P")) (RO04 "conseillee")) ; MT09 pourrait être un pré-requis (sinon MT22/MT23)
	(R80 ((member SY14 CS_POSSIBLES) (> NB_CS 0) (equal SY14 "non_validee") (equal Periode "P")) (SY14 "conseillee"))

	; LES TM :
	(R95 ((member SR01 TM_POSSIBLES) (> NB_TM 0) (equal SR01 "non_validee") (equal Periode "A") (or (equal Provenance "TC") (equal Provenance "Prepa"))) (SR01 "conseillee"))
	(R107 ((member NF17 TM_POSSIBLES) (> NB_TM 0) (equal NF17 "non_validee") (equal Periode "P") (equal NA17 "non_validee") ) (NF17 "conseillee"))
	(R91 ((member NA17 TM_POSSIBLES) (> NB_TM 0) (equal NA17 "non_validee") (equal NF17 "non_validee")) (NA17 "conseillee"))
	(R102 ((member LO21 TM_POSSIBLES) (> NB_TM 0) (equal LO21 "non_validee") (equal Periode "P") (or (equal SR01 "validee") (equal Provenance "IUT"))) (LO21 "conseillee"))
	(R86 ((member GE40 TM_POSSIBLES) (> NB_TM 0) (equal GE40 "non_validee") (equal Periode "A") (equal GE37 "validee") (or (equal GE15 "validee") (equal GE27 "validee"))) (GE40 "conseillee"))
	(R94 ((member RV01 TM_POSSIBLES) (> NB_TM 0) (equal RV01 "non_validee") (equal Periode "A") (or (equal LO12 "validee") (equal NF28 "validee"))) (RV01 "conseillee"))
	(R96 ((member SR06 TM_POSSIBLES) (> NB_TM 0) (equal SR06 "non_validee") (equal Periode "A") (or (equal SR01 "validee") (equal Provenance "IUT")) (equal SR02 "validee") (equal SR03 "validee")) (SR06 "conseillee"))
	(R89 ((member MI01 TM_POSSIBLES) (> NB_TM 0) (equal MI01 "non_validee") (equal Periode "A")) (MI01 "conseillee"))
	(R82 ((member FQ01 TM_POSSIBLES) (> NB_TM 0) (equal FQ01 "non_validee")) (FQ01 "conseillee"))
	(R97 ((member SY19 TM_POSSIBLES) (> NB_TM 0) (equal SY19 "non_validee") (equal Periode "A") (or (equal SR01 "validee") (equal Provenance "IUT")) (equal SY02 "validee")) (SY19 "conseillee"))
	(R100 ((member IA04 TM_POSSIBLES) (> NB_TM 0) (equal IA04 "non_validee") (equal Periode "P") (equal LO21 "validee") (equal IA01 "validee") (or (equal SR01 "validee") (equal Provenance "IUT")) (equal SR02 "validee")) (IA04 "conseillee"))
	(R104 ((member MI11 TM_POSSIBLES) (> NB_TM 0) (equal MI11 "non_validee") (equal Periode "P") (or (equal SR01 "validee") (equal Provenance "IUT"))) (MI11 "conseillee"))
	(R108 ((member NF26 TM_POSSIBLES) (> NB_TM 0) (equal NF26 "non_validee") (equal Periode "P") (or (equal SR01 "validee") (equal Provenance "IUT")) (equal SR02 "validee") (equal SY02 "validee") (or (equal NF17 "validee") (equal NA17 "validee"))) (NF26 "conseillee"))
	(R110 ((member SR03 TM_POSSIBLES) (> NB_TM 0) (equal SR03 "non_validee") (equal Periode "P") (or (equal SR01 "validee") (equal Provenance "IUT")) (equal SR02 "validee")) (SR03 "conseillee"))
	(R88 ((member LO23 TM_POSSIBLES) (> NB_TM 0) (equal LO23 "non_validee") (equal Periode "A") (equal LO21 "validee")) (LO23 "conseillee"))
	(R93 ((member RO06 TM_POSSIBLES) (> NB_TM 0) (equal RO06 "non_validee") (equal Periode "A") (equal NF16 "validee")) (RO06 "conseillee"))
	(R83 ((member GE37 TM_POSSIBLES) (> NB_TM 0) (equal GE37 "non_validee")) (GE37 "conseillee"))
	(R98 ((member SY27 TM_POSSIBLES) (> NB_TM 0) (equal SY27 "non_validee") (equal Periode "A") (equal LO21 "validee")) (SY27 "conseillee"))
	(R106 ((member MP02 TM_POSSIBLES) (> NB_TM 0) (equal MP02 "non_validee") (equal Periode "P") (equal GE25 "validee")) (MP02 "conseillee"))
	(R109 ((member NF28 TM_POSSIBLES) (> NB_TM 0) (equal NF28 "non_validee") (equal Periode "P") (equal LO21 "validee")) (NF28 "conseillee"))
	(R85 ((member GE39 TM_POSSIBLES) (> NB_TM 0) (equal GE39 "non_validee") (equal GE15 "validee")) (GE39 "conseillee"))
	(R84 ((member GE38 TM_POSSIBLES) (> NB_TM 0) (equal GE38 "non_validee")) (GE38 "conseillee"))
	(R87 ((member IA03 TM_POSSIBLES) (> NB_TM 0) (equal IA03 "non_validee") (equal Periode "A")) (IA03 "conseillee"))
	(R90 ((member MP03 TM_POSSIBLES) (> NB_TM 0) (equal MP03 "non_validee") (equal Periode "A")) (MP03 "conseillee"))
	(R92 ((member NF29 TM_POSSIBLES) (> NB_TM 0) (equal NF29 "non_validee") (equal Periode "A")) (NF29 "conseillee"))
	(R99 ((member SY31 TM_POSSIBLES) (> NB_TM 0) (equal SY31 "non_validee") (equal Periode "A")) (SY31 "conseillee"))
	(R101 ((member LO17 TM_POSSIBLES) (> NB_TM 0) (equal LO17 "non_validee") (equal Periode "P")) (LO17 "conseillee"))
	(R103 ((member LO22 TM_POSSIBLES) (> NB_TM 0) (equal LO22 "non_validee") (equal Periode "P")) (LO22 "conseillee"))
	(R105 ((member MI12 TM_POSSIBLES) (> NB_TM 0) (equal MI12 "non_validee") (equal Periode "P")) (MI12 "conseillee"))
	(R111 ((member SY26 TM_POSSIBLES) (> NB_TM 0) (equal SY26 "non_validee") (equal Periode "P")) (SY26 "conseillee"))
	(R112 ((member SY32 TM_POSSIBLES) (> NB_TM 0) (equal SY32 "non_validee") (equal Periode "P")) (SY32 "conseillee"))

	; LES TSH que l'on prend en compte
	(R125 ((member LA12 TSH_POSSIBLES) (> NB_TSH 0) (equal LA12 "non_validee") (equal LA13 "non_validee")) (LA12 "conseillee"))
	(R126 ((member LA13 TSH_POSSIBLES) (> NB_TSH 0) (equal LA13 "non_validee") (equal LA12 "validee")) (LA13 "conseillee"))
	(R129 ((member LA22 TSH_POSSIBLES) (> NB_TSH 0) (equal LA22 "non_validee") (equal LA21 "validee") (equal LA23 "non_validee")) (LA22 "conseillee"))
	(R130 ((member LA23 TSH_POSSIBLES) (> NB_TSH 0) (equal LA23 "non_validee") (equal LA22 "validee")) (LA23 "conseillee"))
	(R132 ((member LG61 TSH_POSSIBLES) (> NB_TSH 0) (equal LG61 "non_validee") (equal LG60 "validee") (equal LG62 "non_validee")) (LG61 "conseillee"))
	(R133 ((member LG62 TSH_POSSIBLES) (> NB_TSH 0) (equal LG62 "non_validee") (equal LG61 "validee")) (LG62 "conseillee")) 
	(R128 ((member LA21 TSH_POSSIBLES) (> NB_TSH 0) (equal LA21 "non_validee") (equal LA20 "validee") (equal LA22 "non_validee") (equal LA23 "non_validee")) (LA21 "conseillee"))
	(R122 ((member LA01 TSH_POSSIBLES) (> NB_TSH 0) (equal LA01 "non_validee") (equal LA00 "validee") (equal LA02 "non_validee") (equal LA03 "non_validee")) (LA01 "conseillee"))
	(R123 ((member LA02 TSH_POSSIBLES) (> NB_TSH 0) (equal LA02 "non_validee") (equal LA01 "validee") (equal LA03 "non_validee")) (LA02 "conseillee"))
	(R124 ((member LA03 TSH_POSSIBLES) (> NB_TSH 0) (equal LA03 "non_validee") (equal LA02 "validee")) (LA03 "conseillee"))
	(R141 ((member IC05 TSH_POSSIBLES) (> NB_TSH 0) (equal IC05 "non_validee")) (IC05 "conseillee")) ; Représentation numérique
	(R137 ((member SI28 TSH_POSSIBLES) (> NB_TSH 0) (equal SI28 "non_validee")) (SI28 "conseillee")) ; Ecriture interactive et multimedia
	(R120 ((member HE03 TSH_POSSIBLES) (> NB_TSH 0) (equal HE03 "non_validee")) (HE03 "conseillee")) ; Logique
	(R114 ((member EI03 TSH_POSSIBLES) (> NB_TSH 0) (equal EI03 "non_validee")) (EI03 "conseillee")) ; Communication
	(R118 ((member GE22 TSH_POSSIBLES) (> NB_TSH 0) (equal GE22 "non_validee")) (GE22 "conseillee")) ; Economie
	(R115 ((member GE10 TSH_POSSIBLES) (> NB_TSH 0) (equal GE10 "non_validee")) (GE10 "conseillee")) ; Economie
	(R119 ((member GE36 TSH_POSSIBLES) (> NB_TSH 0) (equal GE36 "non_validee")) (GE36 "conseillee")) ; Marketing / Entreprise
	(R139 ((member GE25 TSH_POSSIBLES) (> NB_TSH 0) (equal GE25 "non_validee")) (GE25 "conseillee")) ; Eco
	(R140 ((member GE27 TSH_POSSIBLES) (> NB_TSH 0) (equal GE27 "non_validee")) (GE27 "conseillee")) ; Eco
	(R116 ((member GE15 TSH_POSSIBLES) (> NB_TSH 0) (equal GE15 "non_validee")) (GE15 "conseillee")) ; Entreprise
	(R117 ((member GE21 TSH_POSSIBLES) (> NB_TSH 0) (equal GE21 "non_validee")) (GE21 "conseillee")) ; Economie
	(R121 ((member LA00 TSH_POSSIBLES) (> NB_TSH 0) (equal LA00 "non_validee") (equal LA01 "non_validee") (equal LA02 "non_validee") (equal LA03 "non_validee")) (LA00 "conseillee"))
	(R127 ((member LA20 TSH_POSSIBLES) (> NB_TSH 0) (equal LA20 "non_validee") (equal LA21 "non_validee") (equal LA22 "non_validee") (equal LA23 "non_validee")) (LA20 "conseillee"))
	(R131 ((member LG60 TSH_POSSIBLES) (> NB_TSH 0) (equal LG60 "non_validee") (equal LG61 "non_validee") (equal LG62 "non_validee")) (LG60 "conseillee"))
	(R134 ((member PH01 TSH_POSSIBLES) (> NB_TSH 0) (equal PH01 "non_validee")) (PH01 "conseillee")) ; Philo
	(R135 ((member PH03 TSH_POSSIBLES) (> NB_TSH 0) (equal PH03 "non_validee")) (PH03 "conseillee")) ; Philo
	(R136 ((member PH10 TSH_POSSIBLES) (> NB_TSH 0) (equal PH10 "non_validee")) (PH10 "conseillee")) ; Philo
	(R138 ((member SP01 TSH_POSSIBLES) (> NB_TSH 0) (equal SP01 "non_validee")) (SP01 "conseillee")) ; Sport
	)
)

(defparameter *BF* '(
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
 		(SEMESTRE 0)

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

; Ce fichier contient les fonctions outils diverses 


; Récupérer une règle à partir de son étiquette (ex: R50)
(defun getRule (r)
	(assoc r *BR*)
)

; Récupérer les premisses d'une règle
(defun getPremisses (r)
	(cadr (getRule r))
)

; Récupérer la conclusion d'une règle
(defun getGoal (r)
	(cddr (getRule r))
)

; Supprime la règle de la BR
(defun removeRule (r)
	; Si la règle existe
	(if (getRule r)
		(not (null (setq *BR* (remove (getRule r) *BR*)))) ; On retourne vrai si la modificaiton à bien eu lieu (nil lorsque la BR est vide)
		nil ; Si on n'a pas trouvé la règle, on n'a pas pu la supprimer. Logique !
	)	
)

; Recuperer la valeur d'un élèment dans la BF
; Si on passe en paramètre un entier ou une chaine, on retourne cette chaine (sert pour des prédictions par la suite)
(defun getValue (elem)
	(if (or (numberp elem) (stringp elem))
		elem
		(cadr (assoc elem *BF*))
	)
)

; Modifie la valeur d'un élément dans la BF (s'il existe déjà)
(defun setValue (elem value)
	(if (assoc elem *BF*)
		(setf (cadr (assoc elem *BF*)) value)
	)
)

; Permet de dire si un élément est dans une liste, peu importe le type d'élément
; Member ne fonctionne pas avec les chaînes de caractères
(defun superMember (element set)
	(let
		((found nil))
		(dolist (x set found)
			(if (equal x element)
				(setq found T)
			)
		)
	)
)

; Permet de connaitre la catégorie d'une CS
; Renvoie NIL si l'UV est inconnue
(defun getUVCategory (UV)
	(cond
		((member UV *listeCS*)
			'CS
		)
		((member UV *listeTM*)
			'TM
		)
		((member UV *listeTSH*)
			'TSH
		)
	)
)

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
(defun menuSE()
	(format T "~%")
	(format T "_________________________________________________~%")
	(format T "|                     Menu                      |~%")
	(format T "_________________________________________________~%")
	(format T "| Que souhaites-tu faire, humain ?              |~%")
	(format T "| 1 - Voir mon dossier étudiant	                |~%")
	(format T "| 2 - Renseigner mon dossier étudiant           |~%")
	(format T "| 3 - Recherche en chainage avant en profondeur |~%")
	(format T "| 4 - Je ne veux plus de tes conseils, droïde ! |~%")
	(format T "_________________________________________________~%")
	(format T "~%") ; Petit saut de ligne au calme

	(let
		((choice (read-line)))
		(setq choice (parse-integer choice))
		(cond
			((or (< choice 1) (> choice 4))
				(format T "Ce choix n'est pas valide. ~%")
			)
			; Affichage de la BF
			((eq choice 1)
				(displayBF)
			)
			; Choix du dossier
			((eq choice 2)
				(format T "Voulez-vous prendre un dossier etudiant (pour faire une démo) ou bien construire le tiens ? ~%( Réponses : prefabriquer / initialiser) ~%")
				(let ((answer (read-line)))
				(loop while (not (superMember answer '("prefabriquer" "initialiser"))) do
					(format T "Veuillez rentrer seulement prefabriquer ou initialiser :~%")
					(setq answer (read-line))
				)
				(if (equal answer "initialiser")
					(progn
						(format T "C'est parti, on va s'occuper de ton cas ! ~%~%")
						(createBF)
						(displayBF)
					)
					(progn
						(format T "Très bien ! On va prendre le cas de Marie-Héléne, une étudiante qui rentre en GI04 !~%~% ")
						(generateBF)
						(refreshCredits)
						(format T "Son dossier etudiant est le suivant : ~%")
						(displayBF)
					)
				)
			))
			; Recherche d'UVs
			((eq choice 3)
				(engine)
				(defparameter *BR* '(
					; On détermine le nombre d'UVs à prendre
					(R1 ((= Semestre 1)) (NB_UV 6))
					(R2 ((= Semestre 2) (<= Credits 26)) (NB_UV 7))
					(R3 ((= Semestre 2) (> Credits 26)) (NB_UV 6))
					(R4 ((= Semestre 4) (<= Credits 56)) (NB_UV 7))
					(R5 ((= Semestre 4) (> Credits 56)) (NB_UV 6))
					(R6 ((= Semestre 5) (<= Credits 86)) (NB_UV 7))
					(R7 ((= Semestre 5) (> Credits 86) (<= Credits 97)) (NB_UV 6))
					(R8 ((= Semestre 5) (> Credits 97)) (NB_UV 5))

					; On détermine le nombre d'UVs à prendre par catégorie
					(R9 ((= Semestre 1)) (NB_CS 2))
					(R10 ((= Semestre 1)) (NB_TM 2))
					(R11 ((= Semestre 1)) (NB_TSH 2))

					(R12 ((= Semestre 2) (< Credits_CS 12)) (NB_CS 3))
					(R13 ((= Semestre 2) (> Credits_CS 11)) (NB_CS (- NB_UV 4)))
					(R14 ((= Semestre 2) (< Credits_TM 12)) (NB_TM 3))
					(R15 ((= Semestre 2) (> Credits_TM 11)) (NB_TM (- NB_UV 4)))
					(R18 ((= Semestre 2)) (NB_TSH (- NB_UV (+ NB_CS NB_TM))))

					(R19 ((= Semestre 4) (< Credits_CS 24)) (NB_CS 3)) ; 3 ?
					(R20 ((= Semestre 4) (> Credits_CS 23)) (NB_CS (- NB_UV 4)))
					(R21 ((= Semestre 4) (< Credits_TM 24)) (NB_TM 3)) ; 3 ?
					(R22 ((= Semestre 4) (> Credits_TM 23)) (NB_TM (- NB_UV 4)))
					(R25 ((= Semestre 4)) (NB_TSH (- NB_UV (+ NB_CS NB_TM))))

					(R26 ((= Semestre 5) (< Credits_CS 24)) (NB_CS 3)) ; 3? 
					(R27 ((= Semestre 5) (> Credits_CS 23)) (NB_CS (- NB_UV 4)))
					(R28 ((= Semestre 5) (< Credits_TM 24)) (NB_TM 3)) ;3?
					(R29 ((= Semestre 5) (> Credits_TM 23)) (NB_TM (- NB_UV 4)))
					(R32 ((= Semestre 5)) (NB_TSH (- NB_UV (+ NB_CS NB_TM))))

					; On fait un semblant de classement pour inférer correctement après
					(R200 ((= Semestre 1)) (CS_POSSIBLES (NF16 MB11 SY02 SR02 IA01 MT09 IA02 MT10 SY08 SY14 RO05)))
					(R201 ((= Semestre 2)) (CS_POSSIBLES (NF16 MB11 SY02 SR02 IA01 MT09 IA02 RO03 MT10 SY08 SY14 NF11 SY06 RO05)))
					(R202 ((= Semestre 4)) (CS_POSSIBLES (RO03 SR04 SR05 RO04 RO05 NF11 MT10 SY06 SY09 SY15 IA02 BI01)))
					(R203 ((= Semestre 5)) (CS_POSSIBLES (SR04 SR05 RO04 RO05 SY09 SY15 MT10 IA02 BI01)))

					(R204 ((= Semestre 1)) (TM_POSSIBLES (SR01 NF17 NA17 LO21 MI01 FQ01 LO22 SY31 IA04)))
					(R205 ((= Semestre 2)) (TM_POSSIBLES (SR01 NF17 NA17 LO21 MI01 GE37 FQ01 LO22 IA04 SY31 SY32)))
					(R206 ((= Semestre 4)) (TM_POSSIBLES (MP03 NF29 RO06 SR03 SR06 SY19 SY27 IA03 IA04 GE37 LO17 MI11 MI12 MP02 NF26 NF28 RV01 GE38 GE39 GE40 SY26 SY31 SY32)))
					(R207 ((= Semestre 5)) (TM_POSSIBLES (MP03 NF29 RO06 SR03 SR06 SY19 SY27 IA03 LO23 GE37 LO17 MI11 MI12 MP02 NF26 NF28 RV01 GE38 GE39 GE40 SY26 SY31)))

					(R208 ((<= Semestre 2)) (TSH_POSSIBLES (LA12 LA13 EI03 GE10 GE15 GE25 GE27 GE21 GE22 GE36 HE03 IC05 LA00 LA01 LA02 LA03 LA20 LA21 LA22 LA23 LG60 LG61 LG62 PH01 PH03 PH10 SI28 SP01)))
					(R209 ((>= Semestre 4)) (TSH_POSSIBLES (LA12 LA13 GE10 GE15 GE25 GE27 GE21 GE22 GE36 HE03 IC05 LA00 LA01 LA02 LA03 LA20 LA21 LA22 LA23 LG60 LG61 LG62 PH01 PH03 PH10 SI28)))

					; Les règles des UVs "obligatoires" pour les filières se placent comme une "surcouche". 
					; On peut quand même choisir ces UVs en dehors de la filière mais si on est dans la filière, 
					; le choix se porte plus sur ces UVs
					(R40 ((equal Filiere "SRI") (> NB_CS 0) (equal Periode "A") (equal SR04 "non_validee")) (SR04 "conseillee"))
					(R41 ((equal Filiere "SRI") (> NB_TM 0) (equal Periode "A") (equal SR06 "non_validee")) (SR06 "conseillee"))
					(R42 ((equal Filiere "SRI") (> NB_TM 0) (equal Periode "P") (equal SR03 "non_validee")) (SR03 "conseillee"))
					(R43 ((equal Filiere "SRI") (> NB_CS 0) (equal Periode "P") (equal SR05 "non_validee")) (SR05 "conseillee"))
					(R44 ((equal Filiere "ADEL") (> NB_TM 0) (equal Periode "A") (equal MP02 "non_validee")) (MP02 "conseillee"))
					(R45 ((equal Filiere "ADEL") (> NB_TM 0) (equal Periode "A") (equal MP03 "non_validee")) (MP03 "conseillee"))
					(R46 ((equal Filiere "ADEL") (> NB_TM 0) (equal Periode "A") (equal RO06 "non_validee")) (RO06 "conseillee"))
					(R47 ((equal Filiere "FDD") (> NB_TM 0) (equal Periode "A") (equal SY19 "non_validee")) (SY19 "conseillee"))
					(R48 ((equal Filiere "FDD") (> NB_CS 0) (equal Periode "P") (equal SY09 "non_validee")) (SY09 "conseillee"))
					(R49 ((equal Filiere "FDD") (> NB_TM 0) (equal Periode "P") (equal NF26 "non_validee")) (NF26 "conseillee"))
					(R50 ((equal Filiere "ICSI") (> NB_TM 0) (equal Periode "A") (equal NF29 "non_validee")) (NF29 "conseillee"))
					(R51 ((equal Filiere "ICSI") (> NB_TM 0) (equal Periode "A") (equal IA03 "non_validee")) (IA03 "conseillee"))
					(R52 ((equal Filiere "ICSI") (> NB_TM 0) (equal Periode "P") (equal NF28 "non_validee")) (NF28 "conseillee"))
					(R53 ((equal Filiere "ICSI") (> NB_TM 0) (equal Periode "P") (equal IA04 "non_validee")) (IA04 "conseillee"))
					(R54 ((equal Filiere "ICSI") (> NB_TM 0) (equal Periode "P") (equal LO17 "non_validee")) (LO17 "conseillee"))
					(R56 ((equal Filiere "STRIE") (> NB_CS 0) (equal Periode "P") (equal SY15 "non_validee")) (SY15 "conseillee"))
					(R57 ((equal Filiere "STRIE") (> NB_TM 0) (equal Periode "P") (equal MI11 "non_validee")) (MI11 "conseillee"))
					(R58 ((equal Filiere "STRIE") (> NB_TM 0) (equal Periode "P") (equal MI12 "non_validee")) (MI12 "conseillee"))

					; Une règle par UV
					; On ordonne les UVs selon l'ordre des listes par semestre, histoire de leurs donner des "priorités"
					; LES CS :
					(R77 ((member SR02 CS_POSSIBLES) (> NB_CS 0) (equal SR02 "non_validee") (equal Periode "P") (or (equal SR01 "validee") (equal Provenance "IUT"))) (SR02 "conseillee"))
					(R81 ((member SY15 CS_POSSIBLES) (> NB_CS 0) (equal SY15 "non_validee") (equal Periode "P") (or (equal SY14 "validee") (equal SY04 "validee") (equal SY05 "validee"))) (SY15 "conseillee"))
					(R68 ((member SR05 CS_POSSIBLES) (> NB_CS 0) (equal SR05 "non_validee") (equal Periode "A") (equal SR01 "validee") (equal SR02 "validee") (equal RO03 "validee") (equal NF16 "validee")) (SR05 "conseillee"))
					(R65 ((member NF16 CS_POSSIBLES) (> NB_CS 0) (equal NF16 "non_validee")) (NF16 "conseillee"))
					(R62 ((member MB11 CS_POSSIBLES) (> NB_CS 0) (equal MB11 "non_validee") (equal Provenance "IUT")) (MB11 "conseillee"))
					(R70 ((member SY08 CS_POSSIBLES) (> NB_CS 0) (equal SY08 "non_validee") (equal Periode "A") (equal SY02 "validee")) (SY08 "conseillee")) ; Pas mal de pré-requis en maths/physique/elec issus du "TC"
					(R74 ((member NF11 CS_POSSIBLES) (> NB_CS 0) (equal NF11 "non_validee") (equal NF16 "validee") (equal Periode "P")) (NF11 "conseillee"))
					(R75 ((member RO03 CS_POSSIBLES) (> NB_CS 0) (equal RO03 "non_validee") (equal NF16 "validee") (equal Periode "P")) (RO03 "conseillee"))
					(R61 ((member IA01 CS_POSSIBLES) (> NB_CS 0) (equal IA01 "non_validee") (equal Periode "A")) (IA01 "conseillee"))
					(R63 ((member MT09 CS_POSSIBLES) (> NB_CS 0) (equal MT09 "non_validee") (equal Periode "A")) (MT09 "conseillee"))
					(R78 ((member SY06 CS_POSSIBLES) (> NB_CS 0) (equal SY06 "non_validee") (equal Periode "P") (equal SY02 "validee")) (SY06 "conseillee"))
					(R79 ((member SY09 CS_POSSIBLES) (> NB_CS 0) (equal SY09 "non_validee") (equal Periode "P") (equal SY02 "validee")) (SY09 "conseillee"))
					(R73 ((member MT12 CS_POSSIBLES) (> NB_CS 0) (equal MT12 "non_validee")) (MT12 "conseillee")) ; Pas vraiment de niveau conseillé
					(R66 ((member RO05 CS_POSSIBLES) (> NB_CS 0) (equal RO05 "non_validee") (equal Periode "A")) (RO05 "conseillee"))
					(R67 ((member SR04 CS_POSSIBLES) (> NB_CS 0) (equal SR04 "non_validee") (equal Periode "A")) (SR04 "conseillee")) ; On pourrait peut-être ajouter une condition sur SR01 ou SR02 validée car il faut des pré-requis en OS
					(R69 ((member SY02 CS_POSSIBLES) (> NB_CS 0) (equal SY02 "non_validee")) (SY02 "conseillee"))
					(R113 ((member BI01 CS_POSSIBLES) (> NB_CS 0) (equal BI01 "non_validee") (equal Periode "P")) (BI01 "conseillee"))
					(R71 ((member IA02 CS_POSSIBLES) (> NB_CS 0) (equal IA02 "non_validee") (equal Periode "P")) (IA02 "conseillee")) ; Pas vraiment de niveau conseillé
					(R72 ((member MT10 CS_POSSIBLES) (> NB_CS 0) (equal MT10 "non_validee") (equal Periode "P")) (MT10 "conseillee")) ; Pas vraiment de niveau conseillé
					(R76 ((member RO04 CS_POSSIBLES) (> NB_CS 0) (equal RO04 "non_validee") (equal Periode "P")) (RO04 "conseillee")) ; MT09 pourrait être un pré-requis (sinon MT22/MT23)
					(R80 ((member SY14 CS_POSSIBLES) (> NB_CS 0) (equal SY14 "non_validee") (equal Periode "P")) (SY14 "conseillee"))

					; LES TM :
					(R95 ((member SR01 TM_POSSIBLES) (> NB_TM 0) (equal SR01 "non_validee") (equal Periode "A") (or (equal Provenance "TC") (equal Provenance "Prepa"))) (SR01 "conseillee"))
					(R107 ((member NF17 TM_POSSIBLES) (> NB_TM 0) (equal NF17 "non_validee") (equal Periode "P") (equal NA17 "non_validee") ) (NF17 "conseillee"))
					(R91 ((member NA17 TM_POSSIBLES) (> NB_TM 0) (equal NA17 "non_validee") (equal NF17 "non_validee")) (NA17 "conseillee"))
					(R102 ((member LO21 TM_POSSIBLES) (> NB_TM 0) (equal LO21 "non_validee") (equal Periode "P") (or (equal SR01 "validee") (equal Provenance "IUT"))) (LO21 "conseillee"))
					(R86 ((member GE40 TM_POSSIBLES) (> NB_TM 0) (equal GE40 "non_validee") (equal Periode "A") (equal GE37 "validee") (or (equal GE15 "validee") (equal GE27 "validee"))) (GE40 "conseillee"))
					(R94 ((member RV01 TM_POSSIBLES) (> NB_TM 0) (equal RV01 "non_validee") (equal Periode "A") (or (equal LO12 "validee") (equal NF28 "validee"))) (RV01 "conseillee"))
					(R96 ((member SR06 TM_POSSIBLES) (> NB_TM 0) (equal SR06 "non_validee") (equal Periode "A") (or (equal SR01 "validee") (equal Provenance "IUT")) (equal SR02 "validee") (equal SR03 "validee")) (SR06 "conseillee"))
					(R89 ((member MI01 TM_POSSIBLES) (> NB_TM 0) (equal MI01 "non_validee") (equal Periode "A")) (MI01 "conseillee"))
					(R82 ((member FQ01 TM_POSSIBLES) (> NB_TM 0) (equal FQ01 "non_validee")) (FQ01 "conseillee"))
					(R97 ((member SY19 TM_POSSIBLES) (> NB_TM 0) (equal SY19 "non_validee") (equal Periode "A") (or (equal SR01 "validee") (equal Provenance "IUT")) (equal SY02 "validee")) (SY19 "conseillee"))
					(R100 ((member IA04 TM_POSSIBLES) (> NB_TM 0) (equal IA04 "non_validee") (equal Periode "P") (equal LO21 "validee") (equal IA01 "validee") (or (equal SR01 "validee") (equal Provenance "IUT")) (equal SR02 "validee")) (IA04 "conseillee"))
					(R104 ((member MI11 TM_POSSIBLES) (> NB_TM 0) (equal MI11 "non_validee") (equal Periode "P") (or (equal SR01 "validee") (equal Provenance "IUT"))) (MI11 "conseillee"))
					(R108 ((member NF26 TM_POSSIBLES) (> NB_TM 0) (equal NF26 "non_validee") (equal Periode "P") (or (equal SR01 "validee") (equal Provenance "IUT")) (equal SR02 "validee") (equal SY02 "validee") (or (equal NF17 "validee") (equal NA17 "validee"))) (NF26 "conseillee"))
					(R110 ((member SR03 TM_POSSIBLES) (> NB_TM 0) (equal SR03 "non_validee") (equal Periode "P") (or (equal SR01 "validee") (equal Provenance "IUT")) (equal SR02 "validee")) (SR03 "conseillee"))
					(R88 ((member LO23 TM_POSSIBLES) (> NB_TM 0) (equal LO23 "non_validee") (equal Periode "A") (equal LO21 "validee")) (LO23 "conseillee"))
					(R93 ((member RO06 TM_POSSIBLES) (> NB_TM 0) (equal RO06 "non_validee") (equal Periode "A") (equal NF16 "validee")) (RO06 "conseillee"))
					(R83 ((member GE37 TM_POSSIBLES) (> NB_TM 0) (equal GE37 "non_validee")) (GE37 "conseillee"))
					(R98 ((member SY27 TM_POSSIBLES) (> NB_TM 0) (equal SY27 "non_validee") (equal Periode "A") (equal LO21 "validee")) (SY27 "conseillee"))
					(R106 ((member MP02 TM_POSSIBLES) (> NB_TM 0) (equal MP02 "non_validee") (equal Periode "P") (equal GE25 "validee")) (MP02 "conseillee"))
					(R109 ((member NF28 TM_POSSIBLES) (> NB_TM 0) (equal NF28 "non_validee") (equal Periode "P") (equal LO21 "validee")) (NF28 "conseillee"))
					(R85 ((member GE39 TM_POSSIBLES) (> NB_TM 0) (equal GE39 "non_validee") (equal GE15 "validee")) (GE39 "conseillee"))
					(R84 ((member GE38 TM_POSSIBLES) (> NB_TM 0) (equal GE38 "non_validee")) (GE38 "conseillee"))
					(R87 ((member IA03 TM_POSSIBLES) (> NB_TM 0) (equal IA03 "non_validee") (equal Periode "A")) (IA03 "conseillee"))
					(R90 ((member MP03 TM_POSSIBLES) (> NB_TM 0) (equal MP03 "non_validee") (equal Periode "A")) (MP03 "conseillee"))
					(R92 ((member NF29 TM_POSSIBLES) (> NB_TM 0) (equal NF29 "non_validee") (equal Periode "A")) (NF29 "conseillee"))
					(R99 ((member SY31 TM_POSSIBLES) (> NB_TM 0) (equal SY31 "non_validee") (equal Periode "A")) (SY31 "conseillee"))
					(R101 ((member LO17 TM_POSSIBLES) (> NB_TM 0) (equal LO17 "non_validee") (equal Periode "P")) (LO17 "conseillee"))
					(R103 ((member LO22 TM_POSSIBLES) (> NB_TM 0) (equal LO22 "non_validee") (equal Periode "P")) (LO22 "conseillee"))
					(R105 ((member MI12 TM_POSSIBLES) (> NB_TM 0) (equal MI12 "non_validee") (equal Periode "P")) (MI12 "conseillee"))
					(R111 ((member SY26 TM_POSSIBLES) (> NB_TM 0) (equal SY26 "non_validee") (equal Periode "P")) (SY26 "conseillee"))
					(R112 ((member SY32 TM_POSSIBLES) (> NB_TM 0) (equal SY32 "non_validee") (equal Periode "P")) (SY32 "conseillee"))

					; LES TSH que l'on prend en compte
					(R125 ((member LA12 TSH_POSSIBLES) (> NB_TSH 0) (equal LA12 "non_validee") (equal LA13 "non_validee")) (LA12 "conseillee"))
					(R126 ((member LA13 TSH_POSSIBLES) (> NB_TSH 0) (equal LA13 "non_validee") (equal LA12 "validee")) (LA13 "conseillee"))
					(R129 ((member LA22 TSH_POSSIBLES) (> NB_TSH 0) (equal LA22 "non_validee") (equal LA21 "validee") (equal LA23 "non_validee")) (LA22 "conseillee"))
					(R130 ((member LA23 TSH_POSSIBLES) (> NB_TSH 0) (equal LA23 "non_validee") (equal LA22 "validee")) (LA23 "conseillee"))
					(R132 ((member LG61 TSH_POSSIBLES) (> NB_TSH 0) (equal LG61 "non_validee") (equal LG60 "validee") (equal LG62 "non_validee")) (LG61 "conseillee"))
					(R133 ((member LG62 TSH_POSSIBLES) (> NB_TSH 0) (equal LG62 "non_validee") (equal LG61 "validee")) (LG62 "conseillee")) 
					(R128 ((member LA21 TSH_POSSIBLES) (> NB_TSH 0) (equal LA21 "non_validee") (equal LA20 "validee") (equal LA22 "non_validee") (equal LA23 "non_validee")) (LA21 "conseillee"))
					(R122 ((member LA01 TSH_POSSIBLES) (> NB_TSH 0) (equal LA01 "non_validee") (equal LA00 "validee") (equal LA02 "non_validee") (equal LA03 "non_validee")) (LA01 "conseillee"))
					(R123 ((member LA02 TSH_POSSIBLES) (> NB_TSH 0) (equal LA02 "non_validee") (equal LA01 "validee") (equal LA03 "non_validee")) (LA02 "conseillee"))
					(R124 ((member LA03 TSH_POSSIBLES) (> NB_TSH 0) (equal LA03 "non_validee") (equal LA02 "validee")) (LA03 "conseillee"))
					(R141 ((member IC05 TSH_POSSIBLES) (> NB_TSH 0) (equal IC05 "non_validee")) (IC05 "conseillee")) ; Représentation numérique
					(R137 ((member SI28 TSH_POSSIBLES) (> NB_TSH 0) (equal SI28 "non_validee")) (SI28 "conseillee")) ; Ecriture interactive et multimedia
					(R120 ((member HE03 TSH_POSSIBLES) (> NB_TSH 0) (equal HE03 "non_validee")) (HE03 "conseillee")) ; Logique
					(R114 ((member EI03 TSH_POSSIBLES) (> NB_TSH 0) (equal EI03 "non_validee")) (EI03 "conseillee")) ; Communication
					(R118 ((member GE22 TSH_POSSIBLES) (> NB_TSH 0) (equal GE22 "non_validee")) (GE22 "conseillee")) ; Economie
					(R115 ((member GE10 TSH_POSSIBLES) (> NB_TSH 0) (equal GE10 "non_validee")) (GE10 "conseillee")) ; Economie
					(R119 ((member GE36 TSH_POSSIBLES) (> NB_TSH 0) (equal GE36 "non_validee")) (GE36 "conseillee")) ; Marketing / Entreprise
					(R139 ((member GE25 TSH_POSSIBLES) (> NB_TSH 0) (equal GE25 "non_validee")) (GE25 "conseillee")) ; Eco
					(R140 ((member GE27 TSH_POSSIBLES) (> NB_TSH 0) (equal GE27 "non_validee")) (GE27 "conseillee")) ; Eco
					(R116 ((member GE15 TSH_POSSIBLES) (> NB_TSH 0) (equal GE15 "non_validee")) (GE15 "conseillee")) ; Entreprise
					(R117 ((member GE21 TSH_POSSIBLES) (> NB_TSH 0) (equal GE21 "non_validee")) (GE21 "conseillee")) ; Economie
					(R121 ((member LA00 TSH_POSSIBLES) (> NB_TSH 0) (equal LA00 "non_validee") (equal LA01 "non_validee") (equal LA02 "non_validee") (equal LA03 "non_validee")) (LA00 "conseillee"))
					(R127 ((member LA20 TSH_POSSIBLES) (> NB_TSH 0) (equal LA20 "non_validee") (equal LA21 "non_validee") (equal LA22 "non_validee") (equal LA23 "non_validee")) (LA20 "conseillee"))
					(R131 ((member LG60 TSH_POSSIBLES) (> NB_TSH 0) (equal LG60 "non_validee") (equal LG61 "non_validee") (equal LG62 "non_validee")) (LG60 "conseillee"))
					(R134 ((member PH01 TSH_POSSIBLES) (> NB_TSH 0) (equal PH01 "non_validee")) (PH01 "conseillee")) ; Philo
					(R135 ((member PH03 TSH_POSSIBLES) (> NB_TSH 0) (equal PH03 "non_validee")) (PH03 "conseillee")) ; Philo
					(R136 ((member PH10 TSH_POSSIBLES) (> NB_TSH 0) (equal PH10 "non_validee")) (PH10 "conseillee")) ; Philo
					(R138 ((member SP01 TSH_POSSIBLES) (> NB_TSH 0) (equal SP01 "non_validee")) (SP01 "conseillee")) ; Sport
					)
				) ; On recharge la BF
			)
			; Quitter
			((eq choice 4)
				(return-from menuSE NIL)
			)						
		)
	)
	T ; On retourne T pour boucler dans le main. Seul l'option quitter renvoie NIL, ce qui permet de sortir de la boucle
)

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

(defun main()
	; Permet de charger le fichier LISP relativement au dossier
	(defvar *location* "D:/Benjamin/Documents/UTC/GI01/IA01/TPs/TP3/")
	;(defvar *location* "/home/valentin/git/IA01/")
	(defvar *BRLocation* (concatenate 'string *location* "br.lisp"))

	; (load (concatenate 'string *location* "engine.lisp"))
	; (load (concatenate 'string *location* "menuFunc.lisp"))
	; (load (concatenate 'string *location* "tools.lisp"))
	; (load (concatenate 'string *location* "BFFunc.lisp"))
	; (load (concatenate 'string *location* "bf.lisp"))
	; (load *BRLocation*)

	; Pour le calcul des crédits
	(defvar *listeCS* '(BI01 IA01 MB11 MT09 MT12 NF16 RO05 SR04 SR05 SY02 SY08 IA02 MT10 NF11 RO03 RO04 SR02 SY06 SY09 SY14 SY15)) ;21 CS
	(defvar *listeTM* '(FQ01 GE37 GE38 GE39 GE40 IA03 LO23 MI01 MP03 NA17 NF29 RO06 RV01 SR01 SR06 SY19 SY27 SY31 IA04 LO17 LO21 LO22 MI11 MI12 MP02 NF17 NF26 NF28 SR03 SY26 SY32)) ;31 TM
	(defvar *listeTSH* '(EI03 GE10 GE15 GE21 GE22 GE25 GE27 GE36 HE03 IC05 LA00 LA01 LA02 LA03 LA12 LA13 LA20 LA21 LA22 LA23 LG60 LG61 LG62 PH01 PH03 PH10 SI28 SP01 TO01)) ;28 TSH

	; Affichage du menu
	(displayWelcome)
	(loop while (menuSE))
	(displayGoodbye)
)

; Lancement automatique
(main)