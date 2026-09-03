-- -------------------------------------------------
-- MINI.NVIM
-- -------------------------------------------------
require("mini.ai").setup({})
require("mini.comment").setup({})
require("mini.move").setup({})
require("mini.surround").setup({})
require("mini.cursorword").setup({})
require("mini.indentscope").setup({
	draw = {
		delay = 101,
		predicate = function(scope)
			return not scope.body.is_incomplete
		end,
		priority = 3,
	},
	symbol = "╎", -- el símbolo de la línea
})
require("mini.pairs").setup({})
require("mini.trailspace").setup({})
require("mini.bufremove").setup({})
require("mini.notify").setup({})
require("mini.icons").setup({})

-- -------------------------------------------------
-- AGREGADOS
-- -------------------------------------------------

-- mini.splitjoin: toggle entre objeto/array en una línea vs multilínea.
-- gS sobre { a: 1, b: 2 } lo expande a multilínea, y viceversa.
-- Brutal para TS/JS/JSON/PHP arrays donde constantemente pasás de
-- una firma corta a una larga con muchos props.
require("mini.splitjoin").setup({})

-- mini.align: alinear por caracter. Selección visual + ga + el
-- caracter (ej "=" o ":") alinea todo. Sirve mucho para interfaces
-- TS, objetos de config, o listas de imports con alias.
require("mini.align").setup({})

-- mini.bracketed: unifica la navegación con [ ] para MUCHAS cosas
-- además de git hunks: diagnostics ([d/]d), buffers ([b/]b),
-- quickfix ([q/]q), comentarios, jumps, etc. Como ya usás [h/]h
-- para gitsigns, esto te da el mismo lenguaje de teclas para todo
-- lo demás en vez de mapear cada cosa suelta.
require("mini.bracketed").setup({})

-- mini.hipatterns: resalta patrones en el texto en tiempo real.
-- Por default: TODO/FIXME/HACK/NOTE con colores distintos, y
-- colores hex (#88C0D0) se pintan con su propio color de fondo.
-- Con tu volumen de código (backend + frontend + configs) los
-- TODO resaltados solos valen la pena.
local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})

