# Development Guidelines

For each task, always choose the optimal sub-agent to perform the work.

## Git Workflow

- **NEVER push or merge directly to `main` or `dev`** — always work on a worktree and open a PR
- Every change must go through: worktree → commit → push → PR → merge
- **Only create a worktree when currently on `main` or `dev`.** If already on a feature branch, commit and push directly on that branch — do not nest a worktree inside it.
- Only add relevant files (never use `git add -A` or `git add .`)
- Include JIRA ticket as [PROJECT-1234] in commit message
- Every commit must compile, pass tests, and include tests for new functionality

## Behavior

- Be a critical thinking partner, not a yes-person — challenge assumptions and question unclear requirements
- Provide honest trade-off analysis; never default to agreement

## Process

- Follow: Understand existing patterns → Test first → Implement minimal code → Verify (linters + all tests) → Commit
- Choose the boring, obvious solution — avoid premature abstractions and clever tricks
- Never disable or skip tests to make them pass — fix them

## Security

- No secrets in code — use Vault
- Watch for XSS, SQL injection, command injection

## When Stuck (After 3 Attempts)

Maximum 3 attempts per issue, then STOP.

1. Document what failed — specific error messages and why
2. Research alternatives — find 2-3 similar implementations
3. Question fundamentals — simpler approach? different abstraction?
4. Try a different angle

## Code Style

- **NEVER use "utils" or "helpers" in file names** — name files for their concern: `validation.go`, `formatting.go`, `parsing.go`
- For Go/golang changes, use the dedicated `golang` agent
- For TypeScript/JavaScript changes, use the dedicated `typescript-pro` agent 
- Table-driven tests are mandatory for Go
- Tests must call actual production code, not simulate it
- Comments are for "why", not "what"

## Sub-Agent Model Selection

### Other Sub-Agents
When spawning non-command-runner sub-agents, choose the cheapest model that fits:
- **haiku**: file search, grep/glob, formatting, boilerplate
- **sonnet**: multi-file implementation, refactoring, code review, clear-repro debugging
- **opus**: architecture decisions, complex debugging, ambiguous requirements, security review

## Worktree Safety

When working in git worktrees:

1. Run `pwd` first — verify correct worktree directory
2. Run `git rev-parse --git-dir` — output must contain `/worktrees/` to confirm you are in a worktree
3. Never modify files outside the current worktree
4. STOP if git confirms you're not in a worktree and ask for confirmation
