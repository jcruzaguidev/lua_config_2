local status, lualine = pcall(require, 'lualine')
if (not status) then return end

local colors = {
   bg          = '#121212',
   yellow      = '#ba8700',
   darkgreen   = '#116800',
   deepergreen = '#0b2c35';
   darkblue    = '#081633',
   green       = '#878700',
   orange      = '#fb8801',
   brown       = '#920602',
   violet      = '#6c71c4',
   blue        = '#015f89',
   lightblue   = '#89e0ff',
   red         = '#dc322f',
   gray        = '#585858',
   gray200     = '#262626',
   lightgray   = '#8a8a8a',
   white       = '#ffffff',
   pink        = '#d33682',
   turquoise   = '#042a36',
}

local custom_theme = require('lualine.themes.gruvbox')
custom_theme.normal.a.bg = colors.green
custom_theme.normal.a.fg = colors.bg
custom_theme.normal.b.bg = colors.lightgray
custom_theme.normal.b.fg = colors.bg
custom_theme.normal.c.bg = colors.turquoise
custom_theme.normal.c.fg = colors.lightgray

custom_theme.insert.a.bg = colors.red
custom_theme.insert.a.fg = colors.white
custom_theme.insert.b.bg = colors.white
custom_theme.insert.b.fg = colors.red
custom_theme.insert.c.bg = colors.turquoise
custom_theme.insert.c.fg = colors.lightgray

custom_theme.visual.a.bg = colors.orange
custom_theme.visual.a.fg = colors.brown
custom_theme.visual.b.bg = colors.lightgray
custom_theme.visual.b.fg = colors.bg
custom_theme.visual.c.bg = colors.turquoise
custom_theme.visual.c.fg = colors.lightgray

custom_theme.replace.a.bg = colors.red
custom_theme.replace.a.fg = colors.white
custom_theme.replace.b.bg = colors.lightgray
custom_theme.replace.b.fg = colors.bg
custom_theme.replace.c.bg = colors.turquoise
custom_theme.replace.c.fg = colors.lightgray

require('lualine').setup {
   options = {
      icons_enabled = true,
      theme = custom_theme,
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
         statusline = {},
         winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
         statusline = 1000,
         tabline = 1000,
         winbar = 1000,
      }
   },
   sections = {
      lualine_a = { 'mode' },
      lualine_b = { {
         'branch',
         icon = '',
      } },
      lualine_c = { 'filename', {
         'diff',
         symbols = { added = ' ', modified = '柳', removed = ' ' },
         diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.yellow },
            removed = { fg = colors.red },
         },
      }, {
         'diagnostics',
         sources = { 'nvim_diagnostic' },
         symbols = { error = ' ', warn = ' ', info = ' ' },
         diagnostics_color = {
            color_error = { fg = colors.red },
            color_warn = { fg = colors.orange },
            color_info = { fg = colors.green },
         },
      } },
      lualine_x = { {
         function()
            return '水'
         end,
      }, 'filesize', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
   },
   inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
   },
   tabline = {},
   winbar = {},
   inactive_winbar = {},
   extensions = {}
}
