local function open_tab_silent(node)
    local api = require("nvim-tree.api")
    api.node.open.tab(node)
    vim.cmd.tabprev()
end


return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
	config = function()
		require("nvim-tree").setup({
			filters = {
				dotfiles = false,
                custom = { "^.git$" } 
			},
			view = {
                adaptive_size = true,
			},
            on_attach = function(bufnr)
                local api = require("nvim-tree.api")

                local function opts(desc)
                    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                api.config.mappings.default_on_attach(bufnr)

                vim.keymap.set('n','<CR>', api.node.open.tab_drop, opts('Tab Drop'))
                vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.tab_drop, opts('Open'))
                vim.keymap.set('n','T', open_tab_silent, opts('Open Tab Silent'))

            end
		})
	end,
}

