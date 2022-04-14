---@class od.Autocmds
local autocmds = {}

---Delete the autocmds when the theme changes to something else
autocmds.on_colorscheme = function()
  if vim.g.colors_name ~= 'onedark' then
    vim.cmd('silent! autocmd! onedark')
    vim.cmd('silent! augroup! onedark')
  end
end

---@param config od.ConfigSchema
autocmds.viml_cmds = function(config)
  vim.cmd('augroup onedark')
  vim.cmd('autocmd!')
  vim.cmd('autocmd ColorScheme * lua require("onedark.util").on_colorscheme()')
  if config.dev then
    vim.cmd('autocmd BufWritePost */lua/onedark/** nested colorscheme onedark')
  end
  for _, sidebar in ipairs(config.sidebars) do
    if sidebar == 'terminal' then
      vim.cmd('autocmd TermOpen * setlocal winhighlight=Normal:NormalSB,SignColumn:SignColumnSB')
    else
      vim.cmd(string.format('autocmd FileType %s setlocal winhighlight=Normal:NormalSB,SignColumn:SignColumnSB', sidebar))
    end
  end
  vim.cmd('augroup end')
end

---@param config od.ConfigSchema
autocmds.native_cmds = function(config)
  local group = vim.api.nvim_create_augroup('onedark', { clear = false })

  -- Delete the onedark autocmds when the theme changes to something else
  vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = '*',
    group = group,
    callback = function()
      if vim.g.colors_name ~= 'onedark' then
        pcall(vim.api.nvim_del_augroup_by_id, group)
      end
    end,
  })

  if config.dev then
    -- Enables hot-reloading in onedark.
    vim.api.nvim_create_autocmd('BufWritePost', {
      pattern = '*/lua/onedark/**',
      nested = true,
      group = group,
      callback = function()
        vim.cmd('colorscheme onedark')
      end,
    })
  end

  local func_winhightlight = function()
    vim.wo.winhighlight = 'Normal:NormalSB,SignColumn:SignColumnSB'
  end

  for _, sidebar in ipairs(config.sidebars) do
    if sidebar == 'terminal' then
      -- Set dark color for terminal background.,
      vim.api.nvim_create_autocmd('TermOpen', {
        pattern = '*',
        group = group,
        callback = function()
          func_winhightlight()
        end,
      })
    else
      -- Set dark color for custom sidebars background.
      vim.api.nvim_create_autocmd('FileType', {
        pattern = sidebar,
        group = group,
        callback = function()
          func_winhightlight()
        end,
      })
    end
  end
end

---@param config od.ConfigSchema
autocmds.set = function(config)
  if vim.fn.has('nvim-0.7') == 1 then
    if not pcall(autocmds.native_cmds, config) then
      autocmds.viml_cmds(config)
    end
  else
    autocmds.viml_cmds(config)
  end
end

return autocmds
