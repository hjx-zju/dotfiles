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
  }
}

-- more keybinds!

return M
