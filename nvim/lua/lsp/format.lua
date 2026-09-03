-- lua/lsp/format.lua
local augroup = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = augroup,
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client or client.name ~= "efm" then
			return
		end

		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = args.buf,
			callback = function()
				if not vim.bo[args.buf].modifiable then
					return
				end
				pcall(vim.lsp.buf.format, {
					bufnr = args.buf,
					timeout_ms = 2000,
					filter = function(c)
						return c.name == "efm"
					end,
				})
			end,
		})
	end,
})
