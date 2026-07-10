do
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local eslint_d = require("efmls-configs.linters.eslint_d")
	local fixjson = require("efmls-configs.formatters.fixjson")
	local hadolint = require("efmls-configs.linters.hadolint")
	local checkmake = require("efmls-configs.linters.checkmake")
	local clang_format = require("efmls-configs.formatters.clang_format")

	-- Pint no soporta stdin, opera directo sobre el archivo (formatStdin = false)
	local pint = {
		formatCommand = "vendor/bin/pint --quiet ${INPUT}",
		formatStdin = false,
		rootMarkers = { "composer.json", "pint.json" },
	}

	vim.lsp.config("efm", {
		filetypes = {
			"c",
			"cpp",
			"javascript",
			"json",
			"jsonc",
			"lua",
			"markdown",
			"sh",
			"typescript",
			"dockerfile",
			"makefile",
			"php",
		},
		init_options = { documentFormatting = true },
		settings = {
			languages = {
				c = { clang_format },
				cpp = { clang_format },
				javascript = { eslint_d, prettier_d },
				typescript = { eslint_d, prettier_d },
				json = { eslint_d, fixjson },
				jsonc = { eslint_d, fixjson },
				lua = { luacheck, stylua },
				dockerfile = { hadolint },
				makefile = { checkmake },
				php = { pint },
			},
		},
	})
end
