
local function setup_rust_tools()
  local function on_attach(_, bufnr)
    local function map(mode, lhs, rhs, opts)
      local options = { noremap = true, silent = true, buffer = bufnr }
      if opts then
        options = vim.tbl_extend("force", options, opts)
      end
      vim.keymap.set(mode, lhs, rhs, options)
    end

    map("n", "K", function()
      ((require("rust-tools")).hover_actions).hover_actions()
    end, { desc = "display symbol information at the cursor" })

    map("n", "<leader>oc", function()
      ((require("rust-tools")).open_cargo_toml).open_cargo_toml()
    end, { desc = "open Cargo.toml" })

    map("n", "<leader>rr", function()
      ((require("rust-tools")).runnables).runnables()
    end, { desc = "run a Rust runnable" })

    map("n", "<leader>M", function()
      ((require("rust-tools")).expand_macro).expand_macro()
    end, { desc = "expand macros recursively" })
  end

  require("rust-tools").setup({
    tools = {
      executor = require("rust-tools.executors").termopen,
      on_initialized = nil,
      reload_workspace_from_cargo_toml = true,
      inlay_hints = {
        show_parameter_hints = true,
        parameter_hints_prefix = "",
        other_hints_prefix = "-> ",
        max_len_align_padding = 1,
        right_align_padding = 7,
        highlight = "InlayHints",
        only_current_line = false,
        show_variable_name = false,
        max_len_align = false,
        right_align = false,
      },
      hover_actions = {
        border = "single",
        max_width = nil,
        max_height = nil,
        auto_focus = false,
      },
      crate_graph = {
        backend = "x11",
        output = nil,
        full = true,
        enabled_graphviz_backends = {
          "bmp",
          "cgimage",
          "canon",
          "dot",
          "gv",
          "xdot",
          "xdot1.2",
          "xdot1.4",
          "eps",
          "exr",
          "fig",
          "gd",
          "gd2",
          "gif",
          "gtk",
          "ico",
          "cmap",
          "ismap",
          "imap",
          "cmapx",
          "imap_np",
          "cmapx_np",
          "jpg",
          "jpeg",
          "jpe",
          "jp2",
          "json",
          "json0",
          "dot_json",
          "xdot_json",
          "pdf",
          "pic",
          "pct",
          "pict",
          "plain",
          "plain-ext",
          "png",
          "pov",
          "ps",
          "ps2",
          "psd",
          "sgi",
          "svg",
          "svgz",
          "tga",
          "tiff",
          "tif",
          "tk",
          "vml",
          "vmlz",
          "wbmp",
          "webp",
          "xlib",
          "x11",
        },
      },
    },
    server = {
      on_attach = on_attach,
      standalone = true,
      settings = {
        ["rust-analyzer"] = {},
      },
    },
    dap = {
      adapter = {
        type = "executable",
        command = "lldb-vscode",
        name = "rt_lldb",
      },
    },
  })
end

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




  setup_rust_tools()
end

return {
  "neovim/nvim-lspconfig",
  lazy = false,
  priority = 1000,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "simrat39/rust-tools.nvim",
    "p00f/clangd_extensions.nvim",
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
    "hrsh7th/nvim-cmp",
  },

  config = function()
    setup_lsp()
  end,
}
