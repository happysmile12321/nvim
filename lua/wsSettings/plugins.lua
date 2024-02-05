-- 保存plugins.lua自动更新安装软件
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

return require('packer').startup(
	{
		--注册插件
		function(use)
			-- 插件管理
			use { 'wbthomason/packer.nvim' }
			-- 主题
			-- use { 'sickill/vim-monokai', as = 'monokai' }
			use { 'folke/tokyonight.nvim' }
			-- LSP
			use { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'neovim/nvim-lspconfig' }
		        -- fuzzy file finder
		        use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
			-- 代码片段
			use { 'hrsh7th/nvim-cmp' }
			use { 'hrsh7th/cmp-nvim-lsp' }
			use { 'L3MON4D3/LuaSnip' } -- snippets引擎，不装这个自动补全会出问题
			use { 'saadparwaiz1/cmp_luasnip' }
			use { 'rafamadriz/friendly-snippets' }
			use { 'hrsh7th/cmp-path' } -- 文件路径
      use {'honza/vim-snippets'}
			-- buffer分割线
			use { 'akinsho/bufferline.nvim' }
			-- 注释
			use { 'numToStr/Comment.nvim' }
			-- 翻译
			use {
				'happysmile12321/Trans.nvim',
				run = 'bash ./install.sh',
				requires = 'kkharji/sqlite.lua',
			}
			-- 自动补全括号
			use { 'windwp/nvim-autopairs' }
			-- 代码自动补全，IDE like功能
			use { 'neoclide/coc.nvim', branch = 'release' }
			-- IDE增强 -> 代码折叠
			use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async', as = 'folding' }
			-- GitLens
			-- use {'APZelos/blamer.nvim', as = 'gitLens'}
			-- 底部状态栏
			-- use { 'glepnir/spaceline.vim' }
			use { 'nvim-lualine/lualine.nvim' }
			use { 'kyazdani42/nvim-web-devicons' }
			use {
				'svrana/neosolarized.nvim',
				requires = { 'tjdevries/colorbuddy.nvim' }
			}
			-- theme
			use { 'norcalli/nvim-colorizer.lua' }
			-- treesitter配置语法高亮
			use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
			-- treesitter配置可以迅速选择对象
			use { 'nvim-treesitter/nvim-treesitter-textobjects' }
			-- 代码智能提示 github copilot (收费)
			-- use { 'github/copilot.vim' }
			-- 不同括号不同颜色显示
			use { 'p00f/nvim-ts-rainbow' }
			-- 文档树(用于文件操作)
			use { 'nvim-tree/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons' }
			-- 使用Ctrl + hjkl 在不同窗口之间移动
			use { 'christoomey/vim-tmux-navigator' }
			-- html和css更好的补全
			use { 'leafgarland/typescript-vim' }
			use { 'joukevandermaas/vim-ember-hbs' }
			-- 全局文件、代码片段搜索
			use { 'nvim-lua/plenary.nvim' }
			use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { { 'nvim-lua/plenary.nvim' } } }
			-- 文件浏览器
			use { 'nvim-telescope/telescope-file-browser.nvim' }
			-- 项目切换管理
			-- chatgpt
			use({
				"jackMort/ChatGPT.nvim",
				config = function()
					require("chatgpt").setup({
						welcome_message = WELCOME_MESSAGE, -- set to "" if you don't like the fancy godot robot
						loading_text = "loading",
						question_sign = "", -- you can use emoji if you want e.g. 🙂
						answer_sign = "ﮧ", -- 🤖
						max_line_length = 120,
						yank_register = "+",
						chat_layout = {
							relative = "editor",
							position = "50%",
							size = {
								height = "80%",
								width = "80%",
							},
						},
						settings_window = {
							border = {
								style = "rounded",
								text = {
									top = " Settings ",
								},
							},
						},
						chat_window = {
							filetype = "chatgpt",
							border = {
								highlight = "FloatBorder",
								style = "rounded",
								text = {
									top = " ChatGPT ",
								},
							},
						},
						chat_input = {
							prompt = "  ",
							border = {
								highlight = "FloatBorder",
								style = "rounded",
								text = {
									top_align = "center",
									top = " Prompt ",
								},
							},
						},
						openai_params = {
							model = "text-davinci-003",
							frequency_penalty = 0,
							presence_penalty = 0,
							max_tokens = 300,
							temperature = 0,
							top_p = 1,
							n = 1,
						},
						openai_edit_params = {
							model = "code-davinci-edit-001",
							temperature = 0,
							top_p = 1,
							n = 1,
						},
						keymaps = {
							close = { "<Esc>" },
							yank_last = "<C-y>",
							scroll_up = "<C-u>",
							scroll_down = "<C-d>",
							toggle_settings = "<C-o>",
							new_session = "<C-n>",
							cycle_windows = "<Tab>",
						},
					})
				end,
				requires = {
					"MunifTanjim/nui.nvim",
					"nvim-lua/plenary.nvim",
					"nvim-telescope/telescope.nvim"
				}
			})
			-- neovim内置终端管理器(用于执行启动脚本)
			use {
				's1n7ax/nvim-terminal'
			}
      -- dart
      use {'dart-lang/dart-vim-plugin'}
			-- git集成
			use { 'kdheepak/lazygit.nvim' }
			-- 操作提示 whichkey
			use { "folke/which-key.nvim" }
		end,
		--配置插件
		config =
		{
			display =
			{
				open_fn = require('packer.util').float,
			}
		}
	}
)
