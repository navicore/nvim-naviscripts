local M = {}

function M.format_rust_files()
	local uv = vim.loop
	local rust_files = {}

	-- Recursively find all src directories and collect .rs files
	local function find_rust_files(dir)
		local handle = uv.fs_scandir(dir)
		if not handle then
			return
		end
		while true do
			local name = uv.fs_scandir_next(handle)
			if not name then
				break
			end
			local full_path = dir .. "/" .. name
			local stat = uv.fs_stat(full_path)
			if stat then
				if stat.type == "directory" then
					if name == "target" then
						-- skip target directories
					else
						find_rust_files(full_path)
					end
				elseif stat.type == "file" and name:match("%.rs$") then
					table.insert(rust_files, full_path)
				end
			end
		end
	end

	find_rust_files(".")

	-- Format each Rust file using rustfmt
	for _, file in ipairs(rust_files) do
		vim.fn.jobstart({ "rustfmt", file }, {
			on_stderr = function(_, data)
				if data then
					vim.notify("rustfmt error: " .. table.concat(data, "\n"), vim.log.levels.ERROR)
				end
			end,
		})
	end

	vim.notify("Formatting " .. tostring(#rust_files) .. " Rust files...", vim.log.levels.INFO)
end

return M
