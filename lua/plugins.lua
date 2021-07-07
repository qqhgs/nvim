local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

local packer_ok, packer = pcall(require, "packer")
if not packer_ok then
    return
end

packer.init {
    git = { clone_timeout = 300 },
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
}

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"

    -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
    use { "neovim/nvim-lspconfig" }
    use { "kabouzeid/nvim-lspinstall", event = "BufRead" }

    -- Telescope
    use {"nvim-lua/popup.nvim"}
    use {"nvim-lua/plenary.nvim"}
    use {"tjdevries/astronauta.nvim"}
    use {
        "nvim-telescope/telescope.nvim",
        config = [[require('v-telescope')]],
        -- cmd = "Telescope",
        -- event = "BufEnter",
    }

    -- Autocomplete
    use {
        "hrsh7th/nvim-compe",
        config = function()
            require("v-compe").config()
        end
    }

    use {"hrsh7th/vim-vsnip", event = "InsertEnter"}
    use {"rafamadriz/friendly-snippets", event = "InsertEnter"}

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    -- Neoformat
    use { "sbdchd/neoformat" }

    -- Explorer
    use {
        "kyazdani42/nvim-tree.lua",
        -- cmd = "NvimTreeToggle",
        config = function()
            require("v-nvimtree").config()
        end
    }

    use {
        "lewis6991/gitsigns.nvim",

        config = function()
            require("v-gitsigns").config()
        end,
        event = "BufRead",
    }

    -- Autopairs
    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        after = { "telescope.nvim" },
        config = function()
            require "v-autopairs"
        end,
    }

    -- whichkey
    use {"folke/which-key.nvim"}

    -- Comments
    use {
        "terrortylor/nvim-comment",
        cmd = "CommentToggle",
        config = function()
            require('nvim_comment').setup()
        end
    }

    -- Use fzy for telescope
    use {
        "nvim-telescope/telescope-fzy-native.nvim",
        event = "BufRead",
        disable = not Var.plugin.telescope_fzy.active
    }
    -- Use project for telescope
    use {
        "nvim-telescope/telescope-project.nvim",
        event = "BufRead",
        after = "telescope.nvim",
        disable = not Var.plugin.telescope_project.active
    }


    -- Status Line and Bufferline
    use {"glepnir/galaxyline.nvim"}
    use {
        "romgrk/barbar.nvim",

        config = function()
            vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>',
                {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>',
                {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<S-x>', ':BufferClose<CR>',
                {noremap = true, silent = true})
        end,
        event = "BufRead",
    }

    -- Icons
    use {"kyazdani42/nvim-web-devicons"}

    -- colorscheme
    use {"folke/tokyonight.nvim"}

    -- Dashboard
    use {
        "ChristianChiarulli/dashboard-nvim",
        event = 'BufWinEnter',
        cmd = {"Dashboard", "DashboardNewFile", "DashboardJumpMarks"},
        config = function()
            require('v-dashboard').config()
        end,
        disable = not Var.plugin.dashboard.active,
        opt = true
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        branch = "lua",
        event = "BufRead",
        setup = function()

            vim.g.indentLine_enabled = 1
            vim.g.indent_blankline_char = "▏"

            vim.g.indent_blankline_filetype_exclude =
                {"help", "terminal", "dashboard"}
            vim.g.indent_blankline_buftype_exclude = {"terminal"}

            vim.g.indent_blankline_show_trailing_blankline_indent = true
            vim.g.indent_blankline_show_first_indent_level = true
        end,
        disable = not Var.plugin.indent_line.active
    }

    use {
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = function()
            require "v-colorizer"
            -- vim.cmd "ColorizerReloadAllBuffers"
        end,
        disable = not Var.plugin.colorizer.active,
    }

    -- Floating terminal
    use {
        "numToStr/FTerm.nvim",
        event = "BufWinEnter",
        config = function()
            require("v-floatterm").config()
        end,
        disable = not Var.plugin.floatterm.active,
    }

    -- Diffview
    use {
        "sindrets/diffview.nvim",
        event = "BufRead",
        disable = not Var.plugin.diffview.active,
    }

    -- Pretty parentheses
    use {
        "p00f/nvim-ts-rainbow",
        disable = not Var.plugin.ts_rainbow.active,
    }

    -- Autotags <div>|</div>
    use {
        "windwp/nvim-ts-autotag",
        event = "InsertEnter",
        disable = not Var.plugin.ts_autotag.active,
    }

    -- I like this so much
    use { "tpope/vim-surround" }
    use { "ChristianChiarulli/emmet-vim" }
    use { "andymass/vim-matchup" }

    for _, plugin in pairs(Var.user_plugins) do
        packer.use(plugin)
    end
end)
