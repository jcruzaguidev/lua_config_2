local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
   server_filetype_map = {
      typescript = 'typescript',
      javascript = 'javascript'
   },
   code_action_keys = {
      quit = "<esc>",
      exec = "<CR>",
   },
   finder_icons = {
      def = '  ',
      ref = '諭 ',
      link = '  ',
   },
   diagnostic_header = { " ", " ", " ", "ﴞ " },
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', 'D', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)

-- CODE ACTION
local action = require("lspsaga.codeaction")

-- code action
vim.keymap.set("n", "<leader>do", action.code_action, { silent = true })
vim.keymap.set("v", "<leader>do", function()
   vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
   action.range_code_action()
end, { silent = true })
-- or use command
vim.keymap.set("n", "<leader>do", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("v", "<leader>do", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true })

-- Jump and show diagnostics
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })
