naviscripts
===========

Some functions I use and a demo / example of making a `lua` `neovim` plugin.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "navicore/nvim-naviscripts",
  config = function()
    require("naviscripts").setup()
  end,
  cmd = "FormatRustFiles", -- Lazy-load on this command
}
```

## Usage

Run the following command in Neovim to format all Rust files:

```
:lua require("naviscripts").format_rust_files()
```
```

