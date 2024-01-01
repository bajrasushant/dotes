local function set_theme(theme)
	local light_theme = 'solarized'
	local dark_theme = 'nord'

	vim.opt.background = theme == 'light' and 'light' or 'dark'
	vim.cmd("colorscheme " .. (theme == "light" and light_theme or dark_theme))
	require('lualine').setup{
		options = {
			theme = theme == "light" and 'solarized_light' or 'nord',
		}
	}
end

local hour = tonumber(os.date("%H"))
set_theme(hour >= 6 and hour < 18 and "light" or "dark")

function ToggleTheme()
	local current_theme = vim.opt.background:get()
	local new_theme = current_theme == 'light' and 'dark' or 'light'
	set_theme(new_theme)
end

vim.api.nvim_set_keymap('n', '<leader>ld', ':lua ToggleTheme()<CR>', { noremap = true, silent = true })
