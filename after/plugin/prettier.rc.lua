local status, prettier = pcall(require, 'prettier')
if (not status) then return end

prettier.setup({
   bin = 'prettier',
   filetypes = {
      "php",
      "css",
      "graphql",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "less",
      "markdown",
      "scss",
      "typescript",
      "typescriptreact",
      "yaml",
      "vue"
   },
   arrow_parens = "always",
   bracket_same_line = false,
   bracket_spacing = true,
   embedded_language_formatting = "auto",
   end_of_line = "lf",
   html_whitespace_sensitivity = "css",
   jsx_single_quote = false,
   print_width = 80,
   prose_wrap = "preserve",
   quote_props = "as-needed",
   semi = true,
   single_attribute_per_line = false,
   single_quote = false,
   tab_width = 3,
   trailing_comma = "es5",
   use_tabs = false,
   vue_indent_script_and_style = false,
})
