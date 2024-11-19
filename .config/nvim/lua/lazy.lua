-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- lsp
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    },

    -- autopairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    { "windwp/nvim-ts-autotag" },

    -- workspace diagnostics
    {
        'rcarriga/nvim-notify'
    },

    -- git
    { 'lewis6991/gitsigns.nvim' },
    { 'tpope/vim-fugitive' },

    -- theme
    { "EdenEast/nightfox.nvim" },
    { "nvim-tree/nvim-tree.lua" }, -- filetree on the side
    { "nvim-tree/nvim-web-devicons" }
}

return require("lazy").setup(plugins)
