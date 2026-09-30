-- lua/lsp/servers/graphql.lua
return {
	filetypes = { "graphql", "typescriptreact", "javascriptreact", "typescript", "javascript" },
	root_markers = { ".graphqlrc", ".graphqlrc.json", ".graphqlrc.yaml", "graphql.config.js", "package.json" },
}
