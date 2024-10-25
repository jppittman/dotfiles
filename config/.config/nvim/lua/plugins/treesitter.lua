return {
	'nvim-treesitter/nvim-treesitter',
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	config = function () 
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "go", "javascript", "html" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },  
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn", -- set to `false` to disable one of the mappings
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		})
	end
}
