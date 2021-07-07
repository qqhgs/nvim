local cmd = vim.cmd
local opt = vim.opt

cmd "filetype plugin on"
cmd('let &titleold="' .. TERMINAL .. '"')
cmd "set inccommand=split"
cmd "set iskeyword+=-"
cmd "set whichwrap+=<,>,[,],h,l"
if Var.transparent_window then
  cmd "au ColorScheme * hi Normal ctermbg=none guibg=none"
  cmd "au ColorScheme * hi SignColumn ctermbg=none guibg=none"
end

-- COLORSCHEME
-- vim.g.colors_name = Var.colorscheme

cmd('set iskeyword+=-')
cmd('set shortmess+=c')

opt.hidden              = Var.hidden_files              -- Keep multiple buffers open
opt.number			    = Var.number 					-- set numbered line
opt.cursorline		    = Var.cursorline		        -- Enable highlighting current line
opt.wrap			    = Var.wrap_line		        -- Disable from wrap
opt.hlsearch 			= Var.hl_search -- highlight all matches on previous search pattern
opt.ignorecase 			= Var.ignore_case -- ignore case in search patterns
opt.smartcase 			= Var.smart_case -- smart case
opt.timeoutlen 			= Var.timeoutlen -- time to wait for a mapped sequence to complete (in milliseconds)
opt.relativenumber 		= Var.relative_number -- set relative numbered lines

opt.title               = true
opt.signcolumn		    = "yes"		        -- Show signcolumn
opt.termguicolors		= true 				-- set term gui colors (most terminal support this)
opt.splitbelow		    = true		        -- Horiontal split auto to the below
opt.splitright		    = true		        -- Vertical split auto to the right
opt.fileencoding        = "utf-8"           -- The encoding written to file
opt.mouse			    = "a"		        -- Enable mouse
opt.showtabline		    = 2		            -- Always show tabline
opt.clipboard			= "unnamedplus"     -- Allow neovim to access the system clipboard
opt.showmode			= false		        -- We don't want to see things like -- INSERT --
opt.expandtab		    = true		        -- Convert tab to spaces
opt.smartindent		    = true		        -- Make indenting smart
opt.updatetime		    = 300		        -- Faster completion
opt.backup			    = false 			-- Create backup files
opt.writebackup		    = false 			-- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.swapfile			= false  			-- Create a swapfile
opt.cmdheight			= 2 -- more space in the neovim command line for displaying messages
opt.colorcolumn 		= "999999" 				-- Fix indentline for now
opt.completeopt 		= { "menuone", "noselect" }
opt.conceallevel 		= 0 					-- so taht `` (i:backtik) is visible in markdown files
opt.guifont 			= "monospace:h17" 	-- The font used in graphical neovim applications
opt.pumheight 			= 10 -- pop up menu height
opt.titlestring 		= "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
opt.undodir 			= CACHE_PATH .. "/undo" -- set an undo directory
opt.undofile 			= true -- enable persisten undo
opt.shiftwidth 			= 4 -- the number of spaces inserted for each indentation
opt.tabstop 			= 4 -- insert 4 spaces for a tab
opt.shortmess:append "c"
