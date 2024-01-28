-- https://github.com/mrcjkb/rustaceanvim
return {
  "mrcjkb/rustaceanvim",
  version = "^3",
  ft = { "rust" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
    {
      "lvimuser/lsp-inlayhints.nvim",
      opts = {}
    },
  },
  config = function()

    vim.api.nvim_set_hl(0, "CustomInlay",{ fg="#756e5b"})
    vim.g.rustaceanvim = {
      inlay_hints = {
        highlight = "CustomInlay",

      },
      tools = {
        hover_actions = {
          auto_focus = true,
        },
      },
      server = {
        on_attach = function(client, bufnr)
          require("lsp-inlayhints").on_attach(client, bufnr)
        end
      }
    }
  end



}
