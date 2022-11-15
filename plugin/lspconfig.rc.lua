local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local on_attach = function(client, bufnr)
   -- format on save
   if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
         group = vim.api.nvim_create_augroup("Format", { clear = true }),
         buffer = bufnr,
         callback = function() vim.lsp.buf.formatting_seq_sync() end
      })
   end
end

nvim_lsp.tailwindcss.setup {}

-- TypeScript
nvim_lsp.tsserver.setup {
   on_attach = on_attach,
   filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
   cmd = { "typescript-language-server", "--stdio" }
}

nvim_lsp.sumneko_lua.setup {
   on_attach = on_attach,
   settings = {
      Lua = {
         diagnostics = {
            -- Get the languageserver to reconiza the 'vim' global
            globals = { 'vim' }
         },
         workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false
         }
      }
   }
}
