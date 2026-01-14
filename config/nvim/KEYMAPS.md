# Keymap Cheat Sheet

Leader key: `<Space>`

## General

| Key | Description |
|-----|-------------|
| `<C-s>` | Save file |
| `<Esc>` | Clear search highlight |
| `<leader>qq` | Quit all |
| `<leader>fn` | New file |
| `<leader>ll` | Open Lazy plugin manager |

## Navigation

| Key | Description |
|-----|-------------|
| `j` / `k` | Move down/up (respects wrapped lines) |
| `<C-h/j/k/l>` | Move between windows |
| `<C-Up/Down>` | Resize window height |
| `<C-Left/Right>` | Resize window width |

## Move Lines

| Key | Mode | Description |
|-----|------|-------------|
| `<A-j>` | n/i/v | Move line(s) down |
| `<A-k>` | n/i/v | Move line(s) up |

## Buffers

| Key | Description |
|-----|-------------|
| `<S-h>` / `[b` | Previous buffer |
| `<S-l>` / `]b` | Next buffer |
| `<leader>ba` | Alternate buffer |
| `<leader>bd` | Delete buffer |
| `<leader>bD` | Delete buffer and window |

## Windows

| Key | Description |
|-----|-------------|
| `<leader>ww` | Other window |
| `<leader>wd` | Delete window |
| `<leader>w-` / `<leader>-` | Split below |
| `<leader>w\|` / `<leader>\|` | Split right |
| `<leader>wm` | Maximize window |

## Tabs

| Key | Description |
|-----|-------------|
| `<leader><tab><tab>` | New tab |
| `<leader><tab>d` | Close tab |
| `<leader><tab>]` | Next tab |
| `<leader><tab>[` | Previous tab |
| `<leader><tab>l` | Last tab |
| `<leader><tab>f` | First tab |

## Snacks Picker

### Top Pickers

| Key | Description |
|-----|-------------|
| `<leader><space>` | Smart find files |
| `<leader>,` | Buffers |
| `<leader>/` | Grep |
| `<leader>:` | Command history |
| `<leader>n` | Notification history |
| `<leader>e` | File explorer |

### Find

| Key | Description |
|-----|-------------|
| `<leader>fb` | Buffers |
| `<leader>fc` | Find config file |
| `<leader>ff` | Find files |
| `<leader>fg` | Find git files |
| `<leader>fp` | Projects |
| `<leader>fr` | Recent files |

### Git

| Key | Description |
|-----|-------------|
| `<leader>gb` | Git branches |
| `<leader>gl` | Git log |
| `<leader>gL` | Git log line |
| `<leader>gs` | Git status |
| `<leader>gS` | Git stash |
| `<leader>gd` | Git diff (hunks) |
| `<leader>gf` | Git log file |

### GitHub

| Key | Description |
|-----|-------------|
| `<leader>gi` | GitHub issues (open) |
| `<leader>gI` | GitHub issues (all) |
| `<leader>gp` | GitHub PRs (open) |
| `<leader>gP` | GitHub PRs (all) |

### Search / Grep

| Key | Description |
|-----|-------------|
| `<leader>sb` | Buffer lines |
| `<leader>sB` | Grep open buffers |
| `<leader>sg` | Grep |
| `<leader>sw` | Grep word (n/x mode) |
| `<leader>s"` | Registers |
| `<leader>s/` | Search history |
| `<leader>sa` | Autocmds |
| `<leader>sc` | Command history |
| `<leader>sC` | Commands |
| `<leader>sd` | Diagnostics |
| `<leader>sD` | Buffer diagnostics |
| `<leader>sh` | Help pages |
| `<leader>sH` | Highlights |
| `<leader>si` | Icons |
| `<leader>sj` | Jumps |
| `<leader>sk` | Keymaps |
| `<leader>sl` | Location list |
| `<leader>sm` | Marks |
| `<leader>sM` | Man pages |
| `<leader>sp` | Plugin spec |
| `<leader>sq` | Quickfix list |
| `<leader>sR` | Resume picker |
| `<leader>su` | Undo history |
| `<leader>uC` | Colorschemes |

## LSP

| Key | Description |
|-----|-------------|
| `gd` | Goto definition |
| `gD` | Goto declaration |
| `gr` | References |
| `gI` | Goto implementation |
| `gy` | Goto type definition |
| `gai` | Incoming calls |
| `gao` | Outgoing calls |
| `K` | Hover |
| `gK` | Signature help |
| `<C-k>` (insert) | Signature help |
| `<leader>ca` | Code action |
| `<leader>cr` | Rename |
| `<leader>cf` | Format |
| `<leader>cd` | Line diagnostics |
| `<leader>ss` | LSP symbols |
| `<leader>sS` | Workspace symbols |

## Diagnostics Navigation

| Key | Description |
|-----|-------------|
| `]d` / `[d` | Next/prev diagnostic |
| `]e` / `[e` | Next/prev error |
| `]w` / `[w` | Next/prev warning |

## Comments

| Key | Description |
|-----|-------------|
| `<leader>co` | Add comment below |
| `<leader>cO` | Add comment above |

## Toggle Options (UI)

| Key | Description |
|-----|-------------|
| `<leader>uf` | Toggle autoformat |
| `<leader>us` | Toggle spelling |
| `<leader>uw` | Toggle word wrap |
| `<leader>ul` | Toggle line numbers |
| `<leader>uL` | Toggle relative numbers |
| `<leader>ud` | Toggle diagnostics |
| `<leader>uc` | Toggle conceal |
| `<leader>uh` | Toggle inlay hints |
| `<leader>um` | Toggle modifiable |
| `<leader>ui` | Inspect position |
| `<leader>uI` | Inspect tree |
| `<leader>ur` | Redraw/clear hlsearch |

## Terminal

| Key | Description |
|-----|-------------|
| `<Esc><Esc>` | Exit terminal mode |
| `<C-h/j/k/l>` | Navigate from terminal |
| `<C-/>` | Hide terminal |

## Snacks Explorer

| Key | Description |
|-----|-------------|
| `<CR>` / `l` | Open file / toggle dir |
| `h` | Close directory |
| `<BS>` | Go up directory |
| `.` | Set cwd to current |
| `H` | Toggle hidden files |
| `I` | Toggle ignored files |
| `Z` | Close all directories |
| `a` | Add file/directory |
| `d` | Delete |
| `r` | Rename |
| `c` | Copy (with selection) |
| `m` | Move (with selection) |
| `y` | Yank paths |
| `p` | Paste (copy from register) |
| `o` | Open with system app |
| `u` | Refresh |
| `<Tab>` | Select file |
| `P` | Toggle preview |
| `]g` / `[g` | Next/prev git change |
| `]d` / `[d` | Next/prev diagnostic |
