require("george")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set tab settings for Makefiles
vim.api.nvim_create_autocmd("FileType", {
    pattern = "make",
    callback = function()
        vim.bo.expandtab = false
        vim.bo.shiftwidth = 8
        vim.bo.softtabstop = 0
    end,
})


