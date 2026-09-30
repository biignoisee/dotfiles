do
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local eslint_d = require("efmls-configs.linters.eslint_d")
	local fixjson = require("efmls-configs.formatters.fixjson")
	local hadolint = require("efmls-configs.linters.hadolint")
	local checkmake = require("efmls-configs.linters.checkmake")

	-- Go
	local gofumpt = {
		formatCommand = "gofumpt",
		formatStdin = true,
	}

	local golangci_lint = {
		lintCommand = "golangci-lint run --output.text.path=${TMP}",
		lintStdin = false,
		lintFormats = {
			"%-G%f:%l:%c: %m",
			"%-G%f:%l: %m",
			"%f:%l:%c: %m",
		},
		rootMarkers = {
			"go.mod",
			"go.work",
			".golangci.yml",
			".golangci.yaml",
		},
	}

	-- Pint no soporta stdin, opera directo sobre el archivo
	local pint = {
		formatCommand = "vendor/bin/pint --quiet ${INPUT}",
		formatStdin = false,
		rootMarkers = { "composer.json", "pint.json" },
	}

	vim.lsp.config("efm", {
		filetypes = {
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
			"go",
		},

		init_options = {
			documentFormatting = true,
		},

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

				go = {
					gofumpt,
					golangci_lint,
				},
			},
		},
	})
end
