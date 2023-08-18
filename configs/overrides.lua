local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "cpp",
    "python",
    "html",
    "cmake",
    "gitignore",
    "css",
    "javascript",
    "json",
    "yaml",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
    "pyright",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}
M.cmp={
    mapping = {
      ["<C-e>"]=require("cmp").config.disable,
      ["<C-p>"]=require("cmp").config.disable,
      ["<Tab>"] = require("cmp").mapping(function(fallback)
        local cmp=require("cmp")
        if require("copilot.suggestion").is_visible() then
           require("copilot.suggestion").accept()
        elseif   cmp.visible() then
          cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        else
        fallback()
        end
       end, {
        "i",
      "s",
     }),
      -- use Up and down for cycling completion
      ["<Down>"] = require("cmp").mapping(function(fallback)
        local cmp = require "cmp"
        if cmp.visible() then
          cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<Up>"] = require("cmp").mapping(function(fallback)
        local cmp = require "cmp"
        if cmp.visible() then
          cmp.select_prev_item()
        elseif require("luasnip").jumpable(-1) then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
  }

--
-- M.copilot = {
--   -- Possible configurable fields can be found on:
--   -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
--   suggestion = {
--     enable = true,
--     auto_trigger = true,
--     keymap={
--       accept="<C-e>",
--     }
--     -- accept_word="<>", 
--   },
--   panel = {
--     enable = true,
--   },
-- }
return M
