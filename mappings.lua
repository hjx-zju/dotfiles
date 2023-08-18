---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-z>"]={ "ui", "undo" },
    ["<C-a>"]={ "ggVG", "select all" },
    ["<leader>re"]={"<cmd> lua require(\'custom/mappings\')<CR>","reload setting"}
  },
  i={
    ["<C-a>"]={ "<ESC>ggVG", "select all" },
    ["<C-z>"]={ "<ESC>ui", "undo" },
    ["<C-s>"]={"<ESC>:w<CR>i","save"},
    ["<C-v>"]={"<ESC>pi","paste"},
    ["<S-TAB>"]={"<C-d>","un tab"},
    ["<C-x>"]={"<ESC>ddi","delete line"},
    -- echo hello
  },
  v={
    ["<C-c>"]={"y","copy"},
    ["<C-x>"]={"di","delete select "},
    ["<C-/>"]={"<leader>/"  ,"comment"},
    ["<C-a>"]={"<ESC>ggVG","select all"},
    
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
M.telescope={
  plugin=true,
  n={
    ["<C-p>"]= { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<C-S-f>"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<C-f>"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<leader>tk"]={"<cmd> Telescope keymaps<CR>","open keymaps"},
  }
  
}

return M
