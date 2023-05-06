local ls = require("luasnip")
local ai = require("luasnip.nodes.absolute_indexer")
local events = require("luasnip.util.events")
local extras = require("luasnip.extras")
local fmt = require("luasnip.extras.fmt").fmt
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")

ls.config.set_config({
	-- This tells LuaSnip to remember the last snippet.
	-- You can jump back into it even if you move outside of the selection.
	history = true,

	-- Update dynamic snippets in real time.
	updateevents = "TextChanged,TextChangedI",

	-- Autosnippets
	enable_autosnippets = true,

	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "⋯", "Error" } },
			},
		},
	},
})

-- Prevent a reload of this file from creating duplicate snippet entries.
ls.cleanup()

-- Define and add snippets
ls.add_snippets("python", {
	ls.snippet( -- shebang
		{
			trig = "^#!",
			regTrig = true,
			name = "shebang",
			dscr = "Interpreter directive to execute file with Python",
			snippetType = "autosnippet",
		},
		fmt(
			[[
			#!/usr/bin/env python{}

			]],
			ls.choice_node(1, {
				ls.text_node({ "" }),
				ls.text_node({ "3" }),
			}, {})
		)
	),

	ls.snippet( -- module-level logger
		{
			trig = "logger",
			name = "Global Logger",
			dscr = "A globally scoped module-level logger",
			snippetType = "snippet",
		},
		fmt(
			[[
			logger: logging.Logger = logging.getLogger({})
			{}

			]],
			{
				ls.insert_node(1, "__name__"),
				ls.choice_node(2, {
					ls.text_node("logger.addHandler(logging.NullHandler())"),
					ls.text_node(""),
				}, {}),
			}
		)
	),

	ls.snippet( -- log message
		{
			trig = "lm",
			name = "Log Message (Choice)",
			dscr = "Log a new message to the global logger",
			snippetType = "snippet",
		},
		fmt(
			[[
			logger.{}({})
			]],
			{
				ls.choice_node(1, {
					ls.text_node("debug"),
					ls.text_node("info"),
					ls.text_node("warning"),
					ls.text_node("error"),
					ls.text_node("critical"),
					ls.text_node("exception"),
				}, {}),
				ls.insert_node(2, '"message"'),
			}
		)
	),

	ls.snippet( -- class definition
		{
			trig = "class",
			name = "Class Definition",
			dscr = "Define a new class",
			snippetType = "snippet",
		},
		fmt(
			[[
			class {}{}:
				"""{}"""

				def __init__(self{}):
					"""{}"""

					{}

			]],
			{
				ls.insert_node(1, "ClassName"),
				ls.choice_node(2, {
					ls.snippet_node(nil, {
						ls.text_node("("),
						ls.insert_node(1, "ParentClass"),
						ls.text_node(")"),
					}),
					ls.text_node(""),
				}, {}),
				ls.insert_node(3, "DocString"),
				ls.choice_node(4, {
					ls.snippet_node(nil, {
						ls.text_node(", "),
						ls.insert_node(1, "Parameters"),
					}),
					ls.text_node(""),
				}, {}),
				ls.insert_node(5, "Create a new instance"),
				ls.insert_node(6, "pass"),
			}
		)
	),

	ls.snippet( -- dataclass definition
		{
			trig = "dcl",
			name = "Dataclass Definition",
			dscr = "Define a new dataclass",
			snippetType = "snippet",
		},
		fmt(
			[[
			@dataclass{}
			class {}{}:
				"""{}"""

				{}

			]],
			{
				ls.choice_node(1, {
					ls.snippet_node(nil, {
						ls.text_node("("),
						ls.insert_node(1, "Options"),
						ls.text_node(")"),
					}),
					ls.text_node(""),
				}, {}),
				ls.insert_node(2, "ClassName"),
				ls.choice_node(3, {
					ls.snippet_node(nil, {
						ls.text_node("("),
						ls.insert_node(1, "ParentClass"),
						ls.text_node(")"),
					}),
					ls.text_node(""),
				}, {}),
				ls.insert_node(4, "DocString"),
				ls.insert_node(5, "Attributes"),
			}
		)
	),

	ls.snippet( -- function defintion
		{
			trig = "deff",
			name = "Function Definition",
			dscr = "Function definition with docstring",
			snippetType = "snippet",
		},
		fmt(
			[[
			def {}({}) -> {}:
				"""{}"""

				{}

			]],
			{
				ls.insert_node(1, "function_name"),
				ls.insert_node(2, "Parameters"),
				ls.insert_node(3, "None"),
				ls.insert_node(4, "DocString"),
				ls.insert_node(5, "pass"),
			}
		)
	),

	ls.snippet( -- method defintion
		{
			trig = "defm",
			name = "Method Definition",
			dscr = "Method definition with docstring",
			snippetType = "snippet",
		},
		fmt(
			[[
			def {}(self, {}) -> {}:
				"""{}"""

				{}

			]],
			{
				ls.insert_node(1, "function_name"),
				ls.insert_node(2, "Parameters"),
				ls.insert_node(3, "None"),
				ls.insert_node(4, "DocString"),
				ls.insert_node(5, "pass"),
			}
		)
	),

	ls.snippet( -- property decorator
		{
			trig = "@property",
			name = "Class Property Decorator",
			dscr = "Define a property for a Class",
			snippetType = "snippet",
		},
		fmt(
			[[
			@property
			def {}(self) -> {}:
				"""Return the {} property."""

				return self._{}

			@{}.setter
			def {}(self, value: {}) -> None:
				"""Set the {} property."""

				self._{} = value

			]],
			{
				ls.insert_node(1, "PropertyName"),
				ls.insert_node(2, "Type"),
				extras.rep(1),
				extras.rep(1),
				extras.rep(1),
				extras.rep(1),
				extras.rep(2),
				extras.rep(1),
				extras.rep(1),
			}
		)
	),

	ls.snippet( -- context manager
		{
			trig = "with",
			name = "Context Manager",
			dscr = "Use a context manager to access a resource",
			snippetType = "snippet",
		},
		fmt(
			[[
			with {} as {}:
				{}

			]],
			{
				ls.insert_node(1, "expression"),
				ls.insert_node(2, "variable"),
				ls.insert_node(3, "pass"),
			}
		)
	),

	ls.snippet( -- try/except
		{
			trig = "try",
			name = "Try/Except",
			dscr = "Try to perform an action; catch and handle exceptions",
			snippetType = "snippet",
		},
		fmt(
			[[
			try:
				{}
			except {} as {}:
				{}

			]],
			{
				ls.insert_node(1, "expression"),
				ls.insert_node(2, "Exception"),
				ls.insert_node(3, "error"),
				ls.insert_node(4, "pass"),
			}
		)
	),

	ls.snippet( -- assert logs
		{
			trig = "al",
			name = "Assert Logs",
			dscr = "Create a context manager to assert that a particular message is logged",
			snippetType = "snippet",
		},
		fmt(
			[[
			with self.assertLogs("{}", {}) as cm:
				{}

			]],
			{
				ls.insert_node(1, "logger.name"),
				ls.choice_node(2, {
					ls.text_node("logging.DEBUG"),
					ls.text_node("logging.INFO"),
					ls.text_node("logging.WARNING"),
					ls.text_node("logging.ERROR"),
					ls.text_node("logging.CRITICAL"),
					ls.text_node("logging.EXCEPTION"),
				}, {}),
				ls.insert_node(3, "pass"),
			}
		)
	),

	ls.snippet( -- assert raises
		{
			trig = "ar",
			name = "Assert Raises",
			dscr = "Create a context manager to assert that a particular Exception is raised",
			snippetType = "snippet",
		},
		fmt(
			[[
			with self.assertRaises({}):
				{}

			]],
			{
				ls.insert_node(1, "Exception"),
				ls.insert_node(2, "pass"),
			}
		)
	),
})

