return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
     ensure_installed = { "lua", "javascript", "python", "tsx", "css", "dockerfile", "html", "scss", "typescript" },
      highlighting = { enable = true },
      indent= { enable = true },
    })
  end
}
