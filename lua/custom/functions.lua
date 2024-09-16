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
      vim.cmd 'normal! O'
    end
  end
end

-- Create an autocmd to call the function when opening files
vim.api.nvim_create_autocmd('BufReadPost', {
  pattern = '*.cxx',
  callback = jump_to_solve,
})
