local keymap = vim.keymap
local opts = { silent = true }

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- Increment-decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Delete a word backwards
keymap.set('n', '-w', 'vb"_di')

-- Personal
keymap.set('n', 'J', '5j');
keymap.set('n', 'K', '5k');
keymap.set('v', 'J', '5j');
keymap.set('v', 'K', '5k');
keymap.set('n', 'L', 'g_');
keymap.set('n', 'H', '^');
keymap.set('n', '<leader><esc>', ':noh<CR>');
keymap.set('n', '<C-c>', 'ciw');
keymap.set('v', 'p', '"_dP'); -- Paste over currently selected text without yanking it
keymap.set("x", "<C-j>", ":move '>+1<CR>gv-gv") -- move select line(s) back
keymap.set("x", "<C-k>", ":move '<-2<CR>gv-gv") -- move select line(s) down
keymap.set("n", "cb", ":bdelete<CR>") -- Close current buffer
keymap.set('n', '<leader>s', ':so %<CR>', { noremap = true }); -- Reload lua

-- disable recording macros
keymap.set('n', 'q', '<Nop>')
keymap.set('n', 'Q', '<Nop>')

-- center search results
keymap.set('n', 'n', 'nzz')
keymap.set('n', 'N', 'Nzz', opts)
