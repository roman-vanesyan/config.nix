return {
	-- Better syntax highlighting
	{
		"nvim-treesitter/nvim-treesitter",

		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "templ" })
		end,
	},

	{
		"neovim/nvim-lspconfig",

		-- @param opts lspconfig.options
		opts = {
			servers = {
				templ = {},
			},
		},
	},
}
