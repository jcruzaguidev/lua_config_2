local status, packer = pcall(require, 'packer')
if (not status) then
   print('Packer is not installed')
   return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
   use 'wbthomason/packer.nvim'
   use {
      'svrana/neosolarized.nvim',
      requires = { 'tjdevries/colorbuddy.nvim' }
   }
   use 'kyazdani42/nvim-web-devicons' -- File icons
   use 'glepnir/lspsaga.nvim' -- LSP UIsaga
   use 'L3MON4D3/LuaSnip' -- Snippets
   use 'rafamadriz/friendly-snippets'
   use 'hoob3rt/lualine.nvim' -- Statusline
   use 'onsails/lspkind.nvim' -- vscode-like pictograms
   use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for buffer words
   use 'hrsh7th/cmp-buffer' -- nvim-cmp source for newovims build-in LSP
   use 'hrsh7th/nvim-cmp' -- Completion
   use 'saadparwaiz1/cmp_luasnip' -- Autocomplete
   use 'neovim/nvim-lspconfig' -- LSP
   use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
   }
   use({
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim" },
   })
   use 'MunifTanjim/prettier.nvim'
   use 'williamboman/mason.nvim'
   use 'williamboman/mason-lspconfig.nvim'

   use 'windwp/nvim-autopairs'
   use 'windwp/nvim-ts-autotag'

   use 'nvim-lua/plenary.nvim' -- Common utilities
   use 'nvim-telescope/telescope.nvim'
   use 'nvim-telescope/telescope-file-browser.nvim'

   use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
   use 'norcalli/nvim-colorizer.lua'

   use 'lewis6991/gitsigns.nvim'

   use 'lukas-reineke/indent-blankline.nvim' -- IndentLine
   use {
      'numToStr/Comment.nvim',
      config = function()
         require('Comment').setup()
      end
   }
end)
