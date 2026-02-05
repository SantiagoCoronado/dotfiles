# Neovim Cheat Sheet

Quick reference for keybindings in this configuration.

## Quick Reference (Most Used)

| Key                 | Mode | Description      |
| ------------------- | ---- | ---------------- |
| `<leader><space>`   | n    | Smart find files |
| `<leader>/`         | n    | Grep search      |
| `<leader>,`         | n    | Buffers          |
| `<leader>e`         | n    | File explorer    |
| `<Tab>` / `<S-Tab>` | n    | Next/prev buffer |
| `gd`                | n    | Go to definition |
| `gr`                | n    | References       |
| `K`                 | n    | Hover docs       |
| `<C-/>`             | n    | Toggle terminal  |
| `<C-s>`             | i/n  | Save file        |

## Navigation & Movement

### Line Navigation

| Key       | Mode  | Description                  |
| --------- | ----- | ---------------------------- |
| `H`       | n/x/o | Start of line                |
| `L`       | n/x/o | End of line                  |
| `j` / `k` | n/x   | Move down/up (display lines) |

### Window Navigation

| Key     | Mode | Description        |
| ------- | ---- | ------------------ |
| `<C-h>` | n/t  | Go to left window  |
| `<C-j>` | n/t  | Go to lower window |
| `<C-k>` | n/t  | Go to upper window |
| `<C-l>` | n/t  | Go to right window |

### Window Management

| Key                          | Mode | Description            |
| ---------------------------- | ---- | ---------------------- |
| `<C-Up>`                     | n    | Increase window height |
| `<C-Down>`                   | n    | Decrease window height |
| `<C-Left>`                   | n    | Decrease window width  |
| `<C-Right>`                  | n    | Increase window width  |
| `<leader>ww`                 | n    | Other window           |
| `<leader>wd`                 | n    | Delete window          |
| `<leader>w-` / `<leader>-`   | n    | Split below            |
| `<leader>w\|` / `<leader>\|` | n    | Split right            |
| `<leader>wm`                 | n    | Maximize window        |

## File Finding & Search (Snacks)

### File Pickers

| Key               | Mode | Description      |
| ----------------- | ---- | ---------------- |
| `<leader><space>` | n    | Smart find files |
| `<leader>ff`      | n    | Find files       |
| `<leader>fc`      | n    | Find config file |
| `<leader>fg`      | n    | Find git files   |
| `<leader>fr`      | n    | Recent files     |
| `<leader>fb`      | n    | Buffers          |
| `<leader>fp`      | n    | Projects         |
| `<leader>fn`      | n    | New file         |

### Search

| Key          | Mode | Description         |
| ------------ | ---- | ------------------- |
| `<leader>/`  | n    | Grep                |
| `<leader>sg` | n    | Grep                |
| `<leader>sw` | n/x  | Grep word/selection |
| `<leader>sb` | n    | Buffer lines        |
| `<leader>sB` | n    | Grep open buffers   |
| `<leader>sr` | n    | Search and replace  |
| `<leader>s/` | n    | Search history      |
| `<leader>sR` | n    | Resume last search  |

### Other Search

| Key          | Mode | Description        |
| ------------ | ---- | ------------------ |
| `<leader>:`  | n    | Command history    |
| `<leader>s"` | n    | Registers          |
| `<leader>sa` | n    | Autocmds           |
| `<leader>sc` | n    | Command history    |
| `<leader>sC` | n    | Commands           |
| `<leader>sd` | n    | Diagnostics        |
| `<leader>sD` | n    | Buffer diagnostics |
| `<leader>sh` | n    | Help pages         |
| `<leader>sH` | n    | Highlights         |
| `<leader>si` | n    | Icons              |
| `<leader>sj` | n    | Jumps              |
| `<leader>sk` | n    | Keymaps            |
| `<leader>sl` | n    | Location list      |
| `<leader>sm` | n    | Marks              |
| `<leader>sM` | n    | Man pages          |
| `<leader>sp` | n    | Plugin specs       |
| `<leader>sq` | n    | Quickfix list      |
| `<leader>su` | n    | Undo history       |

## LSP & Code Intelligence

### Go-To Commands

| Key   | Mode | Description           |
| ----- | ---- | --------------------- |
| `gd`  | n    | Go to definition      |
| `gD`  | n    | Go to declaration     |
| `gr`  | n    | References            |
| `gI`  | n    | Go to implementation  |
| `gy`  | n    | Go to type definition |
| `gai` | n    | Incoming calls        |
| `gao` | n    | Outgoing calls        |

### Documentation

