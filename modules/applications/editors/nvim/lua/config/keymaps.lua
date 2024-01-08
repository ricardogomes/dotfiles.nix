
-- Buffer Navigation
local default_opts = {
	noremap = true,
	silent = true,
}

vim.keymap.set("n","<leader>bn", "bnext")

vim.keymap.set("n","<leader>m", "NvimTreeFocus")
vim.keymap.set("n","<leader>e", "NvimTreeToggle")
