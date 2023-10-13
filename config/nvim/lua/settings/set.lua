-- vim.opt.guicursor = ''
-- vim.opt.guicursor = vim.opt.guicursor + 'a:blinkon1'
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.incsearch = true

vim.opt.scrolloff = 8

local hour = tonumber(os.date("%H"))

if hour >= 6 and hour < 18 then
	vim.opt.background = "light"
	vim.cmd("colorscheme solarized")
	require('lualine').setup {
		options = {
		theme = 'solarized_light',
	}
	}
else
	vim.opt.background = "dark"
	vim.cmd("colorscheme nord")
	require('lualine').setup {
		options = {
		theme = 'nord',
	}
	}
end
