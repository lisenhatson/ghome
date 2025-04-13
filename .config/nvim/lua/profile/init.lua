require("profile.set")
require("profile.remap")
require("profile.lazy")
require("profile.plugins.colorschemes")

local augroup = vim.api.nvim_create_augroup
local profileGroup = augroup('LisenHatson', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.cmd.filetype("plugin on")

vim.schedule(function()
    vim.opt.clipboard = "unnamedplus"
end)

vim.filetype.add({
    extension = {
        templ = 'templ',
    }
})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = profileGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd({ "BufRead", "BufNewFile" }, {
    group = profileGroup,
    pattern = { "Xresources", "Xdefaults", "xresources", "xdefaults" },
    command = "set filetype=xdefaults"
})

autocmd({ "BufWritePost" }, {
    group = profileGroup,
    pattern = { "Xresources", "Xdefaults", "xresources", "xdefaults" },
    command = "!xrdb %"
})

-- autocmd('BufEnter', {
--     group = profileGroup,
--     callback = function()
--             SetColor()
--         end
-- })

vim.schedule(function()
    SetColor()
end)


autocmd('LspAttach', {
    group = profileGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

-- Transparency
autocmd('ColorScheme', {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
})

-- Set local settings for terminal buffers
autocmd('TermOpen', {
    group = profileGroup,
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.scrolloff = 0

        vim.bo.filetype = "terminal"
    end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
