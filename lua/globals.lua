CONFIG_PATH 	= vim.fn.stdpath('config')
DATA_PATH 		= vim.fn.stdpath('data')
CACHE_PATH 		= vim.fn.stdpath('cache')
TERMINAL 		= vim.fn.expand "$TERMINAL"

Var = {
	auto_close_tree 	= 0,
    format_on_save      = false,
	auto_compleate 		= true,
	hidden_files 		= true,
	number 				= true,
	cursorline 			= true,
	wrap_line 			= false,
	hl_search 			= true,
	ignore_case 		= true,
	smart_case 			= true,
	timeoutlen 			= 300,
	relative_number 	= false,
	-- colorscheme 		= "tokyonight",
	transparent_window 	= false,
	leader_key 			= "space",
	vsnip_dir 			= vim.fn.stdpath "config" .. "/snippets",

    user_plugins = {
        -- use config.lua for this not put here
    },

    user_autocommands = {
        { "FileType", "qf", "set nobuflisted" },
    },

	plugin = {
		indent_line = { active = true },
        colorizer = { active = true },
        floatterm = { active = true },
        ts_autotag = { active = true },
        diffview = { active = true },
        ts_rainbow = { active = true },
		telescope_fzy = { active = true },
		telescope_project = { active = true },
		ts_playground = { active = false },
		ts_context_commentstring = { active = false },
		dashboard = { active = true }
	},
	dashboard = {
		custom_header = {
		"███████╗ ███╗   ██╗ ██╗   ██╗ ██╗ ██╗  ██╗  ██████╗  ██████╗ ",
		"██╔════╝ ████╗  ██║ ██║   ██║ ██║ ██║ ██╔╝ ██╔═══██╗ ██╔══██╗",
		"█████╗   ██╔██╗ ██║ ██║   ██║ ██║ █████╔╝  ██║   ██║ ██║  ██║",
		"██╔══╝   ██║╚██╗██║ ╚██╗ ██╔╝ ██║ ██╔═██╗  ██║   ██║ ██║  ██║",
		"███████╗ ██║ ╚████║  ╚████╔╝  ██║ ██║  ██╗ ╚██████╔╝ ██████╔╝",
		"╚══════╝ ╚═╝  ╚═══╝   ╚═══╝   ╚═╝ ╚═╝  ╚═╝  ╚═════╝  ╚═════╝ ",
		},
		footer = {'Hello World'}
	},
	treesitter = {
        ensure_installed = {

			"javascript",
			"html",
			"css",
			"bash",
			"lua",
			"json",
			"php",
			"go",
			"cpp",
			-- "python"
			-- "rust",
			-- "go"
		},
        highlight = {enabled = true},
        playground = {enabled = true},
        rainbow = {enabled = false}
	},
	lsp = {
		popup_border = "single"
	},
    lang = {
        lua = {
            -- @usage can be 'lua-format'
            formatter = '',
            autoformat = false,
            diagnostics = {
                virtual_text = {spacing = 0, prefix = ""},
                signs = true,
                underline = true
            }
        },
        sh = {
            -- @usage can be 'shellcheck'
            linter = '',
            -- @usage can be 'shfmt'
            formatter = '',
            autoformat = false,
            diagnostics = {
                virtual_text = {spacing = 0, prefix = ""},
                signs = true,
                underline = true
            }
        },
        tsserver = {
            -- @usage can be 'eslint'
            linter = '',
            -- @usage can be 'prettier'
            formatter = '',
            autoformat = false,
            diagnostics = {
                virtual_text = {
					spacing = 0,
					prefix = ""
				},
                signs = true,
                underline = true
            }
        },
        json = {
            -- @usage can be 'prettier'
            formatter = '',
            autoformat = false,
            diagnostics = {
                virtual_text = {spacing = 0, prefix = ""},
                signs = true,
                underline = true
            }
        },
        tailwindcss = {
            filetypes = {
                'html', 'css', 'scss', 'javascript', 'javascriptreact',
                'typescript', 'typescriptreact'
            }
        },
        clang = {
            diagnostics = {
                virtual_text = {spacing = 0, prefix = ""},
                signs = true,
                underline = true,
                cross_file_rename = true,
                header_insertion = 'never'
            }
        },
        go = {},
        vim = {},
        php = {},
        html = {},
        emmet = {active = true},
        docker = {},
        css = {
            formatter = '',
            autoformat = false,
            virtual_text = true
        },
    },
}
