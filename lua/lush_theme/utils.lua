local M = {}

-- Simple string interpolation.
--
-- Example template: "${name} is ${value}"
--
---@param str string template string
---@param table table key value pairs to replace in the string
function M.template(str, table)
	return (
		str:gsub("($%b{})", function(w)
			return vim.tbl_get(table, unpack(vim.split(w:sub(3, -2), ".", { plain = true }))) or w
		end)
	)
end

return M
