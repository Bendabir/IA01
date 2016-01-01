; Permet de charger le fichier LISP relativement au dossier
(load (merge-pathnames "services.lisp" *load-truename*))
(load (merge-pathnames "br.lisp" *load-truename*))

; Plutôt passer sur de la variable globale avec un defparameter ou équivalent ? J'me rappelle plus du cours 
;(setq *BF* NIL)
(defvar *BF* NIL)

(defun main()

	(format T "Salut mon ami ! Si tu es là c'est que tu es une peu perdu pour choisir ~%")
	(format T "tes UVs. Mais pas de problème, j'ai la solution ! Je vais te poser ~%")
	(format T "quelques questions sur ton parcours à l'UTC et à partir de ça, je vais te ~%")
	(format T "suggérer un ensemble d'UVs que tu pourrais faire ce semestre ! ~%")
	(format T " ~%")

	(format T "Voulez-vous prendre un dossier etudiant (pour faire une démo) ou bien construire le tiens ? ~%( Réponses : prefabriquer / initialiser) ~%")
		(let ((answer (read-line)))

		; Check reponse correcte
		; Le loop while, ça dégage, on l'a pas vu en cours !
		; Elle adit quec c'était une macro et ca marche :(
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
	)
)

; Pour le moteur, on va partir sur du chainage avant je pense
; Ca me parait plus logique vu qu'on l'on veut arriver à plusieurs UVs proposées
; De toute façon, vu que l'on ne sait pas où l'on veut arriver, le chaînage arrière me parait compliqué
; Pour le parcourt, je pencherai plus pour de la profondeur
; D'abord on détermine le nombre d'UVs à prendre
; Ensuite le nombre d'UV par catégorie
; On choisie les UVs par catégorie
; Bref, c'est de la profondeur

; Algoritme :
; TANT QUE UVs_choisies != 5 ou 6 ou 7 ET analyse = en_cours ET il existe une règle applicable FAIRE
;	R = filtrage(Ensemble_des_règles_applicables) // On filtre pour cibler en profondeur sur les règles applicables
; 	BF = BF + conclusion(R)
; 	BR = BR - R
; FIN_TANT_QUE

; SI UVs_choisies = 5 ou 6 ou 7 ET analyse = terminée ALORS
; 	Afficher les UVs
; SINON
; 	Afficher "Vous êtes dans la merde !"

; Ici, c'est un algo de chainage avant général
; Il faut que le filtrage vise les règles en profondeur pour avoir un algo en profondeur d'abord
; On peut utiliser les faits stockés en dernier pour cela

(defun chainageAvantProfondeur ()
	(let (
			(L (candidateRules))
			(analyse T)
			(UVs_Choisies)
		)
	)
)

(defun candidateRules ()
	(let (RulesList (flag 0))
		(dolist (Rule *BR* (reverse RulesList))
			(dolist (Premisse (getPremisses (car Rule)))
				(let* ( (attribut (cadr Premisse))
						(FactValue (getValue attribut)))
					(if (not (and FactValue (checkPremisse Premisse FactValue)))
						(setq flag 1)
					)
				)
			)
			(if (= flag 0)
				(push (car Rule) RulesList))
			(setq flag 0)
		)
	)
)

(defun checkPremisse (P F)
	(cond
		((equal (car P) 'equal) (equal (caddr P) F))
		((equal (car P) '<) (< F (caddr P)))
		((equal (car P) '>) (> F (caddr P)))
	)
)
