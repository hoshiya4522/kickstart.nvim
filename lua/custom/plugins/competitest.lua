-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'xeluxee/competitest.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    config = function()
      require('competitest').setup()

      vim.keymap.set('n', '<leader>pt', ':CompetiTest receive testcases<CR>', { desc = 'Com[p]etiTest recieve [t]estcases' })
      vim.keymap.set('n', '<leader>pr', ':CompetiTest run<CR>', { desc = 'Com[p]etiTest [r]un' })
    end,
  },
}
