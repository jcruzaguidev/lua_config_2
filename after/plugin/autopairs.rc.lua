local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
   disable_filetype = { "TelescopePrompt", "vim" },
   fast_wrap = {
      map = '<C-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = [=[[%'%"%)%>%]%)%}%,]]=],
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'Search',
      highlight_grey = 'Comment'
   },
})
