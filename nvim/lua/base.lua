-- leader
vim.g.mapleader = " "
vim.opt.termguicolors = true

-- encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8','sjis','euc-jp'

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- set hide current mode
vim.opt.showmode = false

-- editor
vim.opt.number = true
vim.opt.list = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.hidden = true
vim.opt.mouse = 'a'
vim.opt.title = true
vim.opt.showcmd = true
vim.opt.sidescroll = 5
vim.opt.swapfile = false

-- Always display the status line at the bottom of the window
vim.opt.laststatus = 3

-- keymaps
vim.keymap.set('i', 'jj', '<ESC>', { noremap = true, silent = true })
vim.keymap.set('t', 'jk', [[<C-\><C-n>]])
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'x', '"_x')
vim.keymap.set('n', 's', '"_s')

-- clipboard
vim.opt.clipboard = 'unnamedplus'
if vim.fn.has("wsl") then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf"
    },
    paste = {
      ["+"] = "win32yank.exe -o --crlf",
      ["*"] = "win32yank.exe -o --crlf"
    },
    cache_enable = 0,
  }
end
