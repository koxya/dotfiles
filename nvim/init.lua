require('base')

if not vim.g.vscode then
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
  require('lazy').setup({
    {
      'folke/tokyonight.nvim',
      config = function()
        vim.cmd[[colorscheme tokyonight]]
      end,
    },
    { -- many plugins dependent on this
      'nvim-lua/plenary.nvim'
    },
    { 'pocco81/auto-save.nvim' },
    { 'nvim-tree/nvim-web-devicons' },
    {
      'nvim-tree/nvim-tree.lua',
      keys = {
        { '<C-b>', '<cmd>NvimTreeToggle<CR>' },
      },
      config = function()
        require('nvim-tree').setup{}
      end
    },
    {
      'akinsho/bufferline.nvim',
      keys = {
        { '<Tab>', '<cmd>BufferLineCycleNext<cr>', mode = 'n' },
      },
      tag = 'v4.*',
      event = 'BufEnter',
      config = function()
        require('bufferline').setup{}
      end,
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
      'simeji/winresizer',
    },
    {
      -- status line
      'nvim-lualine/lualine.nvim',
      config = function()
        require('lualine').setup({
          options = {
            globalstatus = true,
          }
        })
      end
    },
    {
      'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup{}
      end,
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
    {
      -- fuzzy finder
      'nvim-telescope/telescope.nvim',
      keys = {
        { '<C-p>', '<cmd>Telescope find_files<cr>' },
        { '<C-g>', '<cmd>Telescope live_grep<cr>' },
        { '<C-f>', '<cmd>Telescope current_buffer_fuzzy_find<cr>' },
        { '<C-h>', '<cmd>Telescope command_history<cr>' },
        { ';;', '<cmd>Telescope resume<cr>' },
      },
      extensions = {
        fzf = {
          fuzzy = true,        -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = 'smart_case',  -- or 'ignore_case' or 'respect_case'
          -- the default case_mode is 'smart_case'
        }
      },
      config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      end,
    },
    {
       'nvim-telescope/telescope-fzf-native.nvim',
       build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    {
       'nvim-telescope/telescope-frecency.nvim',
       dependencies = { 'kkharji/sqlite.lua' },
       config = function()
         require('telescope').load_extension('frecency')
       end,
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
      'neovim/nvim-lspconfig',
    },
    {
      -- Configurations for Nvim LSP
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
    { 'hrsh7th/cmp-cmdline'},
    {
      'lewis6991/gitsigns.nvim',
        config = function()
          require('gitsigns').setup({
            on_attach = function(bufnr)
              local function map(mode, lhs, rhs, opts)
                opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
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
      'mvllow/modes.nvim',
      event = BufEnter,
      config = function()
        require('modes').setup()
      end
    },
    {
      'folke/trouble.nvim',
      config = function()
        require('trouble').setup()
      end
    },
    {
      'jose-elias-alvarez/null-ls.nvim',
      config = function()
        require('null-ls').setup()
      end
    }
  })

  require('telescope').load_extension('fzf')
  local nvim_lsp = require('lspconfig')
  local mason_lspconfig = require('mason-lspconfig')
  mason_lspconfig.setup_handlers({
    function(server_name)
     local opts = {}
     opts.on_attach = function(_, bufnr)
       local bufopts = { silent = true, buffer = bufnr }
       vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
       vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
       vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
       vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
       vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
       vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
       vim.keymap.set('n', '<leader>f', function()
         vim.lsp.buf.format { async = true }
       end, bufopts)
     end
     nvim_lsp[server_name].setup(opts)
    end
  })

  local cmp = require('cmp')
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    })
  })

  config = function()
    local on_attach = function(_, bufnr)
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end
    local servers = {
      ruby_ls = {
        filetypes = { 'ruby' },
      },
      gopls = {
        filetypes = { 'go' }
      },
      tsserver = {
        filetypes = { 'ts', 'tsx' }
      }
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end
    }
  end
end
