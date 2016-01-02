# SE à base de règle : Conseiller d'UVs
## Par Benjamin Rivière et Valentin Montupet

### Introduction 


Ce TP nous a permis de réaliser un système expert d’ordre 0+. Un système expert est un programme informatique qui « raisonne sur des problèmes dont la résolution repose sur une expertise humaine dans un domaine délimité. » (Edward Feigenbaum) L'utilisation d'un tel système est justifiée quand la résolution du problème ne connaît pasd'algorithme connu ou de modèle mathématique. Pour raisonner, un SE se compose de trois parties : une base de règles qui indique le raisonnement à suivre, une base de faits que donne l'utilisateur, et un moteur d'inférence qui fait fonctionner les règles à partir de ces faits pour obtenir de nouveaux faits jusqu'à atteindre à la réponse à la question posée. Le SE proposé est d'ordre 0+ : les faits sont représentés comme des couples (attribut valeur).

Nous présenterons tout d'abord notre problématique et l'expertise, puis la représentation des connaissances, faits et règles, dans les bases de faits BF et la base de règle BR, ainsi que des jeux d'essais. Enfin, nous décrirons et comparerons les deux moteurs : en chaînage avant et en chaînage arrière, tous les deux en profondeur d'abord.

### Problèmatique

Comme chaque semestre, Jean-Karim a la pression. Il est étudiant en génie informatique à l'Université de Technologie de Compiègne et comme chaque semestre, c'est la panique lorsqu'il faut choisir ses UV. Tous les soirs durant l'intersemestre, il bouquine avant de s'endormir son livre de chevet : "Le guide des UVs à l'UTC". Ce livre, à la fois source de bonheur et de liberté, est aussi source d'angoisse pour Jean-Karim. Que faire comme UVs ? Qu'est ce qui m'intéresse vraiment ? Qu'est ce qu'il est impératif de prendre pour ma filière ? Si je rate telle UV, il va me manquer tant de crédits...

Après moult interrogations, moult calculs de crédits, beaucoup de sueurs et de peur, Jean-Karim a une brillante idée : " Et si quelque chose pouvait m'aider à choisir mes UVs ?" L'illumination. Jean-Karim, ayant fait IA01 en GI01, se rappelle d'un cours sombre et lointain sur les Systèmes Experts à Base de Règles. Ni une, ni deux, il replonge dans son vieux poly gardé au fond d'un placard, et décide de concevoir un Conseiller d'Uvs.





### L'expertise

##### Les sources utilisées
Pour obtenir des règles, il est nécessaire de procéder à une expertise au préalable afin de pouvoir construire de véritables règles. Une des parties les plus conséquentes de ce TP est l’expertise.
Dans notre exemple, le SE conseillera une liste d'UVs pour le semestre à l'étudiant. N'ayant pas de règle prédéfinies, nous devons donc nous même concevoir l'expertise sur laquelle reposera tout le système. Nous devons donc trouver toutes les informations qui vont nous permettre d'élaborer la base de règle.
Pour construire notre expertise, nous nous sommes basés sur la documentation fournie par l'UTC sur le choix des UVs, à savoir le catalogue des UVs disponibles et la plateforme de consultation des enseignements DEMETER.

* Le catalogue des UV est disponible en ligne au lien suivant : 

https://www.utc.fr/fileadmin/user_upload/SITE-UTC/documents/Documentations/CatalogueUV_Inge_2015-2016_web.pdf

* La plateforme DEMETER de consultation des enseignements ici :

https://demeter.utc.fr/portal/pls/portal30/ENSEIGNEMENT.CONSULT_ENSEG_TAB_DYN.show?p_arg_names=p_aff&p_arg_values=TAB

* Le site internet du Génie Informatique

http://www.utc.fr/inscriptions_gi/filieres.htm 

Cela nous permet d'obtenir les informations "officielles" concernant chaque UV. Nous pouvons être sûrs que ces sources sont fiables et pouvons alors les exploiter en toute tranquillité, puisqu'elles sont diffusée par l'UTC elle-même.

