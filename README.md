# My NeoVim Files

![Example](example.png)

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
  - Ranger: Opens a file navigation.
  - NerdTree: Another more traditional file navigation.
  - NerdCommenter: Easy comment / uncomment (mapped as `leader cc` / `leader cu`).
  - Lightline: Beautiful status bar.
  - WIP: Fast and simple anotations based on git repo and branch

## Useful Commands

  - Leader: `,`
  - Command: `;`
  - Navigation: `h j k l`
  - Buffer navigation: `Tag`, `S-Tab`
  - Window navigation: `shift` + `← → ↑ ↓`
  - Ranger: `f2`
  - NerdTree: `f3`

### Searching

  - Clean searching: `,<space>`
  - Search git files: `ctrl p`
  - Search git files: `ctrl f`
  - Auto complete: `ctrl p`
  - Search terms in files: `,a`
  - Search current world: `,w`

### Replace

  - Replace current world: `,r`

### Programming

  - Comment: `,` + `cc`
  - Uncomment: `,` + `cu`
  - Open a project + branch based annotation file: `f8`
  - Generate tags (CTags): `,tt`
  - Search tags (CTags): `,t`
