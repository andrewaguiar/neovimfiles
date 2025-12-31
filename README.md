# My NeoVim Files

## Installation

```shell
cd ~/.config &&
git clone git@github.com:andrewaguiar/neovimfiles.git nvim
```

After cloning the repo enter nvim and execute `:PlugInstall`

## Plugins

  - Gruvbox: Color schema Gruvbox for the win.
  - Vim-polyglot: Syntax for several languages.
  - FZF: Fuzzy searching and auto complete (mapped as `ctrl p`).
  - NerdTree: More traditional file navigation.
  - NerdCommenter: Easy comment / uncomment (mapped as `leader cc` / `leader cu`).
  - Lightline: Beautiful status bar.
  - WIP: Fast and simple anotations based on git repo and branch.

## Useful Commands

  - Leader: `,`
  - Command: `;`
  - Navigation: `h j k l`
  - Buffer navigation: `Tag`, `S-Tab`
  - Window navigation: `shift` + `← → ↑ ↓`

### Searching

  - Clean searching: `,<space>`
  - Search files: `ctrl p`
  - Search terms in files: `,a`
  - Search current world: `,w`

### Replace

  - Replace current world: `,r`

### Programming

  - Comment: `,` + `cc`
  - Uncomment: `,` + `cu`
  - Open a project + branch based annotation file: `,8`

