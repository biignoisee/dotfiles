local inlay_hints = {
	includeInlayParameterNameHints = "all",
	includeInlayParameterNameHintsWhenArgumentMatchesName = false,
	includeInlayFunctionParameterTypeHints = true,
	includeInlayVariableTypeHints = true,
	includeInlayPropertyDeclarationTypeHints = true,
	includeInlayFunctionLikeReturnTypeHints = true,
	includeInlayEnumMemberValueHints = true,
}

return {
	filetypes = {
		"typescript",
		"typescriptreact",
		"javascript",
		"javascriptreact",
	},
	settings = {
		typescript = { inlayHints = inlay_hints },
		javascript = { inlayHints = inlay_hints },
		vtsls = {
			-- usa el TS del proyecto (node_modules) en vez del global
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = {
					enableServerSideFuzzyMatch = true,
				},
			},
		},
	},
	-- igual que con ts_ls: el formateo lo maneja efm + prettier_d/eslint_d
	on_attach = function(client, _bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
}
