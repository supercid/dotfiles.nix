local telescope = require("telescope")

telescope.setup({
  -- XXX: using dropdown and ascending to avoid
  -- https://github.com/nvim-telescope/telescope.nvim/issues/2667
  defaults = require("telescope.themes").get_dropdown({
    sorting_strategy = "ascending",
    prompt_prefix = "   ",
    selection_caret = " ❯ ",
    entry_prefix = "   ",
    multi_icon = "+ ",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!.git",
    },
  }),
})

telescope.load_extension("gh")
telescope.load_extension("harpoon")
telescope.load_extension("dap")
telescope.load_extension("zk")

local opts = { noremap = true, silent = true }
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", function()
  builtin.find_files({
    find_command = { "rg", "--hidden", "--files", "--smart-case", "--glob=!.git" },
  })
end, opts)
vim.keymap.set("n", "<leader>of", builtin.oldfiles, opts)
vim.keymap.set("n", "<leader>lg", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>fc", builtin.commands, opts)
vim.keymap.set("n", "<leader>fr", builtin.resume, opts)
vim.keymap.set("n", "<leader>fq", builtin.quickfix, opts)
vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, opts)
vim.keymap.set("n", "<leader>xx", builtin.diagnostics, opts)
vim.keymap.set("n", "<leader>ghi", telescope.extensions.gh.issues, opts)
vim.keymap.set("n", "<leader>fj", telescope.extensions.harpoon.marks, opts)
vim.keymap.set("n", "<leader>fn", telescope.extensions.zk.notes, opts)