| Key     | Mode | Description         |
| ------- | ---- | ------------------- |
| `K`     | n    | Hover documentation |
| `gK`    | n    | Signature help      |
| `<C-k>` | i    | Signature help      |

### Code Actions (Neovim defaults)

| Key   | Mode | Description |
| ----- | ---- | ----------- |
| `gra` | n    | Code action |
| `grn` | n    | Rename      |

### Symbols

| Key          | Mode | Description       |
| ------------ | ---- | ----------------- |
| `<leader>ss` | n    | LSP symbols       |
| `<leader>sS` | n    | Workspace symbols |

### Diagnostics

| Key          | Mode | Description          |
| ------------ | ---- | -------------------- |
| `<leader>cd` | n    | Line diagnostics     |
| `]d` / `[d`  | n    | Next/prev diagnostic |
| `]e` / `[e`  | n    | Next/prev error      |
| `]w` / `[w`  | n    | Next/prev warning    |

### Formatting

| Key          | Mode | Description   |
| ------------ | ---- | ------------- |
| `<leader>cf` | n    | Format buffer |
| `<leader>cm` | n    | Mason UI      |

## Editing

### Move Lines

| Key     | Mode  | Description       |
| ------- | ----- | ----------------- |
| `<A-j>` | n/i/v | Move line(s) down |
| `<A-k>` | n/i/v | Move line(s) up   |
| `<M-h>` | n/v   | Move left         |
| `<M-j>` | n/v   | Move down         |
| `<M-k>` | n/v   | Move up           |
| `<M-l>` | n/v   | Move right        |

### Surround (mini.surround)

| Key  | Mode | Description              |
| ---- | ---- | ------------------------ |
| `sa` | n/v  | Add surrounding          |
| `sd` | n    | Delete surrounding       |
| `sr` | n    | Replace surrounding      |
| `sf` | n    | Find surrounding (right) |
| `sF` | n    | Find surrounding (left)  |
| `sh` | n    | Highlight surrounding    |
| `sn` | n    | Update n_lines           |

### Operators (mini.operators)

| Key   | Mode | Description           |
| ----- | ---- | --------------------- |
| `g=`  | n    | Evaluate and replace  |
| `gx`  | n    | Exchange text regions |
| `gm`  | n    | Multiply (duplicate)  |
| `gR`  | n    | Replace with register |
| `gss` | n    | Sort text             |

### Split/Join

| Key  | Mode | Description       |
| ---- | ---- | ----------------- |
| `gS` | n    | Toggle split/join |

### Comments (mini.comment)

| Key          | Mode | Description       |
| ------------ | ---- | ----------------- |
| `gc`         | n/v  | Toggle comment    |
| `gcc`        | n    | Comment line      |
| `<leader>co` | n    | Add comment below |
| `<leader>cO` | n    | Add comment above |

### Indentation

| Key | Mode | Description                   |
| --- | ---- | ----------------------------- |
| `<` | v    | Indent left (stay in visual)  |
| `>` | v    | Indent right (stay in visual) |

## Text Objects (mini.ai)

Use with operators like `d`, `c`, `y`, `v`:

- `a` = around, `i` = inside

| Object | Description                   |
| ------ | ----------------------------- |
| `o`    | Code block (loop/conditional) |
| `f`    | Function                      |
| `c`    | Class                         |
| `t`    | HTML/XML tag                  |
| `d`    | Digits                        |
| `e`    | Word with case (camelCase)    |
| `u`    | Function call                 |
| `U`    | Function call (no dot)        |

Example: `daf` = delete around function, `cic` = change inside class

## Git

### Lazygit & Pickers

| Key          | Mode | Description      |
| ------------ | ---- | ---------------- |
| `<leader>gg` | n    | Lazygit          |
| `<leader>gb` | n    | Git branches     |
| `<leader>gl` | n    | Git log          |
| `<leader>gL` | n    | Git log (line)   |
| `<leader>gf` | n    | Git log (file)   |
| `<leader>gs` | n    | Git status       |
| `<leader>gS` | n    | Git stash        |
| `<leader>gd` | n    | Git diff (hunks) |

### GitHub

| Key          | Mode | Description          |
| ------------ | ---- | -------------------- |
| `<leader>gi` | n    | GitHub issues (open) |
| `<leader>gI` | n    | GitHub issues (all)  |
| `<leader>gp` | n    | GitHub PRs (open)    |
| `<leader>gP` | n    | GitHub PRs (all)     |

### Diff (mini.diff)

