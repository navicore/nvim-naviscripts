local M = {}

M.format_rust_files = require("naviscripts.format_rust").format_rust_files

function M.setup()
	-- Register the :FormatRustFiles command
	vim.api.nvim_create_user_command("FormatRustFiles", function()
		M.format_rust_files()
	end, { desc = "Format all Rust files in the src/ directory and subdirectories" })
end

return M
