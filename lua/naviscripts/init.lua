local M = {}

M.format_rust_files = require("naviscripts.format_rust").format_rust_files

-- Register the :FormatRustFiles command
vim.api.nvim_create_user_command("FormatRustFiles", function()
	M.format_rust_files()
end, { desc = "Format all Rust files in the src/ directory and subdirectories" })

function M.setup(user_config) end

return M
