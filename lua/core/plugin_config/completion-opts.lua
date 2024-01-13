--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}

-- Avoid showing extra messages when using completion
vim.opt.shortmess = vim.opt.shortmess + { c = true}

local function on_attach(client, buffer)
  -- This callback is called when the LSP is atttached/enabled for this buffer
  -- we could set keymaps related to LSP, etc here.
end

local keymap_opts = { buffer = buffer }
-- Code navigation and shortcuts
vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)

-- go to reference
vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)

-- go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, keymap_opts)

-- go to implementation
vim.keymap.set("n", "gD", vim.lsp.buf.implementation, keymap_opts)


-- code action!
vim.keymap.set("i", "<c-.>", vim.lsp.buf.code_action, keymap_opts)
vim.keymap.set("n", "<c-.>", vim.lsp.buf.code_action, keymap_opts)

-- bracket
vim.keymap.set("i", "<", "<><Left>")
vim.keymap.set("i", "{", "{}<Left>")
vim.keymap.set("i", "(", "()<Left>")
vim.keymap.set("i", "\"", "\"\"<Left>")
vim.keymap.set("i", "'", "''<Left>")

-- Configure LSP through rust-tools.nvim plugin.
-- rust-tools will configure and enable certain LSP features for us.
-- See https://github.com/simrat39/rust-tools.nvim#configuration
local opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },

  -- all the opts to send to nvim-lspconfig
  -- these override the defaults set by rust-tools.nvim
  -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
  server = {
    -- on_attach is a callback called when the language server attachs to the buffer
    on_attach = on_attach,
    settings = {
      -- to enable rust-analyzer settings visit:
      -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
      ["rust-analyzer"] = {
        -- enable clippy on save
        checkOnSave = {
          command = "clippy",
        },
      },
    },
  },
}

require("rust-tools").setup(opts)




-- Completion Plugin Setup

-- Setup Completion
-- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
local cmp = require("cmp")
cmp.setup({
  preselect = cmp.PreselectMode.None,
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    -- Add tab support
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },

  -- Installed sources
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "path" },
    { name = "buffer" },
  },
})
