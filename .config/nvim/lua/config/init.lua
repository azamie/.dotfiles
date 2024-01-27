local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Detect tabstop and shiftwidth automatically
	'tpope/vim-sleuth',

	-- "gc" to comment visual regions/lines
	{ 'numToStr/Comment.nvim', opts = {} },

	{ import = 'plugins' },
})

local modules = {
	"config.autocmds",
	"config.options",
	"config.keymaps",
	"config.custom",
}

for _, mod in ipairs(modules) do
	local ok, err = pcall(require, mod)
	-- config.custom may be empty. It's a optional module
	if not ok and not mod == "config/custom" then
		error(("Error loading %s...\n\n%s"):format(mod, err))
	end
end
