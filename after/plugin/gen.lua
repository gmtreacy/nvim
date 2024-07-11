require('gen').setup({
  -- same as above
})

-- require('gen').select_model()

vim.keymap.set({ 'n', 'v' }, '<leader>]', ':Gen<CR>')
vim.keymap.set('v', '<leader>]', ':Gen Enhance_Grammar_Spelling<CR>')


