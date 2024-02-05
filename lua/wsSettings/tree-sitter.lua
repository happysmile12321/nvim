require("nvim-treesitter.configs").setup({
    -- 添加不同语言
    ensure_installed = { "vim", "help", "bash", "c", "cpp", "javascript", "json", "lua", "python", "rust", "go",
        "typescript", "dart" },
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    indent = { enable = true },
    sync_install = false,
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'm',
            scope_incremental = 'm',
            node_decremental = 'M',
        },
    },
    auto_install = true,
    -- 不同括号颜色区分
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
})
