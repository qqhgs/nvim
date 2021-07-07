local function map(mode, key, command, options)
    vim.api.nvim_set_keymap(mode, key, command, options)
end
local o = {}
o.n = { noremap = true }
o.ns = { noremap = true, silent = true }
map('n', '<Space>', '<NOP>', o.ns)



-- vim.cmd('au BufWinLeave * silent mkview')
-- vim.cmd('au BufWinEnter * silent loadview')
-- vim.cmd('let ayucolor="mirage"')

-- tokyonight: Example config in Lua
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]


-- lua
Var.lang.lua.active = true

-- javascript
Var.lang.tsserver.active = true

-- FTerm
map('n', '<A-CR>', '<CMD>lua require("FTerm").toggle()<CR>', o.ns)
map('t', '<A-CR>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', o.ns)
