-- leader -> ANSI keyboard w/ QWERTY
-- bs -> ZSA Voyager w/ Colemak DH
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")
vim.keymap.set("n", "<c-h>", "<c-w><c-h>", { desc = "move focus to the left window" })
vim.keymap.set("n", "<c-l>", "<c-w><c-l>", { desc = "move focus to the right window" })
vim.keymap.set("n", "<c-j>", "<c-w><c-j>", { desc = "move focus to the lower window" })
vim.keymap.set("n", "<c-k>", "<c-w><c-k>", { desc = "move focus to the upper window" })

-- Center while moving vertically
vim.keymap.set("n", "n", "nzzzv", { noremap = true })
vim.keymap.set("n", "gg", "ggzz", { noremap = true })
vim.keymap.set("n", "<c-d>", "<c-d>zz", { noremap = true })
vim.keymap.set("n", "<c-u>", "<c-u>zz", { noremap = true })
vim.keymap.set("n", "<c-o>", "<c-o>zz", { noremap = true })
vim.keymap.set("n", "<c-i>", "<c-i>zz", { noremap = true })
vim.keymap.set("n", "{", "{zz", { noremap = true })
vim.keymap.set("n", "}", "}zz", { noremap = true })

vim.keymap.set("n", "<bs>w", ":up<CR>", { noremap = true })
vim.keymap.set("n", "<leader>w", ":up<CR>", { noremap = true })
vim.keymap.set("n", "<bs>q", ":q<CR>", { noremap = true })
vim.keymap.set("n", "<leader>q", ":q<CR>", { noremap = true })
vim.keymap.set("n", "<bs><Tab>", ":b#<CR>", { silent = true, desc = "Switch to alternate buffer" })
vim.keymap.set("n", "<leader><Tab>", ":b#<CR>", { silent = true, desc = "Switch to alternate buffer" })
vim.keymap.set("n", "<bs>d", ":bd<CR>", { silent = true, desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>d", ":bd<CR>", { silent = true, desc = "Delete current buffer" })
vim.keymap.set("n", "go", "<C-]>zz", { noremap = true, desc = "Go to definition (Cmd+])" })

local alt_arrow_keys = {
  up = { "<A-Up>", "<A-k>" },
  down = { "<A-Down>", "<A-j>" },
}

-- Normal mode mappings
for _, key in ipairs(alt_arrow_keys.up) do
  vim.keymap.set("n", key, ":m .-2<CR>==", { desc = "Move line up", silent = true })
end

for _, key in ipairs(alt_arrow_keys.down) do
  vim.keymap.set("n", key, ":m .+1<CR>==", { desc = "Move line down", silent = true })
end

-- Visual mode mappings
for _, key in ipairs(alt_arrow_keys.up) do
  vim.keymap.set("v", key, ":m '<-2<CR>gv=gv", { desc = "Move selected lines up", silent = true })
end

for _, key in ipairs(alt_arrow_keys.down) do
  vim.keymap.set("v", key, ":m '>+1<CR>gv=gv", { desc = "Move selected lines down", silent = true })
end
