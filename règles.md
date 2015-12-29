Si (**provenance = TC** ou **provenance = Prépa**) et **SR01 = non_validée** alors **SR01 = conseillée**
Si **provenance = IUT** et **SR01 = non_validée** alors **MB11 = conseillée**

Si **GI = 1** alors **NF16 = conseillée**

Les conditions du diplôme sont les suivantes. Il faut avoir validé :

- 30 crédits CS
- 30 crédits TM
- 60 crédits de stage (non comptés dans ce SE)
- 84 crédits CS et TM (24 crédits CS ou TM, selon le choix de l'étudiant donc)
- 60 crédits en Profil Commun de Branche et en Profil Spécifique de Filière
- 28 crédits TSH

Conditions sur le nombre d'UVs par semestre. En moyenne, il faut valider 30 crédits par semestre. On considère donc que 6 crédits de retards (par rapport à cette moyenne) nécessitent de prendre une UV en plus. 

- Si **GI = 1** alors **UVs_à_prendre = 6**
- Si **GI = 2** et **crédits <= 24** alors **UVs_à_prendre = 7**
- Si **GI = 2** et **crédits > 24** alors **UVs_à_prendre = 6**
- Si **GI = 4** et **crédits <= 84** alors **UVs_à_prendre = 7**
- Si **GI = 4** et **crédits > 84** alors **UVs_à_prendre = 6**
- Si **GI = 5** et **crédits <= 114** alors **UVs_à_prendre = 7**
- Si **GI = 5** et **crédits > 114** et **crédits <= 126** alors **UVs_à_prendre = 7** 
- Si **GI = 5** et **crédits > 126** alors **UVs_à_prendre = 5**

Conditions sur le type d'UVs à prendre. On fait des tests pour équilibrer le nombre de CS/TM à prendre. Le nombre de TSH à prendre s'équilibre automatiquement. En théorie, si le retard n'est pas trop important, les 28 crédits TSH à valider ne posent pas de problème. 

PARTIE A RETRAVAILLER. Surement possible de condenser les règles en fonction du semestre (via un modulo ou autre)

- Si **GI = 1** alors **CS_à_prendre = 2**
- Si **GI = 1** alors **CS_à_prendre = 2**
- Si **GI = 1** alors **TSH_à_prendre = 2**

- Si **GI = 2** et **crédits_CS < 12** alors **CS_à_prendre = 3**
- Si **GI = 2** et **crédits_CS >= 12** alors **CS_à_prendre = UVs_à_prendre - 5**
- Si **GI = 2** et **crédits_TM < 12** alors **TM_à_prendre = 1**
- Si **GI = 2** et **crédits_TM >= 12** alors **TM_à_prendre = UVs_à_prendre - 5**
- Si **GI = 2** et **crédits_CS + crédits_TM < 24** et **CS_à_prendre + TM_à_prendre < 5** alors **CS_à_prendre = CS_à_prendre + 1**
- Si **GI = 2** et **crédits_CS + crédits_TM < 24** et **CS_à_prendre + TM_à_prendre < 5** alors **TM_à_prendre = TM_à_prendre + 1**
- Si **GI = 2** alors **TSH_à_prendre = UVs_à_prendre - (CS_à_prendre + TM_à_prendre)**

- Si **GI = 4** et **crédits_CS < 18** alors **CS_à_prendre = 1**
- Si **GI = 4** et **crédits_CS >= 18** alors **CS_à_prendre = UVs_à_prendre - 5**
- Si **GI = 4** et **crédits_TM < 18** alors **TM_à_prendre = 2**
- Si **GI = 4** et **crédits_TM >= 18** alors **TM_à_prendre = UVs_à_prendre - 5**
- Si **GI = 4** et **crédits_CS + crédits_TM < 42** et **CS_à_prendre + TM_à_prendre < 5** alors **TM_à_prendre = TM_à_prendre + 1**
- Si **GI = 4** et **crédits_CS + crédits_TM < 42** et **CS_à_prendre + TM_à_prendre < 5** alors **CS_à_prendre = CS_à_prendre + 1**
- - Si **GI = 4** alors **TSH_à_prendre = UVs_à_prendre - (CS_à_prendre + TM_à_prendre)**

- Si **GI = 5** et **crédits_CS < 24** alors **CS_à_prendre = 2**
- Si **GI = 5** et **crédits_CS >= 24** alors **CS_à_prendre = UVs_à_prendre - 5**
- Si **GI = 5** et **crédits_TM < 24** alors **TM_à_prendre = 2**
- Si **GI = 5** et **crédits_TM >= 24** alors **TM_à_prendre = UVs_à_prendre - 5**
- Si **GI = 5** et **crédits_CS + crédits_TM < 42** et **CS_à_prendre + TM_à_prendre < 5** alors **TM_à_prendre = TM_à_prendre + 1**
- Si **GI = 5** et **crédits_CS + crédits_TM < 42** et **CS_à_prendre + TM_à_prendre < 5** alors **CS_à_prendre = CS_à_prendre + 1**
- - Si **GI = 5** alors **TSH_à_prendre = UVs_à_prendre - (CS_à_prendre + TM_à_prendre)**

Choix des UVs :

- Si **GI = 1** et (**provenance = TC** ou **provenance = prépa**) alors **SR01 = conseillée**
- Si **GI = 1** alors **NF16 = conseillée**
- Si **GI = 1** et **provenance = IUT** alors **MB11 = conseillée**

- Si **GI = 2** et **NF16 = non_validée** alors **NF16 = conseillée**


- Si **LO21 = non_validée** et **semestre = printemps** alors **LO21 = conseillée**
- Si **NF17 = non_validée** et **semestre = printemps** alors **NF17 = conseillée**

- Si **filière = SRI** et **GI >= 4** et **semestre = automne** et **SR04 = non_validée** alors **SR04 = conseillée**
- Si **filière = SRI** et **GI >= 4** et **semestre = automne** et **SR06 = non_validée** alors **SR06 = conseillée**
- Si **filière = SRI** et **GI >= 4** et **semestre = printemps** et **SR03 = non_validée** alors **SR05 = conseillée**
- Si **filière = SRI** et **GI >= 4** et **semestre = printemps** et **SR05 = non_validée** alors **SR05 = conseillée**

- Si **filière = ADEL** et **GI >= 4** et **semestre = automne** et **MP02 = non_validée** alors **MP02 = conseillée**
- Si **filière = ADEL** et **GI >= 4** et **semestre = automne** et **MP03 = non_validée** alors **MP03 = conseillée**
- Si **filière = ADEL** et **GI >= 4** et **semestre = automne** et **RO06 = non_validée** alors **RO06 = conseillée**

- Si **filière = FDD** et **GI >= 4** et **semestre = automne** et **SY19 = non_validée** alors **SY19 = conseillée**
- Si **filière = FDD** et **GI >= 4** et **semestre = printemps** et **SY09 = non_validée** alors **SY09 = conseillée**
- Si **filière = FDD** et **GI >= 4** et **semestre = printemps** et **NF26 = non_validée** alors **NF26 = conseillée**

- Si **filière = ICSI** et **GI >= 4** et **semestre = automne** et **NF29 = non_validée** alors **NF29 = conseillée**
- Si **filière = ICSI** et **GI >= 4** et **semestre = automne** et **IA03 = non_validée** alors **IA03 = conseillée**
- Si **filière = ICSI** et **GI >= 4** et **semestre = printemps** et **NF28 = non_validée** alors **NF28 = conseillée**
- Si **filière = ICSI** et **GI >= 4** et **semestre = printemps** et **IA04 = non_validée** alors **IA04 = conseillée**
- Si **filière = ICSI** et **GI >= 4** et **semestre = printemps** et **LO17 = non_validée** alors **LO17 = conseillée**

- Si **filière = STRIE** et **GI >= 4** et **semestre = automne** et **SY23 = non_validée** alors **SY23 = conseillée**
- Si **filière = STRIE** et **GI >= 4** et **semestre = printemps** et **SY15 = non_validée** alors **SY15 = conseillée**
- Si **filière = STRIE** et **GI >= 4** et **semestre = printemps** et **MI11 = non_validée** alors **MI11 = conseillée**
- Si **filière = STRIE** et **GI >= 4** et **semestre = printemps** et **MI12 = non_validée** alors **MI12 = conseillée**



On proposera une liste d'UVs conseillée ainsi qu'un nombre d'UVs (total et par type) à prendre. On pourra proposer un semestre type à partir de ces UVs. 
