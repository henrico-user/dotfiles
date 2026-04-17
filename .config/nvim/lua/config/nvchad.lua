vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

require("nvchad")
require("base46").load_all_highlights()

for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
	dofile(vim.g.base46_cache .. v)
end

local function testf()
	local bufnr = vim.fn.bufadd("/home/henri/.config/ghostty/config.ghostty")
	vim.fn.bufload(bufnr)
	local last = vim.api.nvim_buf_get_lines(bufnr, -2, -1, true)[1]

	if last ~= nil and not vim.startswith(last, "background = ") then
		vim.api.nvim_buf_set_lines(bufnr, -1, -1, true, { "" })
	end

	local color = vim.api.nvim_get_hl(0, { name = "Normal" })
	vim.api.nvim_buf_set_lines(bufnr, -2, -1, true, { "background = " .. string.format("#%06x", color.bg) })

	vim.api.nvim_buf_call(bufnr, function()
		vim.cmd("write")
	end)
	vim.api.nvim_buf_delete(bufnr, {})
end

vim.keymap.set("n", "<leader>th", function() require("nvchad.themes").open() end)
vim.keymap.set("n", "<leader>sth", function() testf() end)
