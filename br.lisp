(setq *BR* '(
	; On détermine le nombre d'UVs à prendre
	(R1 ((equal Semestre 1)) (NB_UV 6)) ; 2 cs + 2 tm + 2 tsh = 28 credits --> 32 (4*6 + 2*4)
	(R2 ((equal Semestre 2) (< Credits 25)) (NB_UV 7))
	(R3 ((equal Semestre 2) (> Credits 24)) (NB_UV 6))
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
	(R14 ((equal Semestre 2) (< Credits_TM 12)) (NB_TM 1)) ; 3 ?
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
	

	; Sélection des UVs
	(R33 ((equal Semestre 1) (equal Provenance TC)) (SR01 conseillee))
	(R34 ((equal Semestre 1) (equal Provenance Prepa)) (SR01 conseillee))
	(R35 ((equal Semestre 1) (equal Provenance TC)) (NF16 conseillee))
	(R36 ((equal Semestre 1) (equal Provenance Prepa)) (NF16 conseillee))
	(R37 ((equal Semestre 1) (equal Provenance IUT)) (MB11 conseillee))
	(R38 ((LO21 non_validee) (equal Periode P)) (LO21 conseilee))
	(R39 ((NF17 non_validee) (equal Periode P)) (NF17 conseilee))


	(R40 ((equal Filiere SRI) (equal Periode A) (equal SR04 non_validee)) (SR04 conseillee))
	(R41 ((equal Filiere SRI) (equal Periode A) (equal SR06 non_validee)) (SR06 conseillee))
	(R42 ((equal Filiere SRI) (equal Periode P) (equal SR03 non_validee)) (SR03 conseillee))
	(R43 ((equal Filiere SRI) (equal Periode P) (equal SR05 non_validee)) (SR05 conseillee))
	(R44 ((equal Filiere ADEL) (equal Periode A) (equal MP02 non_validee)) (MP02 conseillee))
	(R45 ((equal Filiere ADEL) (equal Periode A) (equal MP03 non_validee)) (MP03 conseillee))
	(R46 ((equal Filiere ADEL) (equal Periode A) (equal RO06 non_validee)) (RO06 conseillee))
	(R47 ((equal Filiere FDD) (equal Periode A) (equal SY19 non_validee)) (SY19 conseillee))
	(R48 ((equal Filiere FDD) (equal Periode P) (equal SY09 non_validee)) (SY09 conseillee))
	(R49 ((equal Filiere FDD) (equal Periode P) (equal NF26 non_validee)) (NF26 conseillee))
	(R50 ((equal Filiere ICSI) (equal Periode A) (equal NF29 non_validee)) (NF29 conseillee))
	(R51 ((equal Filiere ICSI) (equal Periode A) (equal IA03 non_validee)) (IA03 conseillee))
	(R52 ((equal Filiere ICSI) (equal Periode P) (equal NF28 non_validee)) (NF28 conseillee))
	(R53 ((equal Filiere ICSI) (equal Periode P) (equal IA04 non_validee)) (IA04 conseillee))
	(R54 ((equal Filiere ICSI) (equal Periode P) (equal LO17 non_validee)) (LO17 conseillee))
	(R55 ((equal Filiere STRIE) (equal Periode A) (equal SY23 non_validee)) (SY23 conseillee))
	(R56 ((equal Filiere STRIE) (equal Periode P) (equal SY15 non_validee)) (SY15 conseillee))
	(R57 ((equal Filiere STRIE) (equal Periode P) (equal MI11 non_validee)) (MI11 conseillee))
	(R58 ((equal Filiere STRIE) (equal Periode P) (equal MI12 non_validee)) (MI12 conseillee))

	(R59 ((equal Semestre 2) (equal NF16 validee) (equal Periode P)) (NF17 CONSEILLEE))
	(R60 ((equal Semestre 2) (equal SR01 validee) (equal Periode P)) (SR02 CONSEILLEE))

	; On pond une règle par UV, on affinera par la suite
	; LES CS :
	; Il faut ajouter une condition pour spécifier que ce sont des CS
	(R61 ((<= Semestre 2) (equal IA01 non_validee) (equal Periode A)) (IA01 conseillee))
	(R62 ((<= Semestre 2) (equal MB11 non_validee) (equal Provenance IUT)) (MB11 conseillee))
	(R63 ((<= Semestre 2) (equal MT09 non_validee) (equal Periode A)) (MT09 conseillee))
	(R73 ((<= Semestre 2) (equal MT12 non_validee)) (MT12 conseillee)) ; Pas vraiment de niveau conseillé
	(R65 ((<= Semestre 2) (equal NF16 non_validee)) (NF16 conseillee))
	(R66 ((equal RO05 non_validee) (equal Periode A)) (RO05 conseillee))
	(R67 ((>= Semestre 4) (equal SR04 non_validee) (equal Periode A)) (SR04 conseillee)) ; On pourrait peut-être ajouter une condition sur SR01 ou SR02 validée car il faut des pré-requis en OS
	(R68 ((>= Semestre 4) (equal SR05 non_validee) (equal Periode A) (equal SR01 validee) (equal SR02 validee) (equal RO03 validee) (equal NF16 validee)) (SR05 conseillee))
	(R69 ((<= Semestre 2) (equal SY02 non_validee)) (SY02 conseillee))
	(R70 ((<= Semestre 2) (equal SY08 non_validee) (equal Periode A)) (SY08 conseillee)) ; Pas mal de pré-requis en maths/physique/elec issus du TC
	; BI01 ?
	(R71 ((equal IA02 non_validee) (equal Periode P)) (IA02 conseillee)) ; Pas vraiment de niveau conseillé
	(R72 ((equal MT10 non_validee) (equal Periode P)) (MT10 conseillee)) ; Pas vraiment de niveau conseillé
	(R74 ((>= Semestre 2) (<= Semestre 4) (equal NF11 non_validee) (equal NF16 validee) (equal Periode P)) (NF11 conseillee))
	(R75 ((>= Semestre 2) (<= Semestre 4) (equal RO03 non_validee) (equal NF16 validee) (equal Periode P)) (RO03 conseillee))
	(R76 ((>= Semestre 4) (equal RO04 non_validee) (equal Periode P)) (RO04 conseillee)) ; MT09 pourrait être un pré-requis (sinon MT22/MT23)
	(R77 ((<= Semestre 2) (equal SR02 non_validee) (equal Periode P) (equal SR01 validee)) (SR02 conseillee))
	(R78 ((>= Semestre 2) (<= Semestre 4) (equal SY06 non_validee) (equal Periode P) (equal SY02 validee)) (SY06 conseillee))
	(R79 ((>= Semestre 4) (equal SY09 non_validee) (equal Periode P) (equal SY02 validee)) (SY09 conseillee))
	(R80 ((<= Semestre 2) (equal SY14 non_validee) (equal Periode P)) (SY14 conseillee))
	(R81 ((>= Semestre 4) (equal SY15 non_validee) (equal Periode P) (or (equal SY14 validee) (equal SY04 validee) (equal SY05 validee))) (SY15 conseillee))

	; LES TM :

	)
)
