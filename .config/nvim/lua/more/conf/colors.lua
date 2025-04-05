_G.ColorMyPencils = function(color)
	color = color or "starry"
	vim.cmd.colorscheme(color)
	-- Apply transparency to any colorscheme
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- Create an autocmd to apply transparency whenever colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        -- Apply transparency to both Normal and NormalFloat
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

        -- Additional highlight groups that often need transparency
        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
        vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
        vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
        vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
        vim.api.nvim_set_hl(0, "SpecialKey", { bg = "none" })
        vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    end
})

return {
    {
        'ray-x/starry.nvim',
        priority = 1000, -- Ensures it loads early
        config = function()
            require("starry").setup({
                disable = {
                    background = true,
                },
                style = {
                    name = 'mariana', -- moonlight, earliestsummer, dracula, oceanic, dracula_blood, deep ocean, darker, palenight, monokai, mariana, emerald, middlenight_blue
                    darker_contrast = true,
                },
            })
            ColorMyPencils()
        end
    },

    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = {
            style = "storm",
            transparent = true,
            styles = {
                comments = { italic = false },
                keywords = { italic = false },
            },
        },
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = true,
        opts = {
            disable_background = true,
            styles = { italic = false },
        },
    },

    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        lazy = true,
        opts = {
            transparent_mode = true,
            italic = false,
        },
    },

    { "erikbackman/brightburn.vim", lazy = true },
    {
        "EdenEast/nightfox.nvim",
        lazy = true,
        opts = { transparent = true }
    },
}
