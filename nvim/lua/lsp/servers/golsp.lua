-- lua/lsp/servers/gopls.lua

return {
	cmd = { "gopls" },

	filetypes = {
		"go",
		"gomod",
		"gowork",
		"gotmpl",
	},

	root_markers = {
		"go.work",
		"go.mod",
		".git",
	},

	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				unusedwrite = true,
				useany = true,
				shadow = true,
			},

			staticcheck = true,

			completeUnimported = true,

			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},

			gofumpt = true,

			directoryFilters = {
				"-vendor",
				"-node_modules",
			},

			semanticTokens = true,
		},
	},
}
