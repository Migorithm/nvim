
return {
  'nvim-tree/nvim-tree.lua',
  dependencies={
    'nvim-tree/nvim-web-devicons',
  },
  config = function()

    vim.g.loaded_netrw=1
    vim.g.loaded_netrwPlugin=1

    require("nvim-tree").setup{
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      }
    }

    vim.keymap.set('n', '<c-n>', ':NvimTreeFindFileToggle<CR>')

  end
}

