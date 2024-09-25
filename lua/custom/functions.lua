-- [[ Function for competitive programming ]]
local function jump_to_solve()
  -- Get the current file name
  local file_name = vim.fn.expand '%:t'

  -- Check if the file is 'main.cxx'
  if file_name == 'main.cxx' then
    -- Search for the solve function
    local search_result = vim.fn.search('void solve()', 'nw')

    -- If the function is found
    if search_result ~= 0 then
      vim.cmd('normal! ' .. search_result .. 'G')
      vim.cmd 'normal! $'
      vim.cmd 'normal! %'
      -- vim.cmd 'normal! O'
    end
  end
end

-- Create an autocmd to call the function when opening files
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*.cxx',
  callback = jump_to_solve,
})

local io_files_open = false
local main_id

-- Function to toggle the visibility of the input/output windows
function ToggleSplitter()
  local current_win_id = vim.fn.win_getid()

  if io_files_open then
    -- Close the input/output windows and focus back on the main window
    vim.api.nvim_set_current_win(main_id)
    vim.cmd 'only'
    io_files_open = false
  else
    -- Save the current window ID
    main_id = current_win_id

    -- Open the input/output windows
    vim.cmd 'vsp a.in'
    vim.cmd 'sp a.out'
    vim.cmd 'wincmd p' -- Focus on the input file

    io_files_open = true
  end
end

-- Function to compile and run the current file
function CompileAndRun()
  -- Ensure the main window is focused if io files are open
  if io_files_open and main_id then
    vim.api.nvim_set_current_win(main_id)
  end

  -- Ensure input/output windows are visible before compiling
  if not io_files_open then
    ToggleSplitter()
  end

  -- Compile and run the file
  local filename = vim.fn.expand '%:t:r'
  local compile_command = 'g++ -std=c++17 -O2 -Wall -Wextra -Wshadow -fsanitize=address -fsanitize=undefined -DLocal '
    .. filename
    .. '.cxx -o '
    .. filename
    .. " && echo '--- Compiled ---' || echo '--- Build Failed ---' && exit 1"

  -- Run the compile command
  vim.cmd('!' .. compile_command)
  vim.cmd('!timeout 4 ./' .. filename .. ' || echo "Time Limit Exceeded"')
  -- print '--- Compiled ---'
end

-- Key mappings for compiling and toggling windows
vim.keymap.set('i', '<F5>', '<ESC>:lua CompileAndRun()<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<F6>', '<ESC>:lua ToggleSplitter()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F5>', ':lua CompileAndRun()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<F6>', ':lua ToggleSplitter()<CR>', { noremap = true, silent = true })
