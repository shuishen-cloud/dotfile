local opt = vim.opt

opt.termguicolors = true
opt.foldmethod = "indent"
opt.foldlevel = 99
opt.foldenable = false

-- 
opt.number = true
opt.relativenumber = true 
opt.cursorline = true

-- 快捷键设置
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('n', 'J', '5j')
vim.keymap.set('n', 'K', '5k')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

vim.opt.tabstop         = 4
vim.opt.shiftwidth      = 4

vim.g.barbar_auto_setup = false

vim.opt.guicursor       = {
	"i:ver25",
	"a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
}

require("lazy").setup("plugins")

vim.cmd('colorscheme desert')
