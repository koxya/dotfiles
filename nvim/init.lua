require('base')

local common_plugins = {
        {
                'kevinhwang91/nvim-hlslens',
        },
        {
                'yutkat/wb-only-current-line.nvim',
        },
        { -- many plugins dependent on this
                'nvim-lua/plenary.nvim'
        },
        {
                'pocco81/auto-save.nvim'
        },
        {
                'simeji/winresizer',
        },
        {
                'mvllow/modes.nvim',
                event = BufEnter,
                config = function()
                        require('modes').setup()
                end
        },
        {
                'windwp/nvim-autopairs',
                event = 'InsertEnter',
        },
        {
                'kylechui/nvim-surround',
                version = '*', -- Use for stability; omit to use `main` branch for the latest features
                event = 'VeryLazy',
                config = function()
                        require('nvim-surround').setup({
                                -- Configuration here, or leave empty to use defaults
                        })
                end
        },
}

local neovim_plugins = {
        {
                'folke/tokyonight.nvim',
                config = function()
                        require("tokyonight").setup({
                                on_colors = function(colors)
                                        colors.border = "orange"
                                end
                        })
                        vim.cmd [[colorscheme tokyonight-night]]
                end,
        },
        {
                'nvim-tree/nvim-web-devicons'
        },
        {
                -- status line
                'nvim-lualine/lualine.nvim',
                config = function()
                        require('lualine').setup({
                                options = {
                                        theme = 'tokyonight',
                                        globalstatus = true,
                                }
                        })
                end
        },
        {
                'nvim-tree/nvim-tree.lua',
                keys = {
                        { 'tb', '<cmd>NvimTreeToggle<CR>' },
                        { 'cb', '<cmd>NvimTreeFindFile<CR>' },
                },
                config = function()
                        require('nvim-tree').setup {}
                end
        },
        {
                'nvim-treesitter/nvim-treesitter',
                config = function()
                        require('nvim-treesitter').setup({
                                highlight = {
                                        enable = true,
                                        auto_install = true,
                                },
                                indent = {
                                        enable = true
                                }
                        })
                end
        },
        {
                'akinsho/bufferline.nvim',
                keys = {
                        { '<Tab>', '<cmd>BufferLineCycleNext<cr>', mode = 'n' },
                },
                version = "*",
                event = 'BufEnter',
                config = function()
                        require('bufferline').setup {}
                end,
        },
        {
                -- fuzzy finder
                'nvim-telescope/telescope.nvim',
                tag = '0.1.6',
                keys = {
                        { '<C-p>', '<cmd>Telescope find_files<cr>' },
                        { '<C-g>', '<cmd>Telescope live_grep<cr>' },
                        { '<C-f>', '<cmd>Telescope current_buffer_fuzzy_find<cr>' },
                        { '<C-h>', '<cmd>Telescope command_history<cr>' },
                        { ';;',    '<cmd>Telescope resume<cr>' },
                },
                extensions = {
                        fzf = {
                                fuzzy = true, -- false will only do exact matching
                                override_generic_sorter = true, -- override the generic sorter
                                override_file_sorter = true, -- override the file sorter
                                case_mode = 'smart_case', -- or 'ignore_case' or 'respect_case'
                                -- the default case_mode is 'smart_case'
                        }
                },
                dependencies = {
                        'nvim-lua/plenary.nvim',
                        'folke/trouble.nvim'
                },
                config = function()
                        local builtin = require('telescope.builtin')
                        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
                end,
        },
        {
                'nvim-telescope/telescope-fzf-native.nvim',
                build =
                'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        },
        {
                'nvim-telescope/telescope-frecency.nvim',
                dependencies = { 'kkharji/sqlite.lua' },
                config = function()
                        require('telescope').load_extension('frecency')
                end,
        },
        {
                'neovim/nvim-lspconfig',
        },
        {
                -- Configurations for Nvim LSPin
                'williamboman/mason.nvim',
                config = function()
                        require('mason').setup()
                end
        },
        {
                'williamboman/mason-lspconfig.nvim',
                config = function()
                        require('mason-lspconfig').setup {
                                ensure_installed = { 'lua_ls' },
                        }
                end
        },
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        {
                'petertriho/nvim-scrollbar',
        },
        {
                'akinsho/toggleterm.nvim',
                keys = {
                        { 'tt', '<cmd>ToggleTerm direction=tab<cr>' },
                        { 'th', '<cmd>ToggleTerm direction=horizontal<cr>' },
                        { 'tv', '<cmd>ToggleTerm direction=vertical<cr>' },
                        { 'tf', '<cmd>ToggleTerm direction=float<cr>' },
                },
                config = function()
                        require('toggleterm').setup({
                                size = function(term)
                                        if term.direction == 'horizontal' then
                                                return 15
                                        elseif term.direction == 'vertical' then
                                                return vim.o.columns * 0.4
                                        end
                                end,
                                float_opts = {
                                        border = 'curved',
                                }
                        })
                end
        },
        {
                'lewis6991/gitsigns.nvim',
                config = function()
                        require('gitsigns').setup({
                                on_attach = function(bufnr)
                                        local function map(mode, lhs, rhs, opts)
                                                opts = vim.tbl_extend('force', { noremap = true, silent = true },
                                                        opts or {})
                                                vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
                                        end

                                        -- Navigation
                                        map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
                                        map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

                                        -- Actions
                                        map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
                                        map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
                                        map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
                                        map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
                                        map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
                                        map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
                                        map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
                                        map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
                                        map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
                                        map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
                                        map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
                                        map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
                                        map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')
                                end
                        })
                        require("scrollbar.handlers.gitsigns").setup()
                        require("scrollbar.handlers.search").setup({
                                -- hlslens config overrides
                        })
                end,
        },
        {
                'sindrets/diffview.nvim',
                config = function()
                        require('diffview').setup({
                                view = {
                                        merge_tool = {
                                                layout = 'diff3_mixed'
                                        }
                                }
                        })
                end,
        },
        {
                'TimUntersberger/neogit',
                keys = {
                        { '<leader>g', '<cmd>Neogit<cr>' },
                },
                config = function()
                        require('neogit').setup({
                                integrations = {
                                        diffview = true
                                }
                        })
                end
        },
        {
                'jose-elias-alvarez/null-ls.nvim',
                config = function()
                        require('null-ls').setup()
                end
        },
        {
                'RRethy/vim-illuminate',
        },
        {
                'folke/trouble.nvim',
                config = function()
                        require('trouble').setup()
                end,
                keys = {
                        '<leader>xx', '<cmd>TroubleToggle<cr>',
                        '<leader>xw', '<cmd>TroubleToggle lsp_workspace_diagnostics<cr>',
                        '<leader>xd', '<cmd>TroubleToggle lsp_document_diagnostics<cr>',
                        '<leader>xq', '<cmd>TroubleToggle quickfix<cr>',
                        '<leader>xl', '<cmd>TroubleToggle loclist<cr>',
                        '<leader>xr', '<cmd>TroubleToggle lsp_references<cr>',
                }
        },
        { 'github/copilot.vim' },

}

local vscode_plugins = {

}

local function merge_tables(t1, t2)
    local merged = {}
    for _, v in ipairs(t1) do
        table.insert(merged, v)
    end
    for _, v in ipairs(t2) do
        table.insert(merged, v)
    end
    return merged
end

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
                'git',
                'clone',
                '--filter=blob:none',
                'https://github.com/folke/lazy.nvim.git',
                '--branch=stable', -- latest stable release
                lazypath,
        })
end
vim.opt.rtp:prepend(lazypath)

local is_vscode = vim.g.vscode == 1
require('lazy').setup(
        merge_tables(common_plugins, is_vscode and vscode_plugins or neovim_plugins)
)

if not is_vscode then
        require('telescope').load_extension('fzf')
        require('lsp')
end
