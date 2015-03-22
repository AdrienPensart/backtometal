# BackToMetal

## Introduction

Proof of Concept d'un système d'exploitation écrit en assembleur et en D2, focus sur la portabilité et la stabilité, ce qui produit nécessairement une performance, non pure mais efficace.

## Arborescence

* documentation/ : contient les documents qui décrivent le matériel sur lequel peut tourner BTM
* output/ : contient les sorties binaires, exécutables et supports qui permettent d'exécuter BTM ou bien les samples de démonstration
* sources/ : contient le code source de BTM ainsi que des samples

## Dépendances

* DMD / LDC / GDC : compilateurs D version 2
* NASM : assembleur x86, 32 et 64 bits
* CMake / CMakeD2 (http://code.google.com/p/cmaked2/wiki/GettingStarted)