| Key          | Mode | Description         |
| ------------ | ---- | ------------------- |
| `<leader>go` | n    | Toggle diff overlay |
| `gh`         | n/v  | Apply hunk          |
| `gH`         | n/v  | Reset hunk          |
| `[h` / `]h`  | n    | Prev/next hunk      |
| `[H` / `]H`  | n    | First/last hunk     |

## Completion (blink.cmp)

| Key         | Mode | Description                  |
| ----------- | ---- | ---------------------------- |
| `<C-Space>` | i    | Show/toggle docs             |
| `<C-e>`     | i    | Hide completion              |
| `<CR>`      | i    | Accept completion            |
| `<Tab>`     | i    | Next item / snippet forward  |
| `<S-Tab>`   | i    | Prev item / snippet backward |
| `<C-n>`     | i    | Next item                    |
| `<C-p>`     | i    | Previous item                |
| `<C-b>`     | i    | Scroll docs up               |
| `<C-f>`     | i    | Scroll docs down             |

## Toggles (`<leader>u*`)

| Key          | Description             |
| ------------ | ----------------------- |
| `<leader>uf` | Toggle autoformat       |
| `<leader>us` | Toggle spelling         |
| `<leader>uw` | Toggle word wrap        |
| `<leader>ul` | Toggle line numbers     |
| `<leader>uL` | Toggle relative numbers |
| `<leader>ud` | Toggle diagnostics      |
| `<leader>uh` | Toggle inlay hints      |
| `<leader>uc` | Toggle conceal          |
| `<leader>um` | Toggle modifiable       |
| `<leader>ui` | Inspect pos             |
| `<leader>uI` | Inspect tree            |
| `<leader>uC` | Colorschemes            |
| `<leader>ur` | Redraw/clear hlsearch   |

## Buffer Management

| Key          | Mode | Description              |
| ------------ | ---- | ------------------------ |
| `<Tab>`      | n    | Next buffer              |
| `<S-Tab>`    | n    | Previous buffer          |
| `[b` / `]b`  | n    | Prev/next buffer         |
| `[B` / `]B`  | n    | Move buffer left/right   |
| `<leader>ba` | n    | Alternate buffer         |
| `<leader>bd` | n    | Delete buffer            |
| `<leader>bD` | n    | Delete buffer and window |
| `<leader>bp` | n    | Toggle pin               |
| `<leader>bP` | n    | Delete non-pinned        |
| `<leader>bo` | n    | Delete other buffers     |
| `<leader>br` | n    | Delete buffers to right  |
| `<leader>bl` | n    | Delete buffers to left   |

## Tabs

| Key                  | Mode | Description  |
| -------------------- | ---- | ------------ |
| `<leader><tab><tab>` | n    | New tab      |
| `<leader><tab>d`     | n    | Close tab    |
| `<leader><tab>]`     | n    | Next tab     |
| `<leader><tab>[`     | n    | Previous tab |
| `<leader><tab>f`     | n    | First tab    |
| `<leader><tab>l`     | n    | Last tab     |

## Terminal

| Key           | Mode | Description        |
| ------------- | ---- | ------------------ |
| `<C-/>`       | n/t  | Toggle terminal    |
| `<Esc><Esc>`  | t    | Enter normal mode  |
| `<C-h/j/k/l>` | t    | Navigate to window |

## Bracketed Navigation (`[x` / `]x`)

mini.bracketed provides quick navigation with `[` (previous) and `]` (next):

| Suffix    | Target                         |
| --------- | ------------------------------ |
| `b` / `B` | Buffer (next/prev, first/last) |
| `c`       | Comment                        |
| `x`       | Conflict marker                |
| `d`       | Diagnostic                     |
| `f`       | File (in directory)            |
| `h` / `H` | Git hunk                       |
| `i`       | Indent                         |
| `j`       | Jump                           |
| `l`       | Location list                  |
| `o`       | Old file                       |
| `q`       | Quickfix                       |
| `t`       | Treesitter node                |
| `u`       | Undo state                     |
| `w`       | Window                         |
| `y`       | Yank                           |

Capital letter = first/last, lowercase = prev/next

## Claude Code Integration

| Key          | Mode | Description    |
| ------------ | ---- | -------------- |
| `<leader>ac` | n    | Toggle Claude  |
| `<leader>af` | n    | Focus Claude   |
| `<leader>as` | v    | Send to Claude |

## Miscellaneous

| Key          | Mode    | Description         |
| ------------ | ------- | ------------------- |
| `<Esc>`      | i/n     | Clear hlsearch      |
| `<C-s>`      | i/x/n/s | Save file           |
| `<leader>ll` | n       | Lazy plugin manager |
| `<leader>n`  | n       | Notifications       |
| `<leader>qq` | n       | Quit all            |
