return {
  'renerocksai/telekasten.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    local home = vim.fn.expand("~/lisen/znote")

    require('telekasten').setup({
      home = home,
      auto_set_filetype = true,
      dailies = home .. '/daily',
      weeklies = home .. '/weekly',
      templates = home .. '/templates',

      template_new_note = home .. '/templates/note.md',
      template_new_daily = home .. '/templates/daily.md',
      template_new_weekly = home .. '/templates/weekly.md',

      -- Optional: Set the date format you prefer
      -- new_note_filename = "title.md", -- or use "{{date}}-{{slug}}.md"
    })

    local tk = require("telekasten")

    -- Launch panel if nothing is typed after <leader>z
    vim.keymap.set("n", "<leader>z", tk.panel)

    -- Most used functions
    vim.keymap.set("n", "<leader>zf", tk.find_notes)
    vim.keymap.set("n", "<leader>zg", tk.search_notes)
    vim.keymap.set("n", "<leader>zd", tk.goto_today)
    vim.keymap.set("n", "<leader>zz", tk.follow_link)
    vim.keymap.set("n", "<leader>zn", tk.new_note)
    vim.keymap.set("n", "<leader>zc", tk.show_calendar)
    vim.keymap.set("n", "<leader>zb", tk.show_backlinks)
    vim.keymap.set("n", "<leader>zI", tk.insert_img_link)
  end,
}
