if !has('termguicolors') && !has('gui_running')
  echoerr 'kikwis colorscheme only works with termguicolors set.'
  finish
endif

highlight clear
syntax reset

set termguicolors
set t_Co=256
set background=dark

let g:colors_name = 'kikwis'
let g:kikwis_palette = 'lopsa'

lua << EOL
require('kikwis').setup({
  palette = vim.g.kikwis_palette
})
EOL
