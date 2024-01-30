return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "pyright",
          "cssls",
          "tailwindcss",
        }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.tsserver.setup({})
      lspconfig.pyright.setup({
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              typeCheckingMode = "off",
            }
          }
        }
      })
      lspconfig.cssls.setup({})
      lspconfig.tailwindcss.setup({})

      -- Basic keymap for LSP
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover Document" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: [G]o to [D]efinition" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction" })
    end
  },
}
