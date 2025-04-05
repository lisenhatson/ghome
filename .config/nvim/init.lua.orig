-- Lisen Hatson's vimrc

-- Section 1A: Generals
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

-- numbers for lines
vim.opt.number = true
vim.opt.termguicolors = true

-- mouse mode
vim.opt.mouse = "a"
vim.opt.showmode = false

-- sync clipboard between nvim and system
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Section 1B: Niches
vim.opt.breakindent = true
vim.opt.undofile = true

-- specify with '\' like '\C' for uppercase
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

-- display whitespace chars
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"

-- Show which line I'm on
vim.opt.cursorline = true
vim.opt.scrolloff = 10

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Exit terminal mode easily with double esc or the other one
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Simplify window navigation keys
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.keymap.set("n", "<leader>S", ":%s//g<left><left>", { desc = "Replace all" })

-- Clear LaTeX
vim.api.nvim_create_autocmd({ "ExitPre", "QuitPre", "VimLeave", "WinClosed" }, {
	pattern = { "*.tex" },
	command = "!texclear %",
})

vim.keymap.set("n", "<leader>t", "<C-w><C-n>z9<CR>:terminal<CR>i", { desc = "Launch terminal underneath" })

-- Section 1C: Appearance
vim.cmd.colorscheme("retrobox")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
