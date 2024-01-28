local function setup_lsp()
  vim.fn.sign_define("DiagnosticSignError", { text = "E", texthl = "DiagnosticSignError" })
  vim.fn.sign_define("DiagnosticSignWarn", { text = "W", texthl = "DiagnosticSignWarn" })
  vim.fn.sign_define(
  "DiagnosticSignInformation",
  { text = "I", texthl = "DiagnosticSignInformation" }
  )
  vim.fn.sign_define("DiagnosticSignHint", { text = "H", texthl = "DiagnosticSignHint" })

  vim.diagnostic.config({
    virtual_text = { spacing = 0, prefix = "" },
    signs = true,
    float = {
      wrap = true,
      pad_top = 0,
      pad_bottom = 0,
      focusable = true,
      style = "minimal",
      border = "single",
      source = "always",
      header = "",
      prefix = "",
      format = function(diagnostic)
        local sev = diagnostic.severity
        local msg = diagnostic.message
        if sev == vim.diagnostic.severity.ERROR then
          msg = ("[E] " .. msg)
        elseif sev == vim.diagnostic.severity.WARN then
          msg = ("[W] " .. msg)
        elseif sev == vim.diagnostic.severity.INFO then
          msg = ("[I] " .. msg)
        elseif sev == vim.diagnostic.severity.HINT then
          msg = ("[H] " .. msg)
        end
        return msg
      end,
    },
    severity_sort = true,
    underline = false,
    update_in_insert = false,
  })

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }


      -- Code navigation and shortcuts
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

      -- go to reference
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

      -- go to definition
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, opts)

      -- go to implementation
      vim.keymap.set("n", "gD", vim.lsp.buf.implementation, opts)


      -- code action!
      vim.keymap.set("i", "<c-.>", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<c-.>", vim.lsp.buf.code_action, opts)

      -- rename
      vim.keymap.set("x","<F2>",vim.lsp.buf.rename, opts)




    end,
  })

  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  local lspconfig = require("lspconfig")



  lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 },
    filetypes = { "lua" },
    log_level = 2,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = { globals = { "vim" } },
        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
        telemetry = { enable = false },
      },
    },
    single_file_support = true,
  })
end

return {
  "neovim/nvim-lspconfig",
  lazy = false,
  priority = 1000,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
    "hrsh7th/nvim-cmp",
  },

  config = function()
    setup_lsp()
  end,
}
