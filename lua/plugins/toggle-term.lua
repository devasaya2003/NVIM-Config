return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      direction = "float",
      persist_mode = true,
      close_on_exit = false,
      auto_scroll = true,
      float_opts = {
        border = "rounded",
        width = 80,
        height = 20,
      },
    })

    vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>") -- Toggle terminal
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])             -- Exit terminal mode
  end,
}
