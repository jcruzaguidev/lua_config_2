local status, null_ls = pcall(require, "null-ls")
if (not status) then return end


require("null-ls").setup({
   sources = {
      require("null-ls").builtins.formatting.prettier.with({
         filetypes = { "css", "html", "javascript", "json", "yaml" },
      }),
   },
})
