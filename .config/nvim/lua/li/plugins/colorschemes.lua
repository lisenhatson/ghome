-- This is Primeagen's ColorMyPencils + TJ's colorschemes
--
function SetColor(color)
	color = color or "dark_flat"
	vim.cmd.colorscheme(color)
    -- Transparency
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  "folke/tokyonight.nvim",
  "sekke276/dark_flat.nvim",
  "cpea2506/one_monokai.nvim",
  "embark-theme/vim",
  "Shatur/neovim-ayu",
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
