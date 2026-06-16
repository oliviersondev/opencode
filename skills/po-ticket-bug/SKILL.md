---
name: po-ticket-bug
description: Génère un ticket Bug au format PO RAS Intérim avec scénario de reproduction et obtenu/attendu.
---

# Skill : Génération de ticket Bug

Ce skill génère un rapport de bug au format standard RAS Intérim.

---

## Instructions de génération

1. **Analyse la demande** pour extraire les informations disponibles.
2. **Pose les questions manquantes** si des champs obligatoires sont absents (environnement, périmètre, description).
3. **Remplis tous les champs** du template avec les informations fournies.
4. **Intègre les liens Sentry ou captures** dans la section Description si fournis.
5. **Utilise le français** pour tous les champs.
6. **Fournis le ticket final dans un bloc de code markdown** (` ```markdown ... ``` `) pour permettre le copier-coller direct.

---

## Format Bug

```
## Synthèse

**Environnement :** <PROD / PREPROD / RECETTE>
**Dates :** <Date de détection — format JJ/MM/AAAA>
**Périmètre :** <Module(s) concerné(s) — ex : MyT - OS iOS/Android>
**Description :** <Résumé en 1 phrase du dysfonctionnement>
**Impact :** <Personnes concernées : Agence / Siège / Intérimaires / Clients / etc.>
**Résolution :** <À analyser / En cours / Corrigée — et brève explication si connue>

---

## Description

<Description détaillée du bug : ce qui se passe, dans quel contexte, fréquence, criticité.>

<Liens Sentry, logs, captures d'écran ou tout élément de diagnostic disponible :>
- <lien 1>
- <lien 2>

---

## Scénario de reproduction

1. <Étape 1>
2. <Étape 2>
3. <Étape 3>

---

## Obtenu VS Attendu

### Obtenu
<Ce qui se passe réellement — message d'erreur, comportement observé>

### Attendu
<Ce qui devrait se passer>
```
