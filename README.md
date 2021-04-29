## kikwis

kikwis is a calm colorscheme with bright colors. The main focus is right the colors and support tree-sitter and neovim built-in lsp.

![screenshot](https://github.com/lucastrvsn/kikwis/raw/master/assets/screenshot.png)

> In this screenshot, font used is SF Mono (by Apple) and Alacritty terminal.

- Handpicked colors to make it all good to look at
- Mid-tone colors with nice constrast between them
- Full support for `tree-sitter` and neovim built-in lsp
- Supported plugins: `telescope.nvim`

### Requirements

- Neovim 0.5 nightly with built-in lsp and tree-sitter. You can learn how to install and use it on the [neovim repository](https://github.com/neovim/neovim).

### Installation

Using [packer](https://github.com/wbthomason/packer.nvim):

```lua
use { 'lucastrvsn/kikwis' }
```

Using [paq](https://github.com/savq/paq-nvim):

```lua
paq { 'lucastrvsn/kikwis' }
```

### Usage

Simple set your colorscheme with:

```lua
vim.cmd('colorscheme kikwis')
```

### Options

TODO

## Related

- Alacritty theme: []()
- Kitty theme: []()
- iTerm2 theme: []()
- Tmux theme: []()

### Inspiration

This theme is inspired on [gruvbox](https://github.com/morhetz/gruvbox) and on colors from [The Legend of Zelda's Kikwi](https://zelda.fandom.com/wiki/Kikwi) race.
