naviscripts
===========

Some functions I use and a demo / example of making a `lua` `neovim` plugin.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "your-username/naviscripts",
  config = function()
    require("naviscripts")
  end
}
```

## Usage

Run the following command in Neovim to format all Rust files:

```
:lua require("naviscripts").format_rust_files()
```
```