* Le site UVWEB ( https://assos.utc.fr/uvweb/ ) permettant à chaque étudiant de noter chaque UV sur son utilité, sa dose de travail, son interêt et sa pédagogie.
Nous exploiterons donc les avis de chaque UV afin d'obtenir un avis moyen de ce que pense un UTCéen sur une UV.

A l'UTC, chaque étudiant peut choisir au début de chaque semestre entre 5 et 7 UVs (pour un maximum de 32 crédits) qu'il souhaite suivre parmi une liste de plus de 400 UVs. Cette situation amène à des situations quasi infinie et beaucoup trop compliquées à mettre en œuvre à notre niveau.

##### Limitations du sujet

Pour notre système expert, nous nous limiterons à des cas comme celui de Jean-Karim, c'est-à-dire aux étudiants seulement en Génie Informatique (donc en GI0X, X compris entre 1 et 5), ne pouvant donc pas prendre d'UV de Tronc Commun ou d'autres branches, qu'importe le semestre actuel.

On suppose aussi que les semestres GI03 et GI06 sont des semestres de stage, et que par conséquent il est impossible de choisir des UVs pour ces semestres. On considérera que Jean-Karim suit un cursus dit " basique " : il ne fait pas d'apprentissage, il ne part pas à l'étranger et valide les 30 crédits de stage TN09. Notre étude de cas se limite donc à un choix parmi environ 150 UVs possibles pour un étudiant en Génie Informatique.

On a donc les cas suivants :

* Jean-Karim entre en GI01, il vient de TC ou d'IUT mais n'a aucun crédit de branche et aucune UV de branche validée.

* Jean-Karim entre en GI02, il a déjà XX crédits validés mais n'a pas encore de filière.

* Jean-Karim entre en filière en GI04, il a acquis XX crédits lors de son GI01 et on GI02 (+ 30 les crédits de stage TN09 de GI03, qu'on ne considérera pas dans notre système expert) : il faut donc qu'il commence à valider des crédits de filière + des crédits de branche. On considérera la filière choisie.

* Jean-Karim entre en GI05 (toujours dans la filière choisie), c'est son dernier semestre pour choisir des UVs, il faut donc qu'il valide l'intégralité des crédits manquants avant de partir en stage.

##### Les UVs incontournables du profil commun
D'après le site du Génie Informatique :

*"Il est évident que les UV SR01 (pour étudiants TC et prépa), SR02, NF16, LO21 et NF17 constituent le cœur de la partie informatique de la formation GI et que leur contenu doit être assimilé par tous avant de partir en stage."*
De plus, l'UV MB11, qui est une remise à niveau de mathématiques pour les étudiants provenant d'un IUT, semble incontournable


##### Les UVs incontournables de filière
Nous avons aussi déterminé quelles étaient les UVs considérées "incontournables" pour chaque filière. Pour renforcer notre expertise, nous nous sommes appuyés sur le site du Génie informatique. Les informations contenues sur ce site ont été révisées et probablement écrites par les responsables du département GI. En plus de l'avis des responsables, nous sommes allés vérifier l'avis des étudiants sur la page de chaque UV sur le site UVWEB. En inférant les résultats, le site du GI et les avis UVWEB été majoritairement d'accord sur les UVs de filière incontournables.

* SRI = CS : SR04(A) SR05(P) // TM : SR06(A) SR03(P)
* ADEL =  TM : MP03(A) RO06(A) MP02(A)
* FDD = CS : SY09(P) // TM : NF26(P) SY19(A)
* ICSI = TM : IA04(P) LO17(P) IA03(A) NF28(P) NF29(A)
* STRIE = CS : SY15(P) // TM : MI11(P) MI12(P)

(A) Automne et (P) Printemps, correspondent à la disponibilité de chaque UV

### Base de faits, base de règles

##### Base de faits

Pour établir la base de faits, nous nous appuierons sur le Dossier Étudiant de l'élève.

Le dossier étudiant permet de savoir les caractéristiques de l'étudiant à savoir son numéro de semestre, sa filière, sa provenance mais aussi les informations relatives à ses semestres précédents comme le nombre et la répartition des crédits validés, les UVs déjà validés. 

Par exemple, si l'on prend le dossier étudiant de Jean-Karim :

* Provenance : TC
* Semestre : GI02
* Filière : Pas de filière
* Periode : Printemps
* CS validées : NF16, IA01, SY02 pour un total de 18 crédits CS validés
* TM validées : SR01 pour un total de 6 crédits TM validés
* TSH validées : LA12, SI11 pour un total de 4 crédits TSH validés

Pour représenter la base de faits en Lisp, nous avons choisi de créer une simple liste ```(fait1 fait2 fait3 ... fait n)``` où un fait correspond à un couple ```(attribut valeur)```.

Pour les caractéristiques de l'élèves, ils pourront être représentés comme ceci : ``` (Provenance TC) (Semestre 2) (Filiere NIL) (Credits_CS 18) ...```

Pour ce qui est des UVs, nous avons choisi de **tous** les représenter dans la base de faits à la suite des informations précédemment données. De cette manière, nous avons indirectement la liste des UVs gérées par le SE. Chaque UV peut prendre 3 valeurs : validée, non validée ou conseillée par le SE. ce qui donnerait : ```... (NF16 validée) (NF17 conseillée) (NF22 non_validée)...```

###### Base de règles

Les conditions du diplôme sont les suivantes, Il faut avoir validé :

- 30 crédits CS
- 30 crédits TM
- 60 crédits de stage (non comptés dans ce SE)
- 84 crédits CS et TM (24 crédits CS ou TM, selon le choix de l'étudiant donc)
- 60 crédits en Profil Commun de Branche et en Profil Spécifique de Filière
- 28 crédits TSH

###### Règles sur le nombre d'UVs

Nous avons établi des conditions sur le nombre d'UVs à prendre par semestre selon l'avance ou le retard de l'étudiant. En moyenne et selon nos calculs, il faut valider 30 crédits par semestre pour obtenir le diplôme. On considérera donc que 6 crédits de retards (par rapport à cette moyenne) nécessitent de prendre une UV en plus. Ce qui donne les règles suivantes :


- Si **Semestre = 1** alors **UVs_a_prendre = 6** 
En GI01, il n'y a ni retard ni avance, on prend donc un semestre typique de 6 crédits
- Si **Semestre = 2** et **crédits <= 26** alors **UVs_a_prendre = 7** 
- Si **Semestre = 2** et **crédits > 26** alors **UVs_a_prendre = 6**
Si l'étudiant a validé moins de 26 crédits lors de son GI01 (Ce qui correspond à une CS ou une TM ratée), alors il doit prendre 7 UVs.
- Si **Semestre = 4** et **crédits <= 84** alors **UVs_a_prendre = 7**
- Si **Semestre = 4** et **crédits > 84** alors **UVs_a_prendre = 6**
- Si **Semestre = 5** et **crédits <= 114** alors **UVs_a_prendre = 7**
- Si **Semestre = 5** et **crédits > 114** et **crédits <= 126** alors UVs_a_prendre = 6**
- Si **Semestre = 5** et **crédits > 126** alors **UVs_a_prendre = 5** 

Lors du GI05, qui est alors le dernier semestre à l'UTC, l'étudiant doit se trouver entre 114 et 126 crédits pour être « dans les normes ». S'il a moins de 114, alors il lui faudra prendre 7 UVs afin de valider le nombre requis de crédits. A l'inverse, il se peut qu'un étudiant soit en avance pour se permettre de ne prendre que 5 UVs.

###### Règles sur la répartition CS/TM/TSH

Une fois le nombre d'UVs à prendre déterminé, il s'agit de savoir comment les répartir selon les catégories CS, TM et TSH. On fait des tests pour équilibrer le nombre de CS/TM à prendre. Le nombre de TSH à prendre s'équilibre automatiquement. En théorie, si le retard n'est pas trop important, les 28 crédits TSH à valider ne posent pas de problème

PARTIE A RETRAVAILLER. Surement possible de condenser les règles en fonction du semestre (via un modulo ou autre)

- Si **Semestre = 1** alors **CS_a_prendre = 2**
- Si **Semestre = 1** alors **TM_a_prendre = 2**
- Si **Semestre = 1** alors **TSH_a_prendre = 2**

Lors du premier semestre, on considérera un équilibre entre les UVs (2 / 2 / 2)


- Si **Semestre = 2** et **crédits_CS < 12** alors **CS_a_prendre = 3**
- Si **Semestre = 2** et **crédits_CS >= 12** alors **CS_a_prendre = UVs_a_prendre - 5** DONC SI IL A VALIDE TOUTES SES UV (2/2/2), IL DEVRA DONC PRENDRE 6-5 = 1 CS ??

Si l'étudiant n'a pas validé 2 CS en GI01, alors il doit en prendre 3 en GI02. Sinon, il doit prendre .......

- Si **Semestre = 2** et **crédits_TM < 12** alors **TM_a_prendre = 1**
- Si **Semestre = 2** et **crédits_TM >= 12** alors **TM_a_prendre = UVs_a_prendre - 5**

Si l'étudiant n'a pas validé 2 TM en GI01, alors il doit en prendre 3 en GI02. Sinon, il doit prendre .......


- Si **Semestre = 2** et **crédits_CS + crédits_TM < 24** et **CS_a_prendre + TM_a_prendre < 5** alors **CS_a_prendre = CS_a_prendre + 1**
- Si **Semestre = 2** et **crédits_CS + crédits_TM < 24** et **CS_a_prendre + TM_a_prendre < 5** alors **TM_a_prendre = TM_a_prendre + 1** CETTE REGLE NE VA JAMAIS S EXECUTER A CAUSE DE LA PRECEDENTE NON ?
- Si **Semestre = 2** alors **TSH_a_prendre = UVs_a_prendre - (CS_a_prendre + TM_a_prendre)**

Ces règles permettent d'établir la répartition des UVs pour le GI02.

- Si **Semestre = 4** et **crédits_CS < 18** alors **CS_à_prendre = 1**
- Si **Semestre = 4** et **crédits_CS >= 18** alors **CS_à_prendre = UVs_à_prendre - 5**
- Si **Semestre = 4** et **crédits_TM < 18** alors **TM_à_prendre = 2**
- Si **Semestre = 4** et **crédits_TM >= 18** alors **TM_à_prendre = UVs_à_prendre - 5**
- Si **Semestre = 4** et **crédits_CS + crédits_TM < 42** et **CS_à_prendre + TM_à_prendre < 5** alors **TM_à_prendre = TM_à_prendre + 1**
- Si **Semestre = 4** et **crédits_CS + crédits_TM < 42** et **CS_à_prendre + TM_à_prendre < 5** alors **CS_à_prendre = CS_à_prendre + 1**
- - Si **Semestre = 4** alors **TSH_à_prendre = UVs_à_prendre - (CS_à_prendre + TM_à_prendre)**

- Si **Semestre = 5** et **crédits_CS < 24** alors **CS_à_prendre = 2**
- Si **Semestre = 5** et **crédits_CS >= 24** alors **CS_à_prendre = UVs_à_prendre - 5**
- Si **Semestre = 5** et **crédits_TM < 24** alors **TM_à_prendre = 2**
- Si **Semestre = 5** et **crédits_TM >= 24** alors **TM_à_prendre = UVs_à_prendre - 5**
- Si **Semestre = 5** et **crédits_CS + crédits_TM < 42** et **CS_à_prendre + TM_à_prendre < 5** alors **TM_à_prendre = TM_à_prendre + 1**
- Si **Semestre = 5** et **crédits_CS + crédits_TM < 42** et **CS_à_prendre + TM_à_prendre < 5** alors **CS_à_prendre = CS_à_prendre + 1**
- - Si **Semestre = 5** alors **TSH_à_prendre = UVs_à_prendre - (CS_à_prendre + TM_à_prendre)**

###### Règles sur le choix d'UVs

Dernière étape, une fois la répartition des UVs à prendre décidée, il s'agit de sélectionner lesquelles. Pour cela, nous nous somme donc fortement appuyés sur le catalogue des UVs et sur le site du département. Nous considérerons qu'une UV peut-être conseillée par le système si le niveau conseillé par le responsable de l'UV (par la description de l'UV dans le guide) est atteint, si les potentielles UVs en prérequis sont validées (ou éventuellement conseillées en même temps). Nous tiendrons aussi compte de la filière , de la période et de la provenance de l'étudiant avant de rentrer en branche. De là découle beaucoup de règles (au moins 1 par UV). En voici donc une liste restreinte à titre d'exemples, la liste complète de la Base de Règles peut être trouvée dans le fichier « br.lisp » :

- Si **Semestre = 1** et (**provenance = TC** ou **provenance = prépa**) alors **SR01 = conseillée**

- Si **Semestre = 1** et **provenance = IUT** alors **MB11 = conseillée**

- Si **Semestre = 2** et **SR01 = validée** alors **SR02 = conseillée**

- Si **LO21 = non_validée** et **Periode = printemps** alors **LO21 = conseillée**

- Si **filière = SRI** et **Semestre >= 4** et **Periode = automne** et **SR04 = non_validée** alors **SR04 = conseillée**

- Si **Semestre ≥ 4** et **Periode = automne** et **SR01 = validée** et **SR02=validée** et **RO03= validée** et **NF16 = validée** et **SR05 = non_validée** alors **SR05 = conseillée**

- Si **filière = ADEL** et **Semestre >= 4** et **Periode = automne** et **RO06 = non_validée** alors **RO06 = conseillée**

- Si **Semestre ≥ 4** et **Periode = printemps** et **(SR01 = validée ou Provenance = IUT)** et **MI11 = non_validée** alors **MI11 = conseillée**



### Moteurs d'inférence

###### Notion de règle candidate

Une règle candidate est une règle dont les prémisses sont vérifiées compte-tenu de l'état actuel de la base de faits. Il s'agit donc d'une règle applicable qui une fois déclenchée fournit une nouvelle information.

La fonction de service ```candidateRules```  retourne la liste des identifiants des règles candidates en fonction des informations contenues actuellement dans la base de faits. L'algorithme qui régit son fonctionnement est le suivant :

```
flag <- 0
ListeCandidates <- NIL
Pour chaque règle R de la *BR* faire
	Pour chaque prémisse de la règle R faire
		Si *BF* ne contient aucun fait permettant de décider si la prémisse et vérifiée ou non OU si ce fait existe et infirme la prémisse, 
			alors flag <- 1
	Fpour
	Si flag = 0, alors ajouter R à ListeCandidates
	Sinon flag = 0
Fpour
Retourner ListeCandidates
```

###### Fonctions de service

Nous avons du implémenter quelques fonctions de service afin de rendre le code plus lisible et faciliter sa maintenance. Cela nous permettait également de faire évoluer les représentations des règles et des faits sans pour autant modifier le moteur d'inférence à chaque fois.

- getPremisses : renvoie la liste des prémisses de la règle passée en argument 
- getGoal : renvoie la liste des conclusions de la règle passée en argument 
- getValue : renvoie la valeur contenu dans la base de faits du fait passé en argument. 
- checkPremisse : renvoie T si la prémisse passée en argument est vérifiée , NIL sinon
- is-triggerable : fait appel à checkPremisse pour vérifier si toutes les prémisses d'une règle sont vérifiées et peut donc être appliquée. Renvoie T si oui, NIL si non.
- triggerRule : permet d'appliquer la règle, d'ajouter le but à la BF et de supprimer la règle de la BR.
- RemoveRule : supprime la règle de la BR après avoir été appliquée
- getTargetedUVs : retourne la liste des UVs conseillée par le SE


###### Principe du chainage avant en profondeur d'abord

Ce moteur permet de déduire une liste d'UVs à conseiller à l'étudiant grâce à l'application de règles sur notre base de faits.
A chaque cycle du moteur d'inférence, on choisit de déclencher la première règle ayant pour prémisse le dernier fait établi (il s'agit d'un choix stratégique parmi d'autres possibles). L'algorithme en chaînage avant en profondeur est le suivant :
```
 TANT QUE UVs_choisies != 5 ou 6 ou 7 ET analyse = en_cours ET ListeCandidates != NIL FAIRE
	R = filtrage(Ensemble_des_règles_applicables) // On filtre pour cibler en profondeur sur les règles applicables
 	BF = BF + conclusion(R)
 	BR = BR - R
 FIN_TANT_QUE

 SI UVs_choisies = 5 ou 6 ou 7 ET analyse = terminée ALORS
 	Afficher les UVs
 SINON
   Afficher "Vous êtes dans la merde !"

```