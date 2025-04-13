vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Win Motion
vim.keymap.set("n", "<c-j>", "<c-w><c-j>")
vim.keymap.set("n", "<c-k>", "<c-w><c-k>")
vim.keymap.set("n", "<c-l>", "<c-w><c-l>")
vim.keymap.set("n", "<c-h>", "<c-w><c-h>")


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")
vim.keymap.set("n", "S", ":%s//g<Left><Left>")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set("n", ",sT", function()
    vim.cmd.new()
    vim.cmd.wincmd "J"
    vim.api.nvim_win_set_height(0, 12)
    vim.wo.winfixheight = true
    vim.cmd.term()
    vim.api.nvim_feedkeys('i', 'n', false)
end)

-- Open a terminal at current directory where the currently edited text resides.
vim.keymap.set("n", ",st", function()
    local dir = vim.fn.fnamemodify(vim.fn.expand('%:p'), ':h')
    vim.cmd.new()
    vim.cmd.wincmd "J"
    vim.api.nvim_win_set_height(0, 12)
    vim.wo.winfixheight = true
    vim.cmd('lcd' .. dir)
    vim.cmd.term()
    vim.api.nvim_feedkeys('i', 'n', false)
end)

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", ",k", "<cmd>cnext<CR>zz")
vim.keymap.set("n", ",j", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<leader>r", function()
    require('lualine').refresh()
end)

local statusline_disabled = false
require("profile.plugins.colorschemes")

vim.keymap.set("n", "<leader>zv", function()
    statusline_disabled = not statusline_disabled

    if statusline_disabled then
        -- === Disable statusline & color ===
        vim.cmd("colorscheme quiet")
        vim.cmd("highlight Normal guibg=black guifg=white")
        vim.opt.laststatus = 0
        package.loaded["profile.plugins.lualine"] = nil
    else
        -- === Re-enable statusline & color ===
        SetColor()
        vim.cmd("highlight Normal guibg=none")
        vim.cmd("syntax on")
        vim.opt.laststatus = 3

        -- Reload your statusline
        package.loaded["profile.plugins.lualine"] = nil
    end
end)

vim.keymap.set("n", "j", function()
    local count = vim.v.count

    if count == 0 then
        return "gj"
    else
        return "j"
    end
end, { expr = true })

vim.keymap.set("n", "k", function()
    local count = vim.v.count

    if count == 0 then
        return "gk"
    else
        return "k"
    end
end, { expr = true })
