return {
	cmd = { "phpantom_lsp" },
	filetypes = { "php" },
	root_markers = {
		"composer.json",
		".git",
	},
	-- No requiere init_options especiales: lee composer.json solo
	-- y .phpantom.toml si existe en la raíz del proyecto
}
