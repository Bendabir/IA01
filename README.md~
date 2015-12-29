# SE à base de règle : Conseiller d'UVs
## Par Benjamin Rivière et Valentin Montupet

### Introduction 


Ce TP nous a permis de réaliser un système expert d’ordre 0+.
Un système expert est un programme informatique qui « raisonne sur des problèmes dont la résolution repose sur une expertise humaine dans un domaine délimité. » (Edward Feigenbaum)
L'utilisation d'un tel système est justifiée quand la résolution du problème ne connaît pasd'algorithme connu ou de modèle mathématique.
Pour raisonner, un SE se compose de trois parties : une base de règles qui indique le raisonnement à suivre, une base de faits que donne l'utilisateur, et un moteur d'inférence qui fait fonctionner les règles à partir de ces faits pour obtenir de nouveaux faits jusqu'à atteindre à la réponse à la question posée.
Le SE proposé est d'ordre 0+ : les faits sont représentés comme des couples (attribut valeur).

Nous présenterons tout d'abord notre problématique et l'expertise, puis la représentation des
connaissances, faits et règles, dans les bases de faits BF et la base de règle BR, ainsi que des
jeux d'essais. Enfin, nous décrirons et comparerons les deux moteurs : en chaînage avant et en
chaînage arrière, tous les deux en profondeur d'abord.


### Problèmatique

Comme chaque semestre, Jean-Karim a la pression. Il est étudiant en génie informatique à l'Université de Technologie de Compiègne et comme chaque semestre, c'est la panique lorsqu'il faut choisir ses UV.
Tous les soirs durant l'intersemestre, il bouquine avant de s'endormir son livre de chevet : "Le guide des UVs à l'UTC".
Ce livre, à la fois source de bonheur et de liberté, est aussi source d'angoisse pour Jean-Karim. Que faire comme UVs ? Qu'est ce qui m'intéresse vraiment ? Qu'est ce qu'il est impératif de prendre pour ma filière ? Si je rate telle UV, il va me manquer tant de crédits...

Après moults interrogations, moults calculs de crédits, beaucoup de sueurs et de peur, Jean-Karim a une brillante idée : 
" Et si quelque chose pouvait m'aider à choisir mes UVs ?"
L'illumination. Jean-Karim, ayant fait IA01 en GI01, se rappelle d'un cours sombre et lointain sur les Systèmes Experts à Base de Règles. Ni une, ni deux, il replonge dans son vieux poly gardé au fond d'un placard, et décide de concevoir un Conseiller d'UVs.





### L'expertise

Pour obtenir des règles, il est nécessaire de procéder à une expertise au préalable afin de pouvoir construire de véritables règles. Une des parties les plus conséquentes de ce TP est l’expertise.


Dans notre exemple, le SE conseillera une liste d'UV pour le semestre à l'étudiant. N'ayant pas de règle prédéfinies, nous devons donc nous même concevoir l'expertise sur laquelle reposera tout le système. Nous devons donc trouver toutes les informations qui vont nous permettre d'élaborer la base de règle.

Pour construire notre expertise, nous nous sommes basés sur la documentation fournie par l'UTC sur le choix des UVs, à savoir le catalogue des UVs disponibles et la plateforme de consultation des enseignements DEMETER.

* Le catalogue des UV est disponible en ligne au lien suivant : 

https://www.utc.fr/fileadmin/user_upload/SITE-UTC/documents/Documentations/CatalogueUV_Inge_2015-2016_web.pdf

* La plateforme DEMETER de consultation des enseignements ici :

https://demeter.utc.fr/portal/pls/portal30/ENSEIGNEMENT.CONSULT_ENSEG_TAB_DYN.show?p_arg_names=p_aff&p_arg_values=TAB

* Le site internet du Génie Informatique

http://www.utc.fr/inscriptions_gi/filieres.htm 

Celà nous permet d'obtenir les informations "officielles" concernant chaque UV. Nous pouvons être sûrs que ces sources sont fiables et pouvons alors les exploiter en toute tranquilité, puisqu'elles sont diffusée par l'UTC elle-même.

