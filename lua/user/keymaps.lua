M = {}
local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Tabs --
keymap("n", "<M-t>", ":tabnew<cr>", opts)
keymap("n", "<M-c>", ":tabclose<cr>", opts)
keymap("n", "<M-\\>", ":tabonly<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- keymap("n", "n", "nzzzv", opts)
-- keymap("n", "N", "Nzzzv", opts)

-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Custom
keymap("n", "<esc><esc>", "<cmd>nohlsearch<cr>", opts)
-- NOTE: the fact that tab and ctrl-i are the same is stupid
-- keymap("n", "<TAB>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "Q", "<cmd>Bdelete!<CR>", opts)
keymap("n", "<F1>", ":e ~/Notes/<cr>", opts)
keymap("n", "<F3>", ":e .<cr>", opts)
keymap("n", "<F4>", "<cmd>Telescope resume<cr>", opts)
keymap("n", "<F5>", "<cmd>Telescope commands<CR>", opts)
keymap(
  "n",
  "<F6>",
  [[:echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>]],
  opts
)
keymap("n", "<F11>", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<F12>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("v", "//", [[y/\V<c-R>=escape(@",'/\')<CR><CR>]], opts)
keymap(
  "n",
  "<C-p>",
  "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<CR>",
  opts
)
vim.api.nvim_set_keymap("n", "<M-g>", "<cmd>Telescope git_branches<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<C-h>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
vim.api.nvim_set_keymap(
  "n",
  "<Tab>",
  "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>",
  opts
)
vim.api.nvim_set_keymap(
  "n",
  "<S-Tab>",
  "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>",
  opts
)
-- keymap("n", "<C-h>", "<cmd>Telescope projects<CR>", opts)
keymap("n", "<C-t>", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
keymap("n", "<C-s>", "<cmd>vsplit<CR>", opts)
keymap("n", "<C-z>", "<cmd>ZenMode<CR>", opts)
keymap("n", "<C-n>", ":e ~/Notes/<CR>", opts)
keymap("n", "-", ":lua require'lir.float'.toggle()<CR>", opts)
-- keymap("n", "<C-\\>", "<cmd>vsplit<CR>", opts)
-- vim.cmd[[nnoremap c* /\<<c-R>=expand('<cword>')<CR>\>\c<CR>``cgn]]
-- vim.cmd[[nnoremap c# ?\<<c-R>=expand('<cword>')<CR>\>\c<CR>``cgN]]
-- keymap("n", "c*", [[/\<<c-R>=expand('<cword>')<CR>\>\c<CR>``cgn]], opts)
-- keymap("n", "c#", [[?\<<c-R>=expand('<cword>')<CR>\>\c<CR>``cgN]], opts)
-- keymap("n", "gx", [[:execute '!brave ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)
keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)
-- Change '<CR>' to whatever shortcut you like :)
vim.api.nvim_set_keymap("n", "<CR>", "<cmd>NeoZoomToggle<CR>", { noremap = true, silent = true, nowait = true })
vim.api.nvim_set_keymap("n", "=", "<cmd>JABSOpen<CR>", { noremap = true, silent = true, nowait = true })

-- alt binds
keymap("n", "<M-s>", "<cmd>split<cr>", opts)
keymap("n", "<M-v>", "<cmd>vsplit<cr>", opts)
-- keymap("n", "<M-q>", "<cmd>:q<cr>", opts)

M.show_documentation = function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand "<cword>")
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand "<cword>")
  elseif vim.fn.expand "%:t" == "Cargo.toml" then
    require("crates").show_popup()
  else
    vim.lsp.buf.hover()
  end
end
vim.api.nvim_set_keymap("n", "K", ":lua require('user.keymaps').show_documentation()<CR>", opts)

vim.cmd [[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]]
keymap("n", "<m-q>", ":call QuickFixToggle()<cr>", opts)

-- Comment
keymap("n", "<M-/>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<M-/>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

return M
