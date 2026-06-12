# Global OpenCode Rules

## Documentation
- Always use **Context7** for documentation searches (call `context7_resolve-library-id` first, then `context7_query-docs`)
- Only fall back to websearch/webfetch if Context7 doesn't have the answer

## Code Quality
- Before completing any task in a code project: run linters/typecheckers (check `package.json` scripts)
- Follow existing code conventions in the project

## Tool Usage
- Use `grep` instead of bash grep
- Use `glob` instead of bash find
- Use `read` instead of bash cat/head/tail
- Use `edit` instead of bash sed/awk
- Use `write` instead of echo redirection

## Task Tool (subagent_type)
Valid values (case-insensitive): `explore`, `general`, `react-specialist`, `typescript-pro`, `build`, `plan`, `general-purpose`

## Safety
- Never commit secrets/keys to git
- Always verify destructive commands before execution

---

## Working in this config directory (`~/.config/opencode/`)

This directory IS the OpenCode global config — not an application project.

### Config files
- `opencode.json` — **active config** loaded by OpenCode; source of truth for MCP servers, provider, tools, plugins
- `opencode.jsonc` — secondary config (TUI/alternate); a `.bak` file marks a past migration
- No build/test scripts: `package.json` contains only the `@opencode-ai/plugin` dependency

### Directory layout
| Path | Purpose |
|---|---|
| `agents/<name>.md` | Agent definitions; frontmatter: `name`, `description`, `mode` (primary\|subagent), optional `permissions` and `tools` |
| `commands/<name>.md` | Slash commands; positional args `$1…$N`; `!` prefix runs bash at invocation; `agent:` sets agent type |
| `skills/<name>/SKILL.md` | Skills; frontmatter: `name`, `description`; loaded via the `skill` tool at runtime |
| `plugins/<name>.ts` | TypeScript plugins using `@opencode-ai/plugin` API |

### MCP / tools quirks
- `awslabs*` tools are **globally disabled** in `opencode.json` (`"awslabs*": false`); re-enable per-agent with `tools: { "awslabs*": true }` — the `aws-architect` agent does this
- `context7` MCP is always enabled

### rtk plugin (`plugins/rtk.ts`)
- Intercepts every bash/shell tool call and rewrites the command via `rtk rewrite` before execution
- Silently disables itself if `rtk` is not in PATH — no error, transparent pass-through
- All rewrite rules live in the `rtk` Rust binary (`src/discover/registry.rs`); do **not** add logic to `rtk.ts`

### Commands reference
| Command | What it does |
|---|---|
| `grumpydev [branch]` | Auto-diffs `current → main` (or given branch), then reviews as a grumpy senior dev |
| `review [branch1] [branch2]` | Git diff review; one arg compares current→arg, two args compares arg1→arg2 |
| `prof <file> [level] [fn] [question]` | Pedagogical code explainer; level must be `debutant` or `intermediaire` (exactly) |
| `po` | Generates a RAS Intérim PO ticket (User Story or Bug) in French via the `po-ticket` skill |
