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

M.copilot = {
  -- Possible configurable fields can be found on:
  -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
  suggestion = {
    enable = true,
    auto_trigger = true,
    keymap={
      accept="<C-e>",
    }
    -- accept_word="<>", 
  },
  panel = {
    enable = true,
  },
}
return M
