-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'ThePrimeagen/harpoon',
    config = function()
      require('harpoon').setup()
      require('telescope').load_extension 'harpoon'

      -- Define keybinds for Harpoon
      local mark = require 'harpoon.mark'
      local ui = require 'harpoon.ui'

      -- Add a file to the Harpoon list
      vim.keymap.set('n', '<leader>a', mark.add_file, { desc = 'Harpoon Add File' })

      -- Toggle the Harpoon menu
      vim.keymap.set('n', '<leader>e', ui.toggle_quick_menu, { desc = 'Harpoon Menu' })

      -- Navigate to the first, second, third, and fourth file
      -- asdf because it's the left hand home row.
      vim.keymap.set('n', '<C-a>', function()
        ui.nav_file(1)
      end, { desc = 'Harpoon Go to File 1' })
      vim.keymap.set('n', '<C-s>', function()
        ui.nav_file(2)
      end, { desc = 'Harpoon Go to File 2' })
      vim.keymap.set('n', '<C-d>', function()
        ui.nav_file(3)
      end, { desc = 'Harpoon Go to File 3' })
      vim.keymap.set('n', '<C-f>', function()
        ui.nav_file(4)
      end, { desc = 'Harpoon Go to File 4' })
    end,
  },
}
