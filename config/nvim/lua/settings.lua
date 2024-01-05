vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.expandtab = true  -- vim.cmd("set expandtab")
vim.opt.tabstop = 2       -- vim.cmd("set tabstop=2")
vim.opt.softtabstop = 2   -- vim.cmd("set softtabstop=2")
vim.opt.shiftwidth = 2    -- vim.cmd("set shiftwidth=2")



-- remaps
--
vim.keymap.set("n", "<leader>v", ":vsplit<CR><C-w>l", {})
vim.keymap.set("n", "<leader>h", "<C-w>s", {})
vim.keymap.set("n", "<leader>j", ":wincmd h<CR>", {})
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", {})

-- primeagen
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- greatest remap ever
-- doesn't replace copied number while visual and replace
vim.keymap.set("x", "<leader>p", "\"_dP")

---- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- next greatest remap ever : asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
