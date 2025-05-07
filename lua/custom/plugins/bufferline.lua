return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'echasnovski/mini.nvim',
  config = function()
    require('bufferline').setup()
  end,
}
