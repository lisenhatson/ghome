function SetColor(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)

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
        -- Enable original Monokai colors
        monokai_original  = false,
        -- Highlight only LineNr (current line number) for cursorline
        -- option. This also enables cursorline (:set cursorline)
        only_CursorLineNr = true,
        -- Highlight LineNr for relativenumbers. This also enables
        -- relativenumbers option (:set relativenumbers)
        -- Highlight unfocused windows when using :split or :vsplit
        hi_unfocus_window = false,
        -- Highlight formatted @text (e.g., italic, strong) in yellow
        -- in addition to font attributes to make the text more visible
        hi_formatted_text = true,
        -- Highlight comment in italics
        hi_comment_italic = true
            }
        })
        end
  },
  {
    "maxmx03/fluoromachine.nvim",
    config = function()
      local fm = require "fluoromachine"
      fm.setup { glow = true, theme = "fluoromachine" }
    end,
  },

}
