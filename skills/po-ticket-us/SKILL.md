---
name: po-ticket-us
description: Génère une User Story au format PO RAS Intérim avec critères d'acceptance Gherkin.
---

# Skill : Génération de User Story (US)

Ce skill génère une User Story au format standard RAS Intérim.

---

## Instructions de génération

1. **Analyse la demande** pour extraire les informations disponibles.
2. **Pose les questions manquantes** si des champs obligatoires sont absents (périmètre, description, impact).
3. **Remplis tous les champs** du template avec les informations fournies.
4. **Propose des scénarios Gherkin** cohérents avec la description.
5. **Utilise le français** pour tous les champs.
6. **Fournis le ticket final dans un bloc de code markdown** (` ```markdown ... ``` `) pour permettre le copier-coller direct.

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
