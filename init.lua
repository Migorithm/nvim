require("core.keymaps")


local function load_plugins()
  local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  vim.notify("check lazy path exist")
  if not vim.loop.fs_stat(lazy_path) then
    vim.notify("downloading `lazy.nvim`...")
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazy_path,
    })
  end

  vim.opt.runtimepath:prepend({ lazy_path })

  require("lazy").setup("core.plugins", {
    root = vim.fn.stdpath("data") .. "/lazy",
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",
    ui = {
      border = "single",
    },
  })
end


load_plugins()



--vim.api.nvim_create_augroup("AutoFormat",{})

--vim.api.nvim_create_autocmd(
--    "BufWritePost",
--    {
--      pattern ="*.rs",
--      group = "AutoFormat",
--      callback = function()
--        vim.cmd("silent !cargo fmt -q --all")
--      end
--    }
--)
