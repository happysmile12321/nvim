--模块化工具函数
local utils = {}
utils.basicConfigWorkSpacePath = 'wsSettings'
utils.home = os.getenv("HOME")
utils.basicConfigWorkSpacePathAbsolutePath = utils.home .. '/.config/nvim/lua/' .. utils.basicConfigWorkSpacePath
utils.desp = '用于复用lua的一些辅助工具函数'
--desp:遍历制定目录下所有lua文件.因为lua的项目中所有文件都是lua
--return:给定目录下所有lua文件的相对路径集合
function utils.path_files(path)
	local a = io.popen("ls " .. path);
	local f = {};
	for l in a:lines() do
		table.insert(f, string.sub(l, 0, -5))
	end
	a:close()
	return f
end

--desp:注册工作空间
function utils.register_work_space()
	--工作空间设置
	--自动注册工作空间下所有的模块(确保只有一级,且只能有lua文件)
	local settingItems = utils.path_files(utils.basicConfigWorkSpacePathAbsolutePath)
	for i, name in ipairs(settingItems) do
		require(utils.basicConfigWorkSpacePath .. '/' .. name)
	end
end

--desp:安装nvim的插件管理
function utils.install_plugin_manager()
	local ensure_packer = function()
		local fn = vim.fn
		local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
		if fn.empty(fn.glob(install_path)) > 0 then
			fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
			vim.cmd [[packadd packer.nvim]]
			return true
		end
		return false
	end

	local packer_bootstrap = ensure_packer()
	return require('packer').startup(function(use)
		use 'wbthomason/packer.nvim'
		if packer_bootstrap then
			require('packer').sync()
		end
	end)
end

return utils
