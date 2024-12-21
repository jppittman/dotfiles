return {
	'luukvbaal/nnn.nvim',
	config = function()
		require('nnn').setup({
			replace_netrw = "picker",
			auto_close = true,
		})
	end
}
