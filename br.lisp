
; On devrait faire une liste de règles nan ?
; Un peu comme dans le TD :
; (setq BR
;     '(
;         (R1 (B D E) F)
;         (R2 (D G) A)
;         (R3 (C F) A)
;         (R4 (C) D)
;         (R5 (D) E)
;         (R6 (A) H)
;         (R7 (B) X)
;         (R8 (X C) A)
;     )
; )

(setq *BR* '(
	(R1 ((Semestre 1)) (NB_UV 6)) ; 2 cs + 2 tm + 2 tsh = 28 credits
	(R2 ((Semestre 2) (< Credits 25)) (NB_UV 7))
	(R3 ((Semestre 2) (> Credits 24)) (NB_UV 6))
	(R4 ((Semestre 4) (< Credits 85)) (NB_UV 7))
	(R5 ((Semestre 4) (> Credits 84)) (NB_UV 6))
	(R6 ((Semestre 5) (< Credits 115)) (NB_UV 7))
	(R7 ((Semestre 5) (> Credits 114) (< Credits 127)) (NB_UV 6))
	(R8 ((Semestre 5) (> Credits 126)) (NB_UV 5))


	(R9 ((Semestre 1)) (NB_CS 2))
	(R10 ((Semestre 1)) (NB_TM 2))
	(R11 ((Semestre 1)) (NB_TSH 2))

	(R12 ((Semestre 2) (< Credits_CS 12)) (NB_CS 3))
	(R13 ((Semestre 2) (> Credits_CS 11)) (NB_CS (- NB_UV 5)))
	(R14 ((Semestre 2) (< Credits_TM 12)) (NB_TM 1)) ; 3 ?
	(R15 ((Semestre 2) (> Credits_TM 11)) (NB_TM (- NB_UV 5)))
	; A revoir je pense que ca va pas : les deux regles ne peuvent pas aller ensemble
	;(R16 ((Semestre 2) (< (+ Credits_CS Credits_TM) 24) (< (+ NB_CS NB_TM) 5)) (+ NB_CS 1))
	;(R17 ((Semestre 2) (< (+ Credits_CS Credits_TM) 24) (< (+ NB_CS NB_TM) 5)) (+ NB_TM 1))
	(R18 ((Semestre 2)) (NB_TSH (- NB_UV (+ NB_CS NB_TM))))

	(R19 ((Semestre 4) (< Credits_CS 18)) (NB_CS 1)) ; 3 ?
	(R20 ((Semestre 4) (> Credits_CS 17)) (NB_CS (- NB_UV 5)))
	(R21 ((Semestre 4) (< Credits_TM 18)) (NB_TM 2)) ; 3 ?
	(R22 ((Semestre 4) (> Credits_TM 17)) (NB_TM (- NB_UV 5)))
	; A revoir je pense que ca va pas : les deux regles ne peuvent pas aller ensemble
	;(R23 ((Semestre 4) (< (+ Credits_CS Credits_TM) 42) (< (+ NB_CS NB_TM) 5)) (+ NB_CS 1))
	;(R24 ((Semestre 4) (< (+ Credits_CS Credits_TM) 42) (< (+ NB_CS NB_TM) 5)) (+ NB_TM 1))
	(R25 ((Semestre 4)) (NB_TSH (- NB_UV (+ NB_CS NB_TM))))

	(R26 ((Semestre 5) (< Credits_CS 24)) (NB_CS 2)) ; 3? 
	(R27 ((Semestre 5) (> Credits_CS 23)) (NB_CS (- NB_UV 5)))
	(R28 ((Semestre 5) (< Credits_TM 24)) (NB_TM 2)) ;3?
	(R29 ((Semestre 5) (> Credits_TM 23)) (NB_TM (- NB_UV 5)))
	; A revoir je pense que ca va pas : les deux regles ne peuvent pas aller ensemble
	;(R30 ((Semestre 5) (< (+ Credits_CS Credits_TM) 42) (< (+ NB_CS NB_TM) 5)) (+ NB_CS 1))
	;(R31 ((Semestre 5) (< (+ Credits_CS Credits_TM) 42) (< (+ NB_CS NB_TM) 5)) (+ NB_TM 1))
	(R32 ((Semestre 5)) (NB_TSH (- NB_UV (+ NB_CS NB_TM))))
	
	(R33 ((Semestre 1) (Provenance TC)) (SR01 conseillee))
	(R34 ((Semestre 1) (Provenance Prepa)) (SR01 conseillee))
	(R35 ((Semestre 1) (Provenance TC)) (NF16 conseillee))
	(R36 ((Semestre 1) (Provenance Prepa)) (NF16 conseillee))
	(R37 ((Semestre 1) (Provenance IUT)) (MB11 conseillee))
	(R38 ((LO21 non_validee) (Periode P)) (LO21 conseilee))
	(R39 ((NF17 non_validee) (Periode P)) (NF17 conseilee))


	(R40 ((Filiere SRI) (Periode A) (SR04 non_validee)) (SR04 conseilee))
	(R41 ((Filiere SRI) (Periode A) (SR06 non_validee)) (SR06 conseilee))
	(R42 ((Filiere SRI) (Periode P) (SR03 non_validee)) (SR03 conseilee))
	(R43 ((Filiere SRI) (Periode P) (SR05 non_validee)) (SR05 conseilee))
	(R44 ((Filiere ADEL) (Periode A) (MP02 non_validee)) (MP02 conseilee))
	(R45 ((Filiere ADEL) (Periode A) (MP03 non_validee)) (MP03 conseilee))
	(R46 ((Filiere ADEL) (Periode A) (RO06 non_validee)) (RO06 conseilee))
	(R47 ((Filiere FDD) (Periode A) (SY19 non_validee)) (SY19 conseilee))
	(R48 ((Filiere FDD) (Periode P) (SY09 non_validee)) (SY09 conseilee))
	(R49 ((Filiere FDD) (Periode P) (NF26 non_validee)) (NF26 conseilee))
	(R50 ((Filiere ICSI) (Periode A) (NF29 non_validee)) (NF29 conseilee))
	(R51 ((Filiere ICSI) (Periode A) (IA03 non_validee)) (IA03 conseilee))
	(R52 ((Filiere ICSI) (Periode P) (NF28 non_validee)) (NF28 conseilee))
	(R53 ((Filiere ICSI) (Periode P) (IA04 non_validee)) (IA04 conseilee))
	(R54 ((Filiere ICSI) (Periode P) (LO17 non_validee)) (LO17 conseilee))
	(R55 ((Filiere STRIE) (Periode A) (SY23 non_validee)) (SY23 conseilee))
	(R56 ((Filiere STRIE) (Periode P) (SY15 non_validee)) (SY15 conseilee))
	(R57 ((Filiere STRIE) (Periode P) (MI11 non_validee)) (MI11 conseilee))
	(R58 ((Filiere STRIE) (Periode P) (MI12 non_validee)) (MI12 conseilee))

	(R59 ((Semestre 2) (NF16 validee) (Periode P)) (NF17 conseillee))
	(R60 ((Semestre 2) (SR01 validee) (Periode P)) (SR02 conseillee))
	
	)
)
