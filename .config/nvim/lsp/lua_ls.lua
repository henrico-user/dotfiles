return {
	cmd = { 'lua-language-server' },

	filetypes = { 'lua' },

	root_dir = function(bufnr, on_dir)
		local config_path = vim.fn.stdpath("config")
		local name = vim.api.nvim_buf_get_name(bufnr)

		if (vim.startswith(name, config_path)) then
			on_dir(config_path)
		end
	end,

	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			},
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					'${3rd}/luv/library',
					'${3rd}/busted/library',
				},
			},
			runtime = {
				version = 'LuaJIT',
			},
		}
	}
}
