# Claude Code Migration Guide

Snapshot of the current Claude Code setup (skills, plugins, MCP servers) for moving to a new machine.

_Generated: 2026-06-18_

---

## 1. Plugin Marketplaces

Add this first — plugins resolve from it.

```bash
/plugin marketplace add anthropics/claude-plugins-official
```

| Marketplace | Source |
|---|---|
| `claude-plugins-official` | github: `anthropics/claude-plugins-official` |

---

## 2. Installed Plugins (all user-scoped)

**From `claude-plugins-official`:** `claude-md-management`, `superpowers` (v6.0.2)

```bash
# After adding the marketplace, install each:
/plugin install claude-md-management@claude-plugins-official
/plugin install superpowers@claude-plugins-official
```

---

## 3. MCP Servers (configured per-project, not globally)

None are global. They live under each project in `~/.claude.json`.

| Server | Type | URL / Command | Used in projects |
|---|---|---|---|
| `datadog-mcp` | http | `https://mcp.datadoghq.com/api/unstable/mcp-server/mcp` | `claude-playground`, `traffic-comparison`, `Documents/code` |
| `playwright` | stdio | `npx @playwright/mcp@latest` | `uigen` |

Re-add per project (run inside each project dir):

```bash
claude mcp add --scope project --transport http datadog-mcp https://mcp.datadoghq.com/api/unstable/mcp-server/mcp
claude mcp add --scope project --transport stdio playwright -- npx @playwright/mcp@latest
```

> **Note:** `datadog-mcp` uses interactive OAuth — you'll need to re-authenticate on the new machine.

---

## 4. Local Skills (`~/.claude/skills/` — NOT from plugins)

Personal skills that won't return via plugin install. **Copy this directory directly.**

```
apollo-client          apollo-connectors      apollo-federation
apollo-router          apollo-server          codebase-to-course
doc-coauthoring        find-skills            golang
golang-patterns        golang-pro             golang-testing
graphql-operations     graphql-schema         grill-with-docs
humanizer              peon-ping-config       peon-ping-log
peon-ping-toggle       peon-ping-use          rover
scala-pro              typescript-advanced-types
```

### Install via `npx skills add`

Browse and search for skills at <https://www.skills.sh/>.

> **Verify before running.** The skill files only record an author/org, not the
> full `owner/repo` that `npx skills add` needs. Only `humanizer` had a complete,
> verifiable source. Everything below marked `# TODO` is a best guess from the
> author metadata — confirm the real repo before using, or just copy the
> `~/.claude/skills/` directory directly (see section 5).

```bash
# Confirmed source:
npx skills add blader/humanizer

# Apollo / GraphQL skills — author: apollographql (repo name unverified)
npx skills add apollographql/<repo>   # TODO: apollo-client, apollo-connectors, apollo-federation,
                                       #       apollo-router, apollo-server, graphql-operations,
                                       #       graphql-schema, rover

# golang-pro — author: github.com/Jeffallan (repo name unverified)
npx skills add Jeffallan/<repo>        # TODO

# No source metadata recorded — repo unknown, fill in manually:
#   codebase-to-course, doc-coauthoring, find-skills, golang, golang-patterns,
#   golang-testing, grill-with-docs, peon-ping-config, peon-ping-log,
#   peon-ping-toggle, peon-ping-use, scala-pro, typescript-advanced-types
# npx skills add <owner>/<repo>
```

---

## 5. Simplest Migration Path

Instead of reinstalling piece by piece, copy these from old → new machine:

| Path | Contents |
|---|---|
| `~/.claude/CLAUDE.md` | Global instructions |
| `~/.claude/skills/` | Local skills (not recoverable otherwise) |
| `~/.claude/settings.json` | Hooks, permissions, env |
| `~/.claude/hooks/` | Hook scripts (e.g. peon-ping) referenced by settings |
| `~/.claude.json` | Plugin install records **and** all per-project MCP configs |

Then:
1. Run `/plugin marketplace add` for the marketplace so plugins re-resolve.
2. Re-authenticate the Datadog MCP (OAuth).
3. Verify with `/plugin` and `claude mcp list`.
