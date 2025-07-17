return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "clangd",
          "dockerls",
          "eslint",
          "html",
          "jsonls",
          "prismals",
          "ts_ls",
          "cssls",
          "tailwindcss",
          "sqlls",
          "pyright",
          "marksman",
          "lemminx",
          "yamlls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      local lspconfig = require("lspconfig")

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = { source = "always" },
      })

      -- Function to setup LSP
      local on_attach = function(client, bufnr)
        -- Keymaps for LSP actions
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr })
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = bufnr })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
      end

      -- Setup LSP servers
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.dockerls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.eslint.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.html.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.jsonls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.prismals.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.cssls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.sqlls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.marksman.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.lemminx.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconfig.yamlls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },
}
