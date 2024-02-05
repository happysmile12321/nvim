-- 如果当前目录不是.git，那么默认不会启用该插件
vim.g.blamer_enabled = 1
-- 文字延迟提示的时间
vim.g.blamer_delay = 10
-- 允许在虚拟模式下运行gitLens
vim.g.blamer_show_in_visual_modes = 0
-- 允许在插入模式下运行gitLens
vim.g.blamer_show_in_insert_modes = 0
-- 在模板上添加的前缀
vim.g.blamer_prefix = ' 🐯 '
-- 显示的信息模板
-- 可选: <author>, <author-mail>, <author-time>,
-- <committer>, <committer-mail>, <committer-time>
--, <summary>, <commit-short>, <commit-long>
vim.g.blamer_template = 
[[提交人: <committer> 🍵提交时间: <committer-time> 🍵提交信息:<summary>]]
-- 日期格式: '%d/%m/%y %H:%M'
vim.g.blamer_date_format = '%Y-%m-%d %H:%M'
-- 高亮提交的信息
vim.cmd('highlight Blamer guifg=lightgrey')