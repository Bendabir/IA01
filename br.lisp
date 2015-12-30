(setq *BR* '(
	(R1 ((equal Semestre 1)) (NB_UV 6)) ; 2 cs + 2 tm + 2 tsh = 28 credits
	(R2 ((equal Semestre 2) (< Credits 25)) (NB_UV 7))
	(R3 ((equal Semestre 2) (> Credits 24)) (NB_UV 6))
	(R4 ((equal Semetre 4) (< Credits 85)) (NB_UV 7))
	(R5 ((equal Semetre 4) (> Credits 84)) (NB_UV 6))
	(R6 ((equal Semestre 5) (< Credits 115)) (NB_UV 7))
	(R7 ((equal Semestre 5) (> Credits 114) (< Credits 127)) (NB_UV 6))
	(R8 ((equal Semestre 5) (> Credits 126)) (NB_UV 5))


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
	
	(R33 ((equal Semestre 1) (equal Provenance TC)) (SR01 CONSEILLEE))
	(R34 ((equal Semestre 1) (equal Provenance Prepa)) (SR01 CONSEILLEE))
	(R35 ((equal Semestre 1) (equal Provenance TC)) (NF16 CONSEILLEE))
	(R36 ((equal Semestre 1) (equal Provenance Prepa)) (NF16 CONSEILLEE))
	(R37 ((equal Semestre 1) (equal Provenance IUT)) (MB11 CONSEILLEE))
	(R38 ((LO21 non_validee) (equal Periode P)) (LO21 conseilee))
	(R39 ((NF17 non_validee) (equal Periode P)) (NF17 conseilee))


	(R40 ((equal Filiere SRI) (equal Periode A) (equal SR04 non_validee)) (SR04 CONSEILLEE))
	(R41 ((equal Filiere SRI) (equal Periode A) (equal SR06 non_validee)) (SR06 CONSEILLEE))
	(R42 ((equal Filiere SRI) (equal Periode P) (equal SR03 non_validee)) (SR03 CONSEILLEE))
	(R43 ((equal Filiere SRI) (equal Periode P) (equal SR05 non_validee)) (SR05 CONSEILLEE))
	(R44 ((equal Filiere ADEL) (equal Periode A) (equal MP02 non_validee)) (MP02 CONSEILLEE))
	(R45 ((equal Filiere ADEL) (equal Periode A) (equal MP03 non_validee)) (MP03 CONSEILLEE))
	(R46 ((equal Filiere ADEL) (equal Periode A) (equal RO06 non_validee)) (RO06 CONSEILLEE))
	(R47 ((equal Filiere FDD) (equal Periode A) (equal SY19 non_validee)) (SY19 CONSEILLEE))
	(R48 ((equal Filiere FDD) (equal Periode P) (equal SY09 non_validee)) (SY09 CONSEILLEE))
	(R49 ((equal Filiere FDD) (equal Periode P) (equal NF26 non_validee)) (NF26 CONSEILLEE))
	(R50 ((equal Filiere ICSI) (equal Periode A) (equal NF29 non_validee)) (NF29 CONSEILLEE))
	(R51 ((equal Filiere ICSI) (equal Periode A) (equal IA03 non_validee)) (IA03 CONSEILLEE))
	(R52 ((equal Filiere ICSI) (equal Periode P) (equal NF28 non_validee)) (NF28 CONSEILLEE))
	(R53 ((equal Filiere ICSI) (equal Periode P) (equal IA04 non_validee)) (IA04 CONSEILLEE))
	(R54 ((equal Filiere ICSI) (equal Periode P) (equal LO17 non_validee)) (LO17 CONSEILLEE))
	(R55 ((equal Filiere STRIE) (equal Periode A) (equal SY23 non_validee)) (SY23 CONSEILLEE))
	(R56 ((equal Filiere STRIE) (equal Periode P) (equal SY15 non_validee)) (SY15 CONSEILLEE))
	(R57 ((equal Filiere STRIE) (equal Periode P) (equal MI11 non_validee)) (MI11 CONSEILLEE))
	(R58 ((equal Filiere STRIE) (equal Periode P) (equal MI12 non_validee)) (MI12 CONSEILLEE))

	(R59 ((equal Semestre 2) (equal NF16 validee) (equal Periode P)) (NF17 CONSEILLEE))
	(R60 ((equal Semestre 2) (equal SR01 validee) (equal Periode P)) (SR02 CONSEILLEE))

	)
)
