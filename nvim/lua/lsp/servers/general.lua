-- lua/lsp/servers/general.lua
-- Servidores que no necesitan config custom (usan los defaults que
-- trae nvim-lspconfig de fábrica). "efm" NO va acá: ya se enable()
-- desde configured_servers en lsp/config.lua, ponerlo acá también
-- lo hacía correr dos veces por las dudas.
return {
	"dockerls",
}
