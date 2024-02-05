-- 管理coc的扩展
vim.g.coc_global_extensions = {
    'coc-json',
    'coc-git',
    'coc-lua',
    'coc-pairs',
    'coc-git',
    'coc-yank',
    'coc-toml',
    -- 'coc-translator', -- 不好用，😋
    'coc-rust-analyzer',
    'coc-deno',
    'coc-sh',
    'coc-ember',
    'coc-html',
    'coc-css',
    'coc-tsserver',
    'coc-vimlsp',
    'coc-highlight',
    'coc-actions',
    -- "coc-flutter", -- not good
    "coc-flutter-tools",
    "coc-ecdict",
    "@yaegassy/coc-tailwindcss3",
    -- "coc-copilot",
    'coc-snippets'
}

-- 通知延迟的毫秒数
vim.opt.updatetime = 0
-- 展示标志
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- 自动补全
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- ======= 插入模式下的键位匹配 =======

-- 使用TAB在单词后面触发自动补全。
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- 按Enter选择补全项
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
-- ======= 普通模式下的键位匹配 =======
-- 跳转

function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

-- 在光标聚集的时候高亮符号和它的引用
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- 格式化选中的代码
keyset("x", "<leader>F", "<Plug>(coc-format-selected)", { silent = true })
keyset("n", "<leader>F", "<Plug>(coc-format-selected)", { silent = true })

-- 自动触发补全
keyset("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

-- 设置格式化的文件类型
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json,lua",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- 再跳转的占位符上更新签名
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})


-- 在当前的选中区域展开codeAction
local opts = { silent = true, nowait = true }




-- 快速修复
keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

-- 重新映射C-d和C-u,对于window和popup的滚动
local opts = { silent = true, nowait = true, expr = true }
keyset("n", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', opts)
keyset("n", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', opts)
keyset("i", "<C-d>",
    'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keyset("i", "<C-u>",
    'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keyset("v", "<C-d>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-d>"', opts)
keyset("v", "<C-u>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-u>"', opts)

-- 使用C-S选中对应的范围
keyset("n", "<C-s>", "<Plug>(coc-range-select)", { silent = true })
keyset("x", "<C-s>", "<Plug>(coc-range-select)", { silent = true })

vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = '?' })
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- snippets
vim.g.coc_snippet_prev = '<c-p>'
vim.g.coc_snippet_next = '<c-n>'
