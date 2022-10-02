local status, indent = pcall(require, 'indent_blankline')
if (not status) then return end

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#1e1e1e gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#3c3c3c gui=nocombine]]

indent.setup {
   show_current_context = true,
   char = '¦',
   char_blankline = '¦',
   char_highlight_list = { "IndentBlanklineIndent1" }
}
