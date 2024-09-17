return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    -- 'echasnovski/mini.icons',
  },

  config = function()
    local alpha = require 'alpha'
    local asciiArt = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }

    --    For startify theme
    --    local dashboard = require 'alpha.themes.startify'
    --    For dashboard theme
    --    local dashboard = require 'alpha.themes.dashboard'
    --
    --    dashboard.section.header.val = asciiArt
    --    alpha.setup(dashboard.opts)

    -- For theta theme
    local dashboard = require 'alpha.themes.theta'
    dashboard.header.val = asciiArt
    alpha.setup(dashboard.config)
  end,
}
