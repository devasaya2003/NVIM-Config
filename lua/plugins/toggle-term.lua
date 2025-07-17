return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      size = 15,
      direction = "horizontal",
      close_on_exit = false,
      persist_mode = true,
      auto_scroll = true,
      float_opts = {
        border = "rounded",
        width = function() return math.floor(vim.o.columns * 0.8) end,
        height = function() return math.floor(vim.o.lines * 0.8) end,
      },
    })

    local Terminal = require("toggleterm.terminal").Terminal
    local project_root = vim.fn.getcwd()

    local terminals = {
      main = Terminal:new({ direction = "horizontal", dir = project_root }),
      git = Terminal:new({ direction = "horizontal", hidden = true, dir = project_root }),
      runner = Terminal:new({ direction = "horizontal", hidden = true, dir = project_root })
    }

    vim.keymap.set("n", "<leader>tt", function() terminals.main:toggle() end) -- Toggle main terminal
    vim.keymap.set("n", "<leader>tg", function() terminals.git:toggle() end) -- Toggle git terminal
    vim.keymap.set("n", "<leader>tr", function() terminals.runner:toggle() end) -- Toggle runner terminal
    vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]]) -- Exit terminal mode
  end
}
