return {
    "tpope/vim-commentary",
    lazy = false, -- Load immediately

    config = function()
        -- Ensure 'vim-commentary' uses block comments in '.Xdefaults'
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "xdefaults", "cpp", "c" },
            callback = function()
                vim.bo.commentstring = "/* %s */"
            end,
        })
    end
}
