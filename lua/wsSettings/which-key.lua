vim.o.timeout = true
vim.o.timeoutlen = 0
require("which-key").setup {
    -- 在这里写下配置，或者留白使用默认配置： https://github.com/folke/which-key.nvim#%EF%B8%8F-configuration
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        -- For example:
        -- ["<space>"] = "SPC",
        -- ["<cr>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    popup_mappings = {
        scroll_down = '<c-d>', -- binding to scroll down inside the popup
        scroll_up = '<c-u>', -- binding to scroll up inside the popup
    },
    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0
    },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 3, -- spacing between columns
        align = "right", -- align columns left, center or right
    },
    ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    show_keys = true, -- show the currently pressed key and its label as a message in the command line
    triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        -- this is mostly relevant for key maps that start with a native binding
        -- most people should not need to change this
        i = { "j", "k" },
        v = { "j", "k" },
    },
    -- disable the WhichKey popup for certain buf types and file types.
    -- Disabled by deafult for Telescope
    disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
    },
}
local wk = require("which-key")
local normalModeMapping = {
    ["<space>"] = {
        name = "Space",
        f = { "<cmd>Telescope find_files<cr>", "Open file picker" },
        t = { "<cmd>NvimTreeToggle<cr>", "Open file tree" },
        l = { "<cmd>Mason<cr>", "Open lsp market" },
        a = { "<Plug>(coc-codeaction)", "Perform code action" },
        F = { "<cmd>CocCommand editor.action.formatDocument<cr>", "Perform code format" },
        R = { "<Plug>(coc-codeaction-refactor)", "Perform code refector" },
        d = { "<cmd>CocDiagnostics <cr>", "Open workspace diagnostic picker" },
        r = { "<Plug>(coc-rename)", "Rename symbol" },
        h = { "<cmd>lua _G.show_docs()<CR>", "Select symbol references" },
        s = { "<cmd>CocList -I symbols<cr>", "Open symbol picker" },
        y = { "<cmd>CocList -A --normal yank<cr>", "Open yanked picker" },
        c = { "<cmd>CocCommand<cr>", "Open coc extension markets" },
        g = { '<cmd>LazyGit<cr>', "Open git manager tools" },
        ['/'] = { '<cmd>Telescope grep_string<cr>', "Global search content" },
        ['\''] = { '<cmd>Telescope resume<cr>', "Open latest search content" },
        k = { "<cmd>Translate<CR>", "Open dict" },
        K = {"<cmd>TransPlay<CR>", "Open dict say"},
        C = { "<cmd>ChatGPT<cr>", "Open ChatGPT" },
        p = { "<cmd>Telescope projections<cr>", "Open projects" }
    },
    ["g"] = {
        name = "Goto",
        d    = { "<Plug>(coc-definition)", "definition" },
        t    = { "<Plug>(coc-type-definition)", "type" },
        i    = { "<Plug>(coc-implementation)", "implement" },
        r    = { "<Plug>(coc-references)", "references" }
    },
    ["["] = {
        name = "Left bracket",
        d = { "<Plug>(coc-diagnostic-prev)", "Goto previous diagnostic" },
        f = { "<cmd>TSTextobjectGotoPreviousEnd @function.inner<cr>v<cmd>TSTextobjectGotoPreviousStart @function.outer<cr>",
            "Goto next function" }
    },
    ["]"] = {
        name = "Right bracket",
        d = { "<Plug>(coc-diagnostic-next)", "Goto next diagnostic" },
        f = { "<cmd>TSTextobjectGotoNextStart @function.inner<cr>v<cmd>TSTextobjectGotoNextEnd @function.outer<cr>",
            "Goto next function" }
    },
    ["P"] = {
        name = "Project manager",
        a = { "<cmd>AddWorkspace<cr>", "Add current_dir to projectManager" },
        s = { "<cmd>StoreProjectSession<cr>", "Add current_project to session" },
        r = { "<cmd>RestoreProjectSession<cr>", "Restore project session" }
    }
}
local normalModeOpts = {
    mode = "n", -- NORMAL mode
    -- prefix: use "<leader>f" for example for mapping everything related to finding files
    -- the prefix is prepended to every mapping part of `mappings`
    prefix = "",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}
wk.register(normalModeMapping, normalModeOpts)
