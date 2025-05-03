local M = {}

M.format_rust_files = require("naviscripts.format_rust").format_rust_files

function M.setup()
	-- Register the :FormatRustFiles command
	vim.api.nvim_create_user_command("FormatRustFiles", function()
		M.format_rust_files()
	end, { desc = "Format all Rust files in the src/ directory and subdirectories" })

	-- Load the help file
	local plugin_dir = vim.fn.stdpath("data") .. "/lazy/nvim-naviscripts"
	local doc_dir = plugin_dir .. "/doc"
	vim.cmd("helptags " .. doc_dir)
end

return M
