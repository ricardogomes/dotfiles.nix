
-- Buffer Navigation
local default_opts = {
	noremap = true,
	silent = true,
}

vim.keymap.set("n","<leader>bn", ":bnext<CR>", default_opts)

vim.keymap.set("n","<leader>m", ":NvimTreeFocus<CR>", default_opts)
vim.keymap.set("n","<leader>e", ":NvimTreeToggle<CR>", default_opts)
