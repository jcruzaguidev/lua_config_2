local status, lualine = pcall(require, 'lualine')
if (not status) then return end


local colors = {
   bg        = '#202328',
   fg        = '#bbc2cf',
   yellow    = '#f8df11',
   cyan      = '#008080',
   darkblue  = '#081633',
   green     = '#b0e000',
   orange    = '#fb8801',
   violet    = '#a9a1e1',
   magenta   = '#ae81ff',
   blue      = '#648ce1',
   red       = '#f43d5c',
   green_bg  = '#b0e000',
   green_fg  = '#0f6400',
   white_bg  = '#ffffff',
   white_fg  = '#136c6c',
   orange_bg = '#fb8801',
   orange_fg = '#8c0503',
   red_bg    = '#f43d5c',
   red_fg    = '#ffffff',
   gray      = '#44515d',
}


local mode_color_detail = {
   n = colors.green,
   i = colors.red,
   V = colors.orange,
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
         v = colors.orange,
         V = colors.orange,
         c = colors.magenta,
         no = colors.red,
         s = colors.orange,
         S = colors.orange,
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
   'filename',
   cond = conditions.buffer_not_empty,
   color = { fg = colors.magenta },
}
ins_left {
   'diagnostics',
   sources = { 'nvim_diagnostic' },
   symbols = { error = ' ', warn = ' ', info = ' ' },
   diagnostics_color = {
      color_error = { fg = colors.red },
      color_warn = { fg = colors.orange },
      color_info = { fg = colors.cyan },
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
      modified = { fg = colors.orange },
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

lualine.setup(config)
