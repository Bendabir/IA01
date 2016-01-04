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
				(load *BRLocation* :verbose nil) ; On recharge la BF
			)
			; Quitter
			((eq choice 4)
				(return-from menu NIL)
			)						
		)
	)
	T ; On retourne T pour boucler dans le main. Seul l'option quitter renvoie NIL, ce qui permet de sortir de la boucle
)