ls.add_snippets("markdown", {
	ls.snippet( -- link
		{
			trig = "link",
			name = "Link",
			dsrc = "Create a hyperlink",
			snippetType = "snippet",
		},
		fmt(
			[[
			[{}]({}{})
			]],
			{
				ls.insert_node(1, "link text"),
				ls.insert_node(2, "https://url/"),
				ls.insert_node(3, ' "Optional Link Title"'),
			}
		)
	),
})

ls.add_snippets("terraform", {
	ls.snippet( -- output
		{
			trig = "output",
			name = "Output Declaration",
			dscr = "Create a new output",
			snippetType = "snippet",
		},
		fmt(
			[[
			output "{}" {{
				description = "{}"
				value       = {}
				{}
			}}
			]],
			{
				ls.insert_node(1, "output_name"),
				ls.insert_node(2, "Human-readable description"),
				ls.insert_node(3, '"Default Value"'),
				ls.choice_node(4, {
					ls.text_node("sensitive   = false"),
					ls.text_node("sensitive   = true"),
				}, {}),
			}
		)
	),

	ls.snippet( -- variable
		{
			trig = "variable",
			name = "Variable Declaration",
			dscr = "Create a new variable",
			snippetType = "snippet",
		},
		fmt(
			[[
			variable "{}" {{
				description = "{}"
				type        = {}
				default     = {}
			}}
			]],
			{
				ls.insert_node(1, "variable_name"),
				ls.insert_node(2, "Human-readable description"),
				ls.insert_node(3, "variable_type"),
				ls.insert_node(4, '"Default Value"'),
			}
		)
	),

	ls.snippet( -- module
		{
			trig = "module",
			name = "Module Declaration",
			dscr = "Create a new module",
			snippetType = "snippet",
		},
		fmt(
			[[
			module "{}" {{
				source  = "{}"
				version = "{}"

				{}
			}}
			]],
			{
				ls.insert_node(1, "module_name"),
				ls.insert_node(2, "module_source/url/repo/"),
				ls.insert_node(3, "pinned_version"),
				ls.insert_node(4, "attributes"),
			}
		)
	),

	ls.snippet( -- resource
		{
			trig = "resource",
			name = "Resource Declaration",
			dscr = "Create a new resource",
			snippetType = "snippet",
		},
		fmt(
			[[
			resource "{}" "{}" {{
				{}
			}}
			]],
			{
				ls.insert_node(1, "resource_type"),
				ls.insert_node(2, "resource_name"),
				ls.insert_node(3, "attributes"),
			}
		)
	),
})
-- Keymaps
-- Expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-.>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-,>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

-- Source this file to reload settings
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
