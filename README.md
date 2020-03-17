# My NeoVim Files

![Example](example.png)

## Installation

```shell
cd ~/.config &&
git clone git@github.com:andrewaguiar/neovimfiles.git nvim
```

After cloning the repo enter nvim and execute `:PlugInstall`

## Plugins

  - Badwolf: Color schema BadWolf for the win.
  - Vim-polyglot: Syntax for several languages.
  - FZF: Fuzzy searching and auto complete (mapped as `ctrl p`).
  - Ranger: Opens a file navigation.
  - NerdCommenter: Easy comment / uncomment (mapped as `leader cc` / `leader cu`).
  - Lightline: Beautiful status bar.
  - PutBreakPoints: Puts breakpoints in the code according the file and project
  - WIP: Fast and simple anotations based on git repo and branch

## Useful Commands

  - Leader: `,`
  - Command: `;`
  - Navigation: `h j k l`
  - Buffer navigation: `← →`
  - Window navigation: `shift` + `← → ↑ ↓`
  - Ranger: `f2`

### Copy / Paste

  - Paste from External: `f3`
  - Copy to External: `f4`

### Searching

  - Clean searching: `,` + `<space>`
  - Search files: `ctrl` + `p`
  - Auto complete: `ctrl` + `p`
  - Search terms in files: `;` + `Ag <term> [paths]`
  - Search current world: `f9`

### Replace

  - Replace current world: `,` + `s`

### All buffers

  - Delete all buffers: `Del`

### Programming

  - Put breakpoint: `,` + `p`
  - Comment: `,` + `cc`
  - Uncomment: `,` + `cu`
  - Open a project + branch based annotation file: `f8`
  - Generate tags (CTags): `,` + `f10`
  - Search tags (CTags): `,` + `f10`

### Files / Dir shortcuts

  - Create missing buffer path: `,` + `mk`
  - Remove current buffer file: `,` + `rm`
