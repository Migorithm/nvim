require('lualine').setup{
  options = {
    icons_enabled=true,
    theme = 'vscode',
    --theme='gruvbox',
  },
  sections = {
    lualine_a ={
      {
        'filename',
        path=1,
      }
    }
  }
}
