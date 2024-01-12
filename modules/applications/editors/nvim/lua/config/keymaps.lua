
-- Buffer Navigation
local default_opts = {
	noremap = true,
	silent = true,
}

-- Navigation
vim.keymap.set("n","<leader>bn", ":bnext<CR>", default_opts)
vim.keymap.set("n","<C-h>","<C-w>h",default_opts)
vim.keymap.set("n","<C-j>","<C-w>j",default_opts)
vim.keymap.set("n","<C-k>","<C-w>k",default_opts)
vim.keymap.set("n","<C-l>","<C-w>l",default_opts)

-- Plugins
--- Nvim-tree
vim.keymap.set("n","<leader>m", ":NvimTreeFocus<CR>", default_opts)
vim.keymap.set("n","<leader>e", ":NvimTreeToggle<CR>", default_opts)
