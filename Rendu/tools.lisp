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