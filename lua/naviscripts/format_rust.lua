local M = {}

function M.format_rust_files()
	local uv = vim.loop
	local src_dir = "src/"

	local function format_file(file_path)
		vim.cmd("edit " .. file_path)
		vim.cmd("write")
	end

	local function scan_dir(dir)
		local handle = uv.fs_scandir(dir)
		if not handle then
			return
		end

		while true do
			local name, type = uv.fs_scandir_next(handle)
			if not name then
				break
			end

			local full_path = dir .. "/" .. name
			if type == "directory" then
				scan_dir(full_path)
			elseif type == "file" and name:match("%.rs$") then
				format_file(full_path)
			end
		end
	end

	scan_dir(src_dir)
end

return M
