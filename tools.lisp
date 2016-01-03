; Ce fichier contient les fonctions outils diverses 


; Récupérer une règle à partir de son étiquette (ex: R50)
(defun getRule (r)
	(assoc r *BR*)
)

;Recuperer les premisses d'une règle
(defun getPremisses (r)
	(cadr (getRule r))
)

;recuperer la conclusion d'une règle
(defun getGoal (r)
	(cddr (getRule r))
)

(defun removeRule (r)
	; Si la règle existe
	(if (getRule r)
		(setq *BR* (remove (getRule r) *BR*))
	)
)

;Recuperer la valeur d'un élèment dans la BF
(defun getValue (elem)
	(if (or (numberp elem) (stringp elem))
		elem
		(cadr (assoc elem *BF*))
	)
)

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