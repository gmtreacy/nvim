-- func hack to create a toggle buffer selector


function List_buffers()
  local buffers = {}
  for buf = 1, vim.fn.bufnr('$') do
    if vim.fn.buflisted(buf) == 1 then
      local name = vim.api.nvim_buf_get_name(buf)
      local filetype = vim.api.nvim_buf_get_option(buf, "filetype")
      local modified = vim.api.nvim_buf_get_option(buf, "modified")
      -- table.insert(buffers, name .. "\t\t\t\t" .. filetype .. " [" .. buf .. "]")
      table.insert(buffers, string.format("%-5d %s %-80s", buf, (modified and "*" or " "), name))
    end
  end

  vim.cmd("belowright new")
  -- vim.cmd("vnew")
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.bo.buflisted = false
  vim.api.nvim_buf_set_lines(0, 0, -1, false, buffers)

  vim.cmd("resize 10")

  vim.api.nvim_buf_set_keymap(0, "n", "j", "<cmd>lua Move_down()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, "n", "k", "<cmd>lua Move_up()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<cmd>lua Switch_buffer()<CR>", { noremap = true, silent = true })
  vim.api.nvim_buf_set_keymap(0, "n", "<Esc>", "<cmd>close<CR>", { noremap = true, silent = true })
end

function Move_down()
  local current_line = vim.api.nvim_win_get_cursor(0)[1]
  local total_lines = vim.api.nvim_buf_line_count(0)
  if current_line == total_lines then
    vim.api.nvim_win_set_cursor(0, {1, 0})
  else
    vim.api.nvim_win_set_cursor(0, {current_line + 1, 0})
  end
end

function Move_up()
  local current_line = vim.api.nvim_win_get_cursor(0)[1]
  local total_lines = vim.api.nvim_buf_line_count(0)
  if current_line == 1 then
    vim.api.nvim_win_set_cursor(0, {total_lines, 0})
  else
    vim.api.nvim_win_set_cursor(0, {current_line - 1, 0})
  end
end

function Switch_buffer()
  local current_line = vim.api.nvim_win_get_cursor(0)[1]
  local buffer_line = vim.api.nvim_buf_get_lines(0, current_line - 1, current_line, false)[1]
  local buf_number = string.match(buffer_line, "%d+")
  vim.cmd("bdelete!")
  vim.cmd("buffer " .. buf_number)
end

vim.api.nvim_set_keymap("n", "<leader>b", ":lua List_buffers()<CR>", { noremap = true, silent = true })

