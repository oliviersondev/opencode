# OpenCode Global Config

Configuration globale d'OpenCode

## Setup

### Prérequis

- [OpenCode](https://opencode.ai) installé
- `rtk` >= 0.23.0 dans le PATH (optionnel — le plugin se désactive silencieusement si absent)
- `uvx` pour les MCP servers AWS
- `npx` pour Context7 et drawio

### Variable d'environnement

La clé API Context7 est chargée via `{env:CONTEXT7_API_KEY}`. Ajoute cette ligne dans ton `~/.bashrc` ou `~/.zshrc` :

```bash
source ~/.config/opencode/.env
```

Le fichier `.env` est gitignored — ne pas le commiter.

## Structure

```
~/.config/opencode/
├── opencode.json          # Config active (MCP, provider, permissions)
├── opencode.jsonc         # Config TUI (backup de référence)
├── tui.json               # Thème TUI (tokyonight)
├── .env                   # Clés API locales (gitignored)
├── AGENTS.md              # Règles globales chargées par tous les agents
├── agents/                # Définitions d'agents
├── commands/              # Slash commands
├── skills/                # Skills chargés à la demande
└── plugins/               # Plugins TypeScript
```

## MCP Servers

| Serveur | Outil | Accès par défaut |
|---|---|---|
| `context7` | Documentation libraries | Tous les agents |
| `awslabs.aws-diagram-mcp-server` | Diagrammes AWS | `aws-architect` uniquement |
| `awslabs.aws-documentation-mcp-server` | Docs AWS | `aws-architect` uniquement |
| `drawio` | Édition draw.io | `aws-architect` uniquement |

Les outils `awslabs*` et `drawio` sont désactivés globalement (`tools: false`) et réactivés par agent via leur frontmatter.

## Agents

| Agent | Mode | Usage |
|---|---|---|
| `aws-architect` | primary | Architecture cloud AWS, diagrammes C4/draw.io |
| `editorial` | primary | Relecture et correction de documents |
| `po` | primary | Génération de tickets PO (User Story / Bug) pour RAS Intérim |
| `react-specialist` | primary | Optimisation et architecture React 18+ |
| `refactor` | primary | Refactoring code sans changement fonctionnel |
| `review` | primary | Review code en lecture seule |
| `typescript-pro` | subagent | Types avancés TypeScript 5+ |

## Commandes

| Commande | Usage |
|---|---|
| `/grumpydev [branch]` | Review diff `current → main` par un dev senior grognon |
| `/review [branch1] [branch2]` | Diff entre branches avec analyse qualité |
| `/prof <fichier> [niveau] [fn] [question]` | Explique du code (niveaux : `debutant`, `intermediaire`) |
| `/po` | Génère un ticket PO RAS Intérim (User Story ou Bug) |

## Skills

| Skill | Chargement |
|---|---|
| `arc42-documentation` | Via `skill` tool |
| `architecture-decision-records-adr` | Via `skill` tool |
| `c4-documentation` | Via `skill` tool |
| `drawio` | Via `skill` tool |
| `po-ticket` | Via `skill` tool (utilisé par agent `po` et commande `/po`) |

## Plugin — rtk

`plugins/rtk.ts` intercepte chaque appel bash et réécrit la commande via `rtk rewrite` avant exécution. Toute la logique de réécriture est dans le binaire Rust (`src/discover/registry.rs`) — ne pas modifier le plugin TypeScript.
