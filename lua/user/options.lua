local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  colorcolumn = "80",
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "nv",                            -- allow the mouse to be used in neovim in normal and visual mode only
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = false,                      -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 100,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  laststatus = 3,                          -- always and ONLY the last window
  showcmd = false,                         -- show (partial) command in the last line of the screen
  ruler = false,                           -- show the line and column number of the cursor position
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 2,                         -- set number column width to 2 {default 4}
  signcolumn = "auto",                     -- only show the sign column when need to
  textwidth = 79,                          -- set a text limit column
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- minimal number of screen lines to keep above and below
  sidescrolloff = 8,                       -- minimal number of screen lines to keep left and right
  title = false,                           -- set window's title
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.opt.fillchars = { eob = " " }
-- vim.opt.fillchars = vim.opt.fillchars + "vertleft: "
-- vim.opt.fillchars = vim.opt.fillchars + "vertright: "
vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append {
  stl = " ",
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end


vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
vim.cmd [[set cpoptions+=$]] -- show dollar sign at end of text to be changed

-- Arrow keys are unacceptable
vim.cmd [[ 
  nnoremap <up>     <nop>
  nnoremap <down>   <nop>
  nnoremap <left>   <nop>
  nnoremap <right>  <nop>
  inoremap <up>     <nop>
  inoremap <down>   <nop>
  inoremap <left>   <nop>
  inoremap <right>  <nop>
]]

vim.filetype.add {
  extension = {
    conf = "dosini",
  },
}
