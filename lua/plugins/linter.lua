require('lint').linters_by_ft = {
    python = {'pylint',},
    bitbake = {'oelint-adv',},
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
