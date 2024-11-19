vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- file list
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- center on navigation everywhere
vim.keymap.set("n", "J", "mzJ`z")                    -- single line

vim.keymap.set("n", "<C-d>", "<C-d>zz")              -- half page down
vim.keymap.set("n", "<C-u>", "<C-u>zz")              -- half page up

vim.keymap.set("n", "n", "nzzzv")                    -- next search hit
vim.keymap.set("n", "N", "Nzzzv")                    -- previous search hit

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")     -- next quickfix
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")     -- previous quickfix

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz") -- next location
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz") -- previous location

-- save to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<C-f>", vim.lsp.buf.format)

-- undo/redo remap
vim.keymap.set('n', 'u', 'u', { noremap = true, silent = true })
vim.keymap.set('n', 'U', '<C-r>', { noremap = true, silent = true })

-- treesitter
local builtin = require('telescope.builtin')

-- nvim-tree
vim.keymap.set('n', '<A-1>', function()
    local nvim_tree = require('nvim-tree.api')
    local current_buf = vim.api.nvim_get_current_buf()

    local is_tree = vim.bo[current_buf].filetype == 'NvimTree'

    if is_tree then
        -- in tree, hide and focus last window
        nvim_tree.tree.toggle()
    else
        -- not in tree, focus it
        nvim_tree.tree.focus()
    end
end, { silent = true, noremap = true })

vim.keymap.set('n', '<A-2>', function()
    local nvim_tree = require('nvim-tree.api')
    nvim_tree.tree.focus()
end, { silent = true, noremap = true })

-- find files
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>g', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
