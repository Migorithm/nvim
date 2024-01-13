require('nvim-treesitter.configs').setup{
  -- A list of parser names or "all"
  ensure_installed = {"rust", "vim", "toml"},

  -- install parsers synchronously
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  ident = { enable = true }, 
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }

}

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

