-- lua/lsp/servers/intelephense.lua

-- La license key NO va hardcodeada acá (si tenés tus dotfiles en git,
-- se te sube el key al repo). La leemos de una variable de entorno o,
-- si no existe, de un archivo plano fuera del repo versionado.
local function get_license_key()
	local env_key = os.getenv("INTELEPHENSE_LICENSE_KEY")
	if env_key and env_key ~= "" then
		return env_key
	end

	local key_file = vim.fn.stdpath("config") .. "/intelephense.key" -- agregalo a tu .gitignore
	local f = io.open(key_file, "r")
	if f then
		local key = f:read("*l")
		f:close()
		if key and key ~= "" then
			return key:match("^%s*(.-)%s*$")
		end
	end

	return nil
end

return {
	cmd = { "intelephense", "--stdio" },
	filetypes = { "php" },
	root_markers = { "composer.json", ".git" },
	init_options = {
		licenceKey = get_license_key(),
		storagePath = vim.fn.stdpath("cache") .. "/intelephense",
	},
	settings = {
		intelephense = {
			files = {
				maxSize = 5000000,
			},
			-- Premium: mejores completions de Laravel/frameworks si tenés
			-- los stubs correspondientes activados en tu licencia
			environment = {
				includePaths = {}, -- agregá acá paths de stubs custom si los tenés
			},
		},
	},
}
