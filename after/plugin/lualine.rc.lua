local status, lualine = pcall(require, 'lualine')
if (not status) then return end


local colors = {
   grey        = '#a0a1a7',
   black       = '#383a42',
   white       = '#f3f3f3',
   light_green = '#83a598',
   bg          = '#202328',
   fg          = '#bbc2cf',
   yellow      = '#f8df11',
   cyan        = '#008080',
   darkblue    = '#081633',
   green       = '#98c379',
   orange      = '#f6955b',
   violet      = '#a9a1e1',
   magenta     = '#a485dd',
   blue        = '#648ce1',
   red         = '#ee6d85',
   green_bg    = '#b0e000',
   green_fg    = '#0f6400',
   white_bg    = '#ffffff',
   white_fg    = '#136c6c',
   orange_bg   = '#fb8801',
   orange_fg   = '#8c0503',
   red_bg      = '#f43d5c',
   red_fg      = '#ffffff',
   gray        = '#171d1c',
   gray_light  = '#79898b',
}

local theme = {
   normal = {
      a = { fg = colors.green_fg, bg = colors.green_bg },
      b = { fg = colors.gray_light, bg = colors.gray },
      c = { fg = colors.black, bg = colors.gray },
      z = { fg = colors.white, bg = colors.gray },
   },
   insert = { a = { fg = colors.red_fg, bg = colors.red_bg } },
   visual = { a = { fg = colors.orange_fg, bg = colors.orange_bg } },
   replace = { a = { fg = colors.black, bg = colors.green } },
}

require('lualine').setup {
   options = {
      theme = theme,
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
   },
   sections = {
      lualine_a = { 'mode' },
      lualine_b = {
         {
            'filename',
            color = { bg = colors.gray },
         },
         {
            'branch',
            color = { bg = colors.gray },
         },
         {
            'diagnostics',
            source = { 'nvim' },
            sections = { 'error' },
            diagnostics_color = { error = { bg = colors.red_bg, fg = colors.red_fg } },
         },
         {
            'diagnostics',
            source = { 'nvim' },
            sections = { 'warn' },
            diagnostics_color = { warn = { bg = colors.orange_bg, fg = colors.orange_fg } },
         },
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {
         {
            'filetype',
            color = { bg = colors.gray },
         },
         {
            'progress',
            color = { bg = colors.gray_light, fg = colors.white },
         },
      },
      lualine_z = { 'location' },
   },
   inactive_sections = {
      lualine_a = { 'filename' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
   },
   tabline = {},
   extensions = {},


   --[[ options = {
      theme = theme,
      component_separators = '',
      section_separators = { left = '', right = '' },
   },
   sections = process_sections {
      lualine_a = { 'mode' },
      lualine_b = {
         'branch',
         'diff',
         {
            'diagnostics',
            source = { 'nvim' },
            sections = { 'error' },
            diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
         },
         {
            'diagnostics',
            source = { 'nvim' },
            sections = { 'warn' },
            diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
         },
         { 'filename', file_status = false, path = 1 },
         { modified, color = { bg = colors.red } },
         {
            '%w',
            cond = function()
               return vim.wo.previewwindow
            end,
         },
         {
            '%r',
            cond = function()
               return vim.bo.readonly
            end,
         },
         {
            '%q',
            cond = function()
               return vim.bo.buftype == 'quickfix'
            end,
         },
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { search_result, 'filetype' },
      lualine_z = { '%l:%c', '%p%%/%L' },
   },
   inactive_sections = {
      lualine_c = { '%f %y %m' },
      lualine_x = {},
   }, ]]
}

--[[ require('lualine').setup {
   options = {
      icons_enabled = true,
      theme = 'iceberg_dark',
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
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
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
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
} ]]
