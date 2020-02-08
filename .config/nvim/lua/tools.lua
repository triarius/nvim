local api = vim.api
local M = {}

-- Creates a scratch buffer
function M.makeScratch()
  api.nvim_command [[enew]]
  vim.bo[0].buftype='nofile'
  vim.bo[0].bufhidden='hide'
  vim.bo[0].swapfile=false
  api.nvim_buf_set_keymap(0, 'n', 'q', ':bd<CR>', {noremap = true, silent = true})
end

return M
