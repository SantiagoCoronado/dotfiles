return {
  "MoulatiMehdi/42norm.nvim",
  ft = { "c", "cpp" },
  config = function()
    local norm = require("42norm")

    norm.setup({
      header_on_save = false,
      format_on_save = false,
      liner_on_change = false,
    })

    -- Press "F5" key to run the norminette
    vim.keymap.set("n", "<F5>", function()
      norm.check_norms()
    end, { desc = "Update 42norms diagnostics", noremap = true, silent = true })

    vim.keymap.set("n", "<F6>", function()
      norm.format()
    end, { desc = "Format buffer on 42norms", noremap = true, silent = true })

    vim.keymap.set("n", "<leader>ch", function()
      norm.stdheader()
    end, { desc = "Insert 42header", noremap = true, silent = true })

    -- Clear diagnostics
    vim.keymap.set("n", "<F7>", function()
      vim.diagnostic.reset()
    end, { desc = "Clear all diagnostics", noremap = true, silent = true })

    -- Commands
    vim.api.nvim_create_user_command("Norminette", function()
      norm.check_norms()
    end, {})
    vim.api.nvim_create_user_command("Format", function()
      norm.format()
    end, {})
    vim.api.nvim_create_user_command("Stdheader", function()
      norm.stdheader()
    end, {})
  end,
}
