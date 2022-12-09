local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

require('packer').init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use "nvim-lua/plenary.nvim"
    use 'nvim-lua/popup.nvim'

    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'Mofiqul/dracula.nvim'	
    use 'ellisonleao/gruvbox.nvim'
    use 'nvim-lualine/lualine.nvim' 
    use 'akinsho/bufferline.nvim'
    use 'moll/vim-bbye'
    use 'numToStr/Comment.nvim'
    use 'akinsho/toggleterm.nvim'
    use "lukas-reineke/indent-blankline.nvim"
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use "windwp/nvim-ts-autotag" 
    use "p00f/nvim-ts-rainbow" 
    use "windwp/nvim-autopairs"

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'rafamadriz/friendly-snippets'

    --lsp
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'RRethy/vim-illuminate'
    -- use 'williamboman/nvim-lsp-installer' 
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'glepnir/lspsaga.nvim'
    
    use 'lewis6991/impatient.nvim'
    use 'folke/tokyonight.nvim'

    use 'nvim-telescope/telescope.nvim'
    use 'lewis6991/gitsigns.nvim'
    use "norcalli/nvim-colorizer.lua"
    use 'rcarriga/nvim-notify'
    use 'folke/trouble.nvim'
    use 'folke/twilight.nvim'
    use 'folke/zen-mode.nvim'
    use 'folke/which-key.nvim'
    
    -- use 'kdheepak/lazygit.nvim'
    
    use 'mfussenegger/nvim-dap'
    use 'rcarriga/nvim-dap-ui'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'ravenxrz/DAPInstall.nvim'
    use 'mfussenegger/nvim-dap-python'
    use 'leoluz/nvim-dap-go'
    use 'nvim-telescope/telescope-dap.nvim'

    use 'ahmedkhalf/project.nvim'

    use 'ggandor/lightspeed.nvim'
    use 'simrat39/symbols-outline.nvim'
    use 'karb94/neoscroll.nvim'
    use 'goolord/alpha-nvim'

    use 'axieax/urlview.nvim'
    use 'j-hui/fidget.nvim'
    use 'm-demare/hlargs.nvim'

    use 'ThePrimeagen/refactoring.nvim'

    
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua'

    use 'JoosepAlviste/nvim-ts-context-commentstring'     

    use 'rose-pine/neovim'
    use 'simrat39/rust-tools.nvim'

    use 'xiyaowong/nvim-transparent'

    use 'nvim-orgmode/orgmode'
   if packer_bootstrap then
    require('packer').sync()
  end
end)

