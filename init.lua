-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " 
vim.g.maplocalleader = "\\" 
vim.wo.relativenumber = true


require("lazy").setup({
	"folke/which-key.nvim",
	{ "folke/neoconf.nvim", cmd = "Neoconf" },
	"folke/neodev.nvim",
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
		"nvim-treesitter/nvim-treesitter", 
		build = ":TSUpdate",
	},
	{"nvim-telescope/telescope-fzf-native.nvim", build="make"},
	{"Mofiqul/vscode.nvim", priority = 1000},
})
-- set keymaps
require("config.keymaps")
-- set colorscheme
require("vscode").setup()
vim.cmd.colorscheme "vscode"


