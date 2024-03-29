--return {
--   'nvim-treesitter/nvim-treesitter',
--  config = function()
--
--    require('nvim-treesitter.configs').setup{
--      -- A list of parser names or "all"
--      ensure_installed = {"rust", "vim", "toml"},
--
--      -- install parsers synchronously
--      auto_install = true,
--      highlight = {
--        enable = true,
--        additional_vim_regex_highlighting=false,
--      },
--      ident = { enable = true },
--      rainbow = {
--        enable = true,
--        extended_mode = true,
--        max_file_lines = nil,
--      }
--
--    }
--
--    vim.wo.foldmethod = 'expr'
--    vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
--
--  end
--}
return {
  "nvim-treesitter/nvim-treesitter",
  tag = "v0.9.2",
  event = "BufEnter",
  build = ":TSUpdate",
  dependencies = { "windwp/nvim-ts-autotag" },
  config = function()
    local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitter"
    vim.fn.mkdir(parser_install_dir, "p")
    vim.opt.runtimepath:append(parser_install_dir)

    require("nvim-treesitter.configs").setup({
      parser_install_dir = parser_install_dir,
      ensure_installed = "all",
      ignore_install = { "erlang" },
      highlight = {
        enable = true,
        disable = { "c", "cc", "cpp", "vimdoc", "lua" },
        additional_vim_regex_highlighting = false,
      },
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,
        filetypes = {
          "html",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "tsx",
          "jsx",
        },
      },
      sync_install = false,
    })
  end,
}
