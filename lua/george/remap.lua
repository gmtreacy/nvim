vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>d", vim.cmd.bd)
vim.keymap.set("n", "<leader>w", "<C-w>w")
vim.keymap.set("n", "<leader>t", ":tabnext<CR>")

vim.keymap.set("n", "<leader>z", ":tab split<CR>")
vim.keymap.set("n", "<leader>zz", ":tabclose<CR>")

-- vim.api.nvim_set_keymap("n", "<leader>i", ":%! goimports<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>i", ":%! goimports<CR>")


-- vim.keymap.set("n", "<leader>b", vim.cmd.ls)

-- vim.keymap.set("n", "<leader>ff", require("fzf-lua").files, { desc = "Fzf Files" })
-- vim.keymap.set("n", "<leader>fb", require("fzf-lua").buffers, { desc = "Fzf Buffers" })
-- vim.keymap.set("n", "<leader>fg", require("fzf-lua").grep, { desc = "Fzf Grep" })
-- vim.keymap.set("n", "<leader>fm", require("fzf-lua").builtin, { desc = "Fzf Menu Builtin" })

vim.keymap.set('n', '<leader>n', ':set number!<CR>')

