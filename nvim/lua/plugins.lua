require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}
require "pears".setup()
require'colorizer'.setup()
vim.g.kommentary_create_default_mappings = false
vim.api.nvim_set_keymap("n", "<leader>//", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<leader>/", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("v", "<leader>/", "<Plug>kommentary_visual_default", {})
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", 
  highlight = {
      enable = true
  },
  autotag = {
      enable = true
  }
}
require('telescope').setup { 
  defaults = { 
    file_ignore_patterns = {"node_modules", "dist"} 
  } 
}
