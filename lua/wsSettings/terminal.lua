vim.o.hidden = true
require('nvim-terminal').setup({
    position = 'botright',
    split = 'sp',
    width = 50,
    height = 15,
    disable_default_keymaps = false,
    toggle_keymap = '<C-`>',
})
terminal = require('nvim-terminal').DefaultTerminal;
local silent = { silent = true }
vim.api.nvim_set_keymap('n', '<C-1>', ':lua terminal:open(1)<cr>', silent)
vim.api.nvim_set_keymap('n', '<C-2>', ':lua terminal:open(2)<cr>', silent)
vim.api.nvim_set_keymap('n', '<C-3>', ':lua terminal:open(3)<cr>', silent)
