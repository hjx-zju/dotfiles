---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-z>"]={ "ui", "undo" },
    ["<C-a>"]={ "ggVG", "select all" },
    ["<leader>re"]={":luafile $MYVIMRC<CR>","reload setting"}
  },
  i={
    ["<C-a>"]={ "<ESC>ggVG", "select all" },
    ["<C-z>"]={ "<ESC>ui", "undo" },
    ["<C-s>"]={"<ESC>:w<CR>i","save"},
    ["<C-v>"]={"<ESC>pi","paste"},
    -- echo hello workspaceFolders
     
  

    
    
  }
}
-- M.copilot={
--   mode_opts = { expr = true },
--   i = {
--     ["<C-e>"] = { 'copilot#Accept("<CR>")', "copilot accept" },
--   },
--
-- }
  -- more keybinds!

return M