* Le site UVWEB ( https://assos.utc.fr/uvweb/ ) permettant à chaque étudiant de noter chaque UV sur son utilité, sa dose de travail, son interêt et sa pédagogie.
Nous exploiterons donc les avis de chaque UV afin d'obtenir un avis moyen de ce que pense un UTCéen sur une UV.

A l'UTC, chaque étudiant peut choisir au début de chaque semestre entre 5 et 7 UVs (pour un maximum de 32 crédits) qu'il souhaite suivre parmis une liste de plus de 400 UVs. Cette situation ammène à des situations quasi infinie et beaucoup trop compliquées à mettre en oeuvre à notre niveau.

Pour notre système expert, nous nous limiterons à des cas comme celui de Jean-Karim, c'est-à-dire aux étudiants **seulement en Génie Informatique** (donc en GI0X, X compris entre 1 et 5), ne pouvant donc pas prendre d'UV de Tronc Commun ou d'autres branches, qu'importe le semestre actuel.

On suppose aussi que les semestres **GI03 et GI06 sont des semestres de stage**, et que par conséquent il est impossible de choisir des UVs pour ces semestres. On considérera que Jean-Karim suit un cursus dit " *basique* " : il ne fait **pas d'apprentissage, il ne part pas à l'étranger et valide les 30 crédits de stage TN09.**
Notre étude de cas se limite donc à un **choix parmis environ 150 UVs possibles** pour un étudiant en Génie Informatique.

On a donc les cas suivants :

* Jean-Karim entre en GI01, il vient de TC ou d'IUT mais n'a aucun crédit de branche et aucune UV de branche validée.

* Jean-Karim entre en GI02, il a déjà XX crédits validés mais n'a pas encore de filière.

* Jean-Karim entre en filière en GI04, il a acquis XX crédits lors de son GI01 et on GI02 (+ 30 les crédits de stage TN09 de GI03, qu'on ne considérera pas dans notre système expert) : il faut donc qu'il commence à valider des crédits de filière + des crédits de branche. On considérera la filière choisie.

* Jean-Karim entre en GI05 (toujours dans la filière choisie), c'est son dernier semestre pour choisir des UVs, il faut donc qu'il valide l'intégralité des crédits manquants avant de partir en stage.

##### Les UVs incontournables du profil commun
D'après le site du Génie Informatique :

"Il est évident que les UV SR01 (pour etudiants TC et prépa), SR02, NF16, LO21 et NF17 constituent le coeur de la partie informatique de la formation GI et que leur contenu doit être assimilé par tous avant de partir en stage."

De plus, l'UV MB11, qui est une remise à niveau de mathématiques pour les étudiants provenant d'un IUT, semble incoutournable


##### Les UVs incontournables de filière
Nous avons aussi déterminés quelles étaient les UVs considérées "incontournables" pour chaque filière. Pour renforcer notre expertise, nous nous sommes appuyés sur le site du Génie informatique. Les informations contenues sur ce site ont été révisées et probablement écrites par les responsables du département GI.
En plus de l'avis des responsables, nous sommes allés vérifier l'avis des étudiants sur la page de chaque UV sur le site UVWEB.
En inférant les résultats, le site du GI et les avis UVWEB été majoritairement d'accord sur les UVs de filière incontournables.

* SRI = CS : SR04(A) SR05(P) // TM : SR06(A) SR03(P)
* ADEL =  TM : MP03(A) RO06(A) MP02(A)
* FDD = CS : SY09(P) // TM : NF26(P) SY19(A)
* ICSI = TM : IA04(P) LO17(P) IA03(A) NF28(P) NF29(A)
* STRIE = CS : SY15(P) // TM : MI11(P) MI12(P) SY23(A)

(A) Automne et (P) Printemps, correspondent à la disponibilité de chaque UV

### Base de faits, base de règles
```
BASE DE REGLES :

- C1 : Si Crédits_TSH >= 28 alors TSH = NIL
- C2 : Si Crédits_CS >= 32 alors CS = NIL
- C3 : Si Crédits_TM >= 32 alors TM = NIL

- R1 : Si semestre = 1 et NF16 = non_validée alors NF16 = conseillée
- R2 : Si semestre = 1 et NF17 = non_validée et saison = automne alors NF17 = non_conseillée
- R3 : Si semestre = 1 et IA01 = non_validée et saison = automne alors IA01 = conseillée
- R4 : Si semestre = 1 et MI01 = non_validée et saison = automne alors MI01 = conseillée
- R5 : Si semestre = 1 et NF17 = non_validée et saison = printemps alors NF17 = conseillée

- R6 : Si filière = FDD et semestre = 4 et saison = printemps alors NF26 = conseillée
- R7 : Si filière = ICSI et saison = automne alors IA03 = conseillée

BASE DE FAITS : 

- F1 : semestre = 1
- F2 : saison = automne
- F3 : Crédits_TSH = 0
- F4 : Crédits_CS = 0
- F5 : Crédits_TM = 0
- F6 : filière = NIL
- F7 : UVs_Validées = NIL
```

BASE DE REGLES V2 :

1. Si SEMESTRE = 2 et NF16 = non validée alors NB_UV = 7


D'après le catalogue des UVs, pour les étudiants venant d'IUT et rentrant à l'UTC, l'UV de remise à niveau en mathématiques MB11 est obligatoire pour tout GI01. On a donc :

2. Si SEMESTRE = 1 et Provenance = IUT alors CS = CS + MB11

De même pour les étudiants venant de TC, NF16 est une UV incontournable pour les GI01 :

3. Si SEMESTRE = 1 et Provenance = TC alors CS = CS + NF16

Afin d'avoir le diplôme, d'après le catalogue des UVs et confirmé par les étudiants sur UVWEB, l'UTCéen doit valider le niveau 3 d'anglais. D'après UVWEB toujours, l'UV est assez difficile à valider, c'est pourquoi, si l'étudiant a validé LA12 mais pas LA13, on considère qu'il doit prendre LA13.

4. Si LA13 = non validée et LA12 = validée alors TSH = TSH + LA13

5. Si NB_UV = 7 et SEMESTRE = 2 et Credits_CS < 12 alors NB_CS = 3

6. Si NB_UV = 7 et SEMESTRE = 2 et Credits_TM < 12 alors NB_TM = 3

7. Si NB_CS = 3 et NF16 = non validée alors CS = CS + NF16
