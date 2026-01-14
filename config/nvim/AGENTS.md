# Repository Guidelines

## Project Structure & Module Organization
`init.lua` bootstraps Lazy.nvim and delegates configuration to `lua/core/`. Load base defaults from `lua/core/` (`options.lua`, `globals.lua`, `autocmds.lua`, `keymaps.lua`) via `require("core")`, then call `require("core.lazy").setup()` which imports every plugin spec under `lua/plugins/` (one file per plugin, plus `core.lua` for shared libs). Plugin setup lives inside each spec; buffer-level defaults are applied via `after/ftplugin/` files.

## Build, Test, and Development Commands
- `nvim --headless "+Lazy sync" +qa` — reconcile plugin specs with `lazy-lock.json` before commit.
- `nvim --headless "+MasonUpdate" +qa` — refresh external tooling whenever LSPs/formatters change.
- `nvim --headless "+checkhealth" +qa` — verify runtime health after structural or dependency edits.
During iterative work use `:luafile %` to reload the current file and `:Lazy profile` to inspect startup.

## Coding Style & Naming Conventions
Prefer two-space indentation and `snake_case` identifiers. Modules should follow `local M = {}; …; return M`, avoid implicit globals, and keep ASCII unless legacy code proves otherwise. Keep plugin specs declarative but self-contained: put their options/config in the spec file. Extend per-language behaviour via `after/ftplugin/<filetype>.lua` rather than inline shell-outs.

## Testing Guidelines
After touching plugins or configs, run the Lazy, Mason, and health headless commands above. Spot-check Treesitter, LSP, and formatting by opening representative files (`demo.py`, `main.rs`, `app.tsx`, `main.go`). When changes affect diagnostics or UI, capture the behaviour with `:checkhealth` and `:Lazy doctor` to confirm no regressions remain.

## Commit & Pull Request Guidelines
Use short, present-tense summaries under ~65 characters (e.g., `refine lsp setup module`). Stage `lazy-lock.json` with related plugin updates. PRs should outline scope, list validation steps (commands executed, platforms), call out follow-up tasks, and attach screenshots or terminal captures for UX-facing adjustments.

## Configuration Tips
We intentionally disable Lazy's LuaRocks integration in `init.lua`; re-enable it only after provisioning a working Hererocks toolchain. Guard platform-specific logic with `vim.fn.has()` and quarantine secrets in ignored files. For risky refactors, branch early and ship minimal diffs to keep the health checklist fast.
