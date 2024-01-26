return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader>re", ":Neotree filesystem reveal=true left<CR>", { desc = "[R]eveal tree [E]xplorer" })
    vim.keymap.set("n", "<leader>he", ":Neotree close filesystem left<CR>", { desc = "[H]ide tree [E]xplorer" })
  end
}
