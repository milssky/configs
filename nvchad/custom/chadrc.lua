---@type ChadrcConfig 
 local M = {}
 M.ui = {theme = 'palenight'}
 M.plugins = "custom.plugins"
  vim.cmd([[
  set shell=pwsh
  set shellcmdflag=-command
  set shellquote=\"
  set shellxquote=
  ]])
 return M
