local setup_treesitter = function()
	local treesitter = require("nvim-treesitter")
	treesitter.setup({})

	local ensure_installed = {
		-- Core / config de neovim
		"vim",
		"vimdoc",
		"lua",
		"bash",

		-- Formatos de config / infra (docker, k8s, RAG configs, etc.)
		"json",
		"jsonc",
		"yaml",
		"toml",
		"dockerfile",

		-- Docs
		"markdown",
		"markdown_inline",
		"gitcommit",
		"diff",
		"comment", -- resalta TODO/FIXME dentro de comentarios en cualquier lenguaje

		-- Backend: Nest.js / TS / Python (AI, RAG)
		"javascript",
		"typescript",
		"tsx",
		"python",
		"sql", -- útil también como base para queries embebidas

		-- Frontend: Vue + Angular (Angular usa html/ts, Vue usa su propio parser)
		"vue",
		"html",
		"css",
		"scss",

		-- PHP
		"php",
		"phpdoc",

		-- Utilidad transversal (regex embebidos en JS/TS/Python)
		"regex",
	}

	local config = require("nvim-treesitter.config")
	local already_installed = config.get_installed()
	local parsers_to_install = {}

	for _, parser in ipairs(ensure_installed) do
		if not vim.tbl_contains(already_installed, parser) then
			table.insert(parsers_to_install, parser)
		end
	end

	if #parsers_to_install > 0 then
		treesitter.install(parsers_to_install)
	end

	local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		callback = function(args)
			local lang = vim.treesitter.language.get_lang(args.match)
			if not lang then
				return
			end
			local ok = pcall(vim.treesitter.start, args.buf, lang)
			if ok then
				-- Activar indentación de treesitter para este buffer
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				-- Activar folding por treesitter
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo.foldmethod = "expr"
			end
		end,
	})
end

setup_treesitter()
