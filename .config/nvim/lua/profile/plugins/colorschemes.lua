-- This is Primeagen's ColorMyPencils + TJ's colorschemes
--
function SetColor(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)
    -- Transparency
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
    vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
    vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "cyan" })
end

return {
  "folke/tokyonight.nvim",
  "sekke276/dark_flat.nvim",
  "cpea2506/one_monokai.nvim",
  "embark-theme/vim",
  "Shatur/neovim-ayu",
  "ellisonleao/gruvbox.nvim",
  "https://gitlab.com/bartekjaszczak/finale-nvim",
  { "rose-pine/neovim", name = "rose-pine" },
  { "catppuccin/nvim", name = "catppuccin" },
  {
        "judaew/ronny.nvim",
        config = function()
        require("ronny").setup({
        display = {
        monokai_original  = false,
            }
        })
        end
  },
  {
    "maxmx03/fluoromachine.nvim",
    -- config = function()
    --   local fm = require "fluoromachine"
    --   fm.setup { glow = true, theme = "fluoromachine" }
    -- end,
  },

}
