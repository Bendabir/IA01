Système Expert d'ordre 0+
Développé sous le logiciel CLISP.

======================================
Fichiers nécessaires
======================================
main.lisp		
	`----> br.lisp 
	`----> br.lisp		
	`----> menuFunc.lisp
	`----> tools.lisp
	`----> BFFUnc.lisp

======================================
Intructions pour exécuter le programme
======================================

1. Importer le main uniquement :
(load "main.lisp")

2. Il n'est pas nécessaire d'importer les autres fichiers, ils sont loadés dans le main.

3. Lancer la fonction (main) autant de fois que voulu
(la base de fait se réinitialise à chaque fois)

======================================
Si l'exécution ne fonctionne pas
======================================

1. Importer le fichier "obesite" uniquement :
(load "obesite.lisp")

Obesite rassemble toutes les fonctions dans un seul fichier, permettant de règler les soucis de load (problèmes de chemins...)
