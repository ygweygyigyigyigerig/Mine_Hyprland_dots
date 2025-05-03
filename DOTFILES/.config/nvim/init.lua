-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("highlight Normal guibg=NONE")
vim.cmd("highlight NonText guibg=NONE")
vim.cmd("highlight NormalNC guibg=NONE")
vim.cmd("highlight VertSplit guibg=NONE")
vim.cmd("highlight Pmenu guibg=NONE")
vim.cmd("set number")
vim.cmd("set norelativenumber") -- Disable relative line numbers
vim.cmd("highlight PmenuSel guibg=NONE")
