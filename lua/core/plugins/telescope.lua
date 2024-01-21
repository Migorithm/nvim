return {
  'nvim-telescope/telescope.nvim',
  tag= '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },

 config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>.', builtin.find_files, {})
    vim.keymap.set('n', '<leader>,', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

    return require("telescope").setup({
      defaults = {
        sorting_strategy = "ascending",
        selection_strategy = "reset",
        scroll_strategy = "cycle",
        winblend = 0,
        wrap_results = false,
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        border = true,
        path_display = { truncate = 3 },
        results_title = "",
        preview = {
          check_mime_type = false,
          filesize_limit = 25, -- MB
          timeout = 500, -- ms
          hide_on_startup = true,
        },
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
            ["<tab>"] = require("telescope.actions").move_selection_next,
            ["<s-tab>"] = require("telescope.actions").move_selection_previous,
            ["<c-j>"] = require("telescope.actions").move_selection_next,
            ["<c-k>"] = require("telescope.actions").move_selection_previous,
            ["<c-p>"] = require("telescope.actions.layout").toggle_preview,
          },
        },
        cache_picker = {
          num_pickers = -1,
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
      },
      pickers = {
        find_files = {
          layout_config = { prompt_position = "top", height = 0.35 },
          layout_strategy = "bottom_pane",
          prompt_prefix = " [files] ",
          prompt_title = "",
          preview_title = "",
        },
        buffers = {
          layout_config = { prompt_position = "top", height = 0.35 },
          layout_strategy = "bottom_pane",
          prompt_prefix = " [buffers] ",
          prompt_title = "",
          preview_title = "",
        },
        oldfiles = {
          layout_config = { prompt_position = "top", height = 0.35 },
          layout_strategy = "bottom_pane",
          prompt_prefix = " [~files] ",
          prompt_title = "",
          preview_title = "",
        },
        live_grep = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.75,
            height = 0.75,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (rg) ",
          prompt_title = "",
          preview_title = "",
        },
        grep_string = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.75,
            height = 0.75,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (rg %) ",
          prompt_title = "",
          preview_title = "",
        },
        commands = {
          layout_config = { prompt_position = "top", height = 0.35 },
          layout_strategy = "bottom_pane",
          prompt_prefix = " [commands] ",
          prompt_title = "",
          preview_title = "",
        },
        man_pages = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.75,
            height = 0.75,
          },
          layout_strategy = "vertical",
          prompt_prefix = " [man pages] ",
          prompt_title = "",
          preview_title = "",
        },
        help_tags = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.75,
            height = 0.75,
          },
          layout_strategy = "vertical",
          prompt_prefix = " [help tags] ",
          prompt_title = "",
          preview_title = "",
        },
        highlights = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.75,
            height = 0.75,
          },
          layout_strategy = "vertical",
          prompt_prefix = " [highlights] ",
          prompt_title = "",
          preview_title = "",
        },
        diagnostics = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.75,
            height = 0.75,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (refs) ",
          prompt_title = "",
          preview_title = "",
        },
        lsp_references = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.75,
            height = 0.75,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (refs) ",
          prompt_title = "",
          preview_title = "",
        },
        lsp_implementations = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.75,
            height = 0.75,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (impls) ",
          prompt_title = "",
          preview_title = "",
        },
        git_status = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.9,
            height = 0.9,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (git status) ",
          prompt_title = "",
          preview_title = "",
        },
        git_branches = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.9,
            height = 0.9,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (git branches) ",
          prompt_title = "",
          preview_title = "",
        },
        git_bcommits = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.9,
            height = 0.9,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (git commits for current buffer) ",
          prompt_title = "",
          preview_title = "",
        },
        pickers = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.7,
            height = 0.7,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (pickers) ",
          prompt_title = "",
          preview_title = "",
        },
        current_buffer_fuzzy_find = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.75,
            height = 0.75,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (rg current buffer) ",
          prompt_title = "",
          preview_title = "",
        },
        current_buffer_tags = {
          layout_config = {
            anchor = "CENTER",
            prompt_position = "top",
            mirror = true,
            width = 0.75,
            height = 0.75,
          },
          layout_strategy = "vertical",
          prompt_prefix = " (current buffer tags) ",
          prompt_title = "",
          preview_title = "",
        },
      },
      extensions = {},
    })
  end,

}


