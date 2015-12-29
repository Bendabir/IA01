;(load "/home/valentin/git/IA01/services.lisp")

; Permet de charger le fichier LISP relativement au dossier
(load (merge-pathnames "services.lisp" *load-truename*))

; Plutôt passer sur de la variable globale avec un defparameter ou équivalent ? J'me rappelle plus du cours 
(setq *BF* NIL)

(defun main()

	(format T "Salut mon ami ! Si tu es là c'est que tu es une peu perdu pour choisir ~%")
	(format T "tes UVs. Mais pas de problème, j'ai la solution ! Je vais te poser ~%")
	(format T "quelques questions sur ton parcours à l'UTC et à partir de ça, je vais te ~%")
	(format T "suggérer un ensemble d'UVs que tu pourrais faire ce semestre ! ~%")
	(format T " ~%")

	(format T "Voulez-vous prendre un dossier etudiant (pour faire une démo) ou bien construire le tiens ? ~%( Réponses : prefabriquer / initialiser) ~%")
		(let ((answer (read-line)))

		; Check reponse correcte
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
		