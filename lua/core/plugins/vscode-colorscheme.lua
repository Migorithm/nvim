
return {
  'Mofiqul/vscode.nvim',
  config = function()

    -- Lua:
    -- For dark theme (neovim's default)
    vim.o.background = 'dark'
    -- For light theme
    -- vim.o.background = 'light'

    local c = require('vscode.colors').get_colors()
    require('vscode').setup({
      -- Alternatively set style in setup
      -- style = 'light'

      -- Enable transparent background
      transparent = true,

      -- Enable italic comment
      italic_comments = true,

      -- Disable nvim-tree background color
      disable_nvimtree_bg = false,

      -- Override colors (see ./lua/vscode/colors.lua)
      color_overrides = {
        vscLineNumber = "#756e5b"
      },

      -- Override highlight groups (see ./lua/vscode/theme.lua)
      group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
      }
    })
    require('vscode').load()

    -- hl stands for highlight, you can inspect its info by putting `:Inspect` 
    vim.api.nvim_set_hl(0, "Normal", {  bg = "#2b2a26" })
    vim.api.nvim_set_hl(0, "@keyword", { fg = "#5382cf", bg = "#2b2a26" })
    vim.api.nvim_set_hl(0, "@include", { fg = "#5382cf", bg = "#2b2a26" })
    vim.api.nvim_set_hl(0, "InlayHints",{ fg="#756e5b"})
    vim.api.nvim_set_hl(0,"DiagnosticWarn",{fg="#756e5b"})
  end
}



