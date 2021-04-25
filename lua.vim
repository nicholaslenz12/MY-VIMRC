lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
	enable = true,
  },
}

require('lualine').setup{
  options = {
  theme = 'gruvbox',
  },
}
EOF
