# OpenCode Config Notes

## Repo Scope
- This repository is the global OpenCode config at `~/.config/opencode`, not an application project.
- `opencode.json` is the active runtime config and source of truth; treat `opencode.jsonc` as secondary/reference unless explicitly asked.
- `package.json` only declares `@opencode-ai/plugin`; there are no repo-local lint, typecheck, test, or build scripts.

## Documentation Lookups
- Use Context7 first for external documentation: resolve the library ID, then query docs.
- Fall back to web fetch/search only when Context7 cannot answer.

## OpenCode Files
- Agent definitions live in `agents/*.md`; use frontmatter `permission` (singular), not `permissions`.
- Commands live in `commands/*.md`; they may use `agent:`, `$ARGUMENTS`, `$1...$N`, and `!` shell-output blocks.
- Skills live in `skills/<name>/SKILL.md` and are loaded on demand through the `skill` tool.
- Plugins live in `plugins/*.ts`; active plugins are determined by OpenCode/runtime config, not by file presence alone.

## MCP And Providers
- `context7` is enabled in `opencode.json`; `CONTEXT7_API_KEY` is loaded from `.env`, which is gitignored.
- Anthropic is proxied through `http://127.0.0.1:3456` with `apiKey: "dummy"`; this is intentional and must not be changed.
- `awslabs*` and `drawio` are globally disabled in `opencode.json` tools and must be re-enabled per agent.
- `aws-architect` enables `drawio` and `awslabs*`, but explicitly disables `awslabs.aws-diagram-mcp-server`.

## RTK Bash Rewriting
- Bash/shell tool calls are rewritten through `rtk rewrite` in this environment.
- `plugins/rtk.ts` is intentionally thin: do not add rewrite rules there; update the external `rtk` registry instead.
- If `rtk` is absent from `PATH`, the plugin path silently passes commands through unchanged.

## Known Gotchas
- Do not add or restore references to a `docs-management` skill; it is not present in this config.
- Do not assume Perplexity MCP is available; it is not configured here.
- The `drawio` skill still contains AWS diagram-server guidance, but the AWS diagram MCP is disabled for `aws-architect`.
- `opencode.jsonc` lacks `context7`, the Anthropic proxy, and plugin settings from `opencode.json`; do not copy from it blindly.

## Useful Entry Points
- `/review [branch1] [branch2]` uses the `review` agent and injects a git diff.
- `/grumpydev [branch]` uses the `review` agent with a grumpy review prompt.
- `/prof <file> [level] [fn] [question]` uses the `prof` agent; valid levels are `debutant` and `intermediaire`.
- `po` delegates final ticket formatting to the `po-ticket` skill.
- Architecture documentation skills available on demand: `arc42-documentation`, `c4-documentation`, `architecture-decision-records-adr`, `drawio`.
