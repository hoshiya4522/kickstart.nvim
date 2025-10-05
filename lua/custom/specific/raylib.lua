-- Only load this for C files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'c',
  callback = function()
    vim.keymap.set('n', '<F5>', function()
      local file = vim.fn.expand '%:p' -- full path to current file
      local output = vim.fn.expand '%:r' -- filename without extension

      -- gcc compile command with raylib + linux deps
      local compile_cmd = string.format('gcc %s -o %s -lraylib -lm -ldl -lpthread -lGL -lX11 -lXrandr -lXi -lXinerama -lXcursor -lXxf86vm', file, output)

      -- Run inside a new Alacritty window
      local run_cmd =
        string.format('alacritty -e bash -c \'%s && ./%s; echo; echo "[Process exited] Press any key to close..."; read -n 1\'', compile_cmd, output)

      -- Execute
      vim.fn.jobstart(run_cmd, { detach = true })
    end, { buffer = true, noremap = true, silent = true })
  end,
})
