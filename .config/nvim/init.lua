vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.g.mapleader = " "

vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind

		if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
			vim.system({ "make" }, { cwd = ev.data.path }):wait()
		end
	end
})

vim.pack.add({
	{ src = "https://github.com/nvchad/ui" },
	{ src = "https://github.com/nvchad/base46" },
	{ src = "https://github.com/nvim-tree/nvim-tree.lua" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim",            version = vim.version.range("*") },
	{ src = "https://github.com/saghen/blink.cmp.git",                     version = vim.version.range("1.*") },

	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvchad/volt" },
})

require("config.nvchad")
require("config.nvim-tree")
require("config.telescope")

vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.diagnostic.config({ virtual_text = true })

do
local data = require("nvchad.blink.config")
data.snippets = nil
data.completion.documentation.auto_show_delay_ms = 1000
require("blink.cmp").setup(data)
end

require("nvim-autopairs").setup()
