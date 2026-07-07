local license_path = vim.fn.expand("~/.config/intelephense/license.txt")

local license = ""
if vim.fn.filereadable(license_path) == 1 then
	license = table.concat(vim.fn.readfile(license_path), "\n")
end

return {
	cmd = { "intelephense", "--stdio" },

	filetypes = {
		"php",
	},

	root_markers = {
		"composer.json",
		".git",
	},

	init_options = {
		licenceKey = license,
	},

	settings = {
		intelephense = {
			files = {
				maxSize = 5000000,
			},
		},
	},
}
