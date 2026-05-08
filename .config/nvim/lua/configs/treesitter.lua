-- lua/configs/treesitter.lua
local options = {
  ensure_installed = {
    "vim", "lua", "rust", "cpp", "python", "bash",
  },
  highlight = {
    enable = true,
  },
}

return options
