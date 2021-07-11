require('globals')
require('mappings')
vim.cmd('luafile ' .. CONFIG_PATH .. '/config.lua')
require('settings')
require('plugins')

-- plugins
require('v-utils')
require('v-galaxyline')
require('v-treesitter')
require('v-whichkey')
-- require('v-neoformat')
require('lsp')
