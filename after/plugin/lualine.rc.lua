local status, lualine = pcall(require, 'lualine')
if (not status) then return end


--[[ local colors = {
   bg        = '#202328',
   yellow    = '#ba8700',
   darkgreen = '#042a36',
   darkblue  = '#081633',
   green     = '#859900',
   orange    = '#fb8801',
   violet    = '#6c71c4',
   blue      = '#268bd2',
   red       = '#dc322f',
   gray      = '#596164',
   lightgray = '#93a1a1',
}


local mode_color_detail = {
   n = colors.green,
   i = colors.red,
   V = colors.yellow,
}

local mode_text = {
   mode1 = 'NORMAL',
   mode2 = 'INSERT',
   mode3 = 'VISUAL',
}

local conditions = {
   buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
   end,
   hide_in_width = function()
      return vim.fn.winwidth(0) > 80
   end,
   check_git_workspace = function()
      local filepath = vim.fn.expand('%:p:h')
      local gitdir = vim.fn.finddir('.git', filepath .. ';')
      return gitdir and #gitdir > 0 and #gitdir < #filepath
   end,
}

local config = {
   options = {
      component_separators = '',
      section_separators = '',
      theme = {
         normal = { c = { fg = colors.fg, bg = colors.bg } },
         inactive = { c = { fg = colors.fg, bg = colors.bg } },
      },
   },
   sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
   },
   inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
   },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
   table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
   table.insert(config.sections.lualine_x, component)
end

ins_left {
   function()
      return '▊'
   end,
   color = function()
      return { fg = mode_color_detail[vim.fn.mode()] }
   end,
   padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
   function()
      local mode_symbol = {
         n = mode_text.mode1,
         i = mode_text.mode2,
         V = mode_text.mode3,
      }
      return mode_symbol[vim.fn.mode()]
   end,
   color = function()
      local mode_color_bg = {
         n = colors.green,
         i = colors.red,
         v = colors.yellow,
         [''] = colors.blue,
         V = colors.yellow,
         c = colors.violet,
         no = colors.red,
         s = colors.orange,
         S = colors.orange,
         [''] = colors.orange,
         ic = colors.yellow,
         R = colors.red_bg,
         Rv = colors.violet,
         cv = colors.red,
         ce = colors.red,
         r = colors.cyan,
         rm = colors.cyan,
         ['r?'] = colors.cyan,
         ['!'] = colors.red,
         t = colors.red,
      }
      return { fg = mode_color_bg[vim.fn.mode()] }
   end,
   -- padding = { right = 2, left = 2 },
}

ins_left {
   -- filesize component
   'filesize',
   cond = conditions.buffer_not_empty,
   color = { fg = colors.gray },
}

ins_left {
   'filename',
   cond = conditions.buffer_not_empty,
   color = { fg = colors.blue },
}
ins_left {
   'diagnostics',
   sources = { 'nvim_diagnostic' },
   symbols = { error = ' ', warn = ' ', info = ' ' },
   diagnostics_color = {
      color_error = { fg = colors.red },
      color_warn = { fg = colors.orange },
      color_info = { fg = colors.green },
   },
}
ins_left {
   function()
      return '%='
   end,
}
ins_left {
   function()
      return '最高'
   end,
   color = function()
      return { fg = mode_color_detail[vim.fn.mode()] }
   end,
}

ins_right { 'location', color = { fg = colors.gray } }
ins_right { 'progress', color = { fg = colors.gray } }
ins_right {
   'branch',
   icon = '',
   color = { fg = colors.blue },
}
ins_right {
   'diff',
   symbols = { added = ' ', modified = '柳', removed = ' ' },
   diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.yellow },
      removed = { fg = colors.red },
   },
   cond = conditions.hide_in_width,
}
ins_right {
   function()
      return '▊'
   end,
   color = function()
      return { fg = mode_color_detail[vim.fn.mode()] }
   end,
   padding = { left = 1 },
}

lualine.setup(config) ]]


local colors = {
   bg        = '#202328',
   yellow    = '#ba8700',
   darkgreen = '#042a36',
   darkblue  = '#081633',
   green     = '#859900',
   orange    = '#fb8801',
   violet    = '#6c71c4',
   blue      = '#268bd2',
   red       = '#dc322f',
   gray      = '#596164',
   lightgray = '#93a1a1',
}

local custom_theme = require('lualine.themes.solarized_dark')
custom_theme.normal.a.bg = colors.yellow
custom_theme.normal.b.bg = colors.bg
custom_theme.normal.b.fg = colors.lightgray
custom_theme.normal.c.bg = colors.bg
custom_theme.normal.c.fg = colors.lightgray

custom_theme.insert.a.bg = colors.red
custom_theme.insert.a.fg = colors.bg
custom_theme.visual.a.bg = colors.green
custom_theme.visual.a.fg = colors.bg


require('lualine').setup {
   options = { theme = custom_theme },
}
