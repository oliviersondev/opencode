---
name: po-ticket
description: Génère des tickets (User Story ou Bug) au format PO RAS Intérim. Use when the user asks to create a ticket, user story, US, bug report, or any work item. Outputs structured Jira-style tickets in French with Gherkin acceptance criteria.
---

# Skill : Génération de tickets PO

Ce skill génère des tickets au format standard RAS Intérim, soit en **User Story (US)**, soit en **Bug**.

---

## Étape 1 — Identifier le type de ticket

Demande à l'utilisateur si c'est une **User Story** ou un **Bug** si ce n'est pas précisé.

---

## Format User Story (US)

```
## Synthèse

**Périmètre :** <Module(s) concerné(s) — ex : MyT, Back-office, MYC — et OS si application mobile (iOS / Android / les deux)>
**Statut déploiement store :** <Si application mobile : En attente / Soumis / Publié — sinon supprimer ce champ>
**Description :** <Résumé en 1-2 phrases de l'évolution>
**Impact :** <Personnes concernées : réseau complet / siège / service XX / droits spécifiques / intérimaires / clients / etc.>

---

## Contexte

<Expliquer le besoin métier, l'origine de la demande, les contraintes connues.>

---

## Description

En tant que <rôle utilisateur>
Je souhaite <action ou fonctionnalité souhaitée>
Afin de <bénéfice ou objectif métier>

---

## Règles métier

| # | Règle |
|---|-------|
| 1 | <Règle métier 1> |
| 2 | <Règle métier 2> |

---

## Maquette

<Lien vers la maquette Figma / capture d'écran / description visuelle — ou "À définir">

---

## Critères d'acceptance

### Scénario 1 : <Titre du scénario>

- **Soit** <contexte initial / état de départ>
- **Quand** <action réalisée par l'utilisateur>
- **Alors** <résultat attendu>
- **Et** <condition complémentaire éventuelle>

### Scénario 2 : <Titre du scénario>

- **Soit** <contexte initial>
- **Quand** <action>
- **Alors** <résultat attendu>

---

## Liste des tests unitaires et fonctionnels faits en dev

| Nom du test | Description |
|-------------|-------------|
| <Nom> | <Ce que le test vérifie> |
```

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

---

## Instructions de génération

1. **Analyse la demande** pour déterminer le type (US ou Bug).
2. **Pose les questions manquantes** avant de générer si des champs obligatoires sont absents (périmètre, description, impact).
3. **Remplis tous les champs** du template correspondant avec les informations fournies.
4. **Propose des scénarios Gherkin** cohérents avec la description pour les US.
5. **Utilise le français** pour tous les champs.
6. Si l'utilisateur fournit des liens Sentry ou des captures, intègre-les dans la section Description du bug.
