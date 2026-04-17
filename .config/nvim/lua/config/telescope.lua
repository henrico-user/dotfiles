require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader><leader>", function() builtin.find_files() end ) 
vim.keymap.set("n", "<leader>fh", function() builtin.help_tags() end ) 
