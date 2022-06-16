vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]]

vim.api.nvim_create_autocmd("BufWinEnter,BufNewFile,BufRead", {
	pattern = { "*.qmd" },
	command = "set ft=pandoc.quarto",
})
vim.api.nvim_create_autocmd("Filetype", {
	pattern = { "python" },
	command = "map <buffer> <leader>bb :TermExec cmd='python3 %'<CR> <C-t>",
})
vim.api.nvim_create_autocmd("Filetype", {
	pattern = { "mermaid" },
	command = "map <buffer> <leader>bb :TermExec cmd='mmdc -i % -o $(basename % .mmd).pdf -f\\|gopen $(basename % .mmd).pdf'<CR> <C-t>",
})
vim.api.nvim_create_autocmd("Filetype", {
	pattern = { "quarto", "rmd", "Rmd", "qmd", "rmarkdown", "markdown", "md", "ipynb", "vimwiki" },
	command = "cd .",
})
vim.api.nvim_create_autocmd("Filetype", {
	pattern = { "quarto", "rmd", "Rmd", "qmd", "rmarkdown", "markdown", "md", "ipynb", "vimwiki" },
	command = "map <buffer> <leader>bb :TermExec cmd='quarto render %'<CR> <C-t>",
})
vim.api.nvim_create_autocmd("Filetype", {
	pattern = { "quarto", "rmd", "Rmd", "qmd", "rmarkdown", "markdown", "md", "ipynb", "vimwiki" },
	command = "map <buffer> <leader>qq :TermExec cmd='quarto preview %'<CR> <C-t>",
})
--Utilies

vim.cmd("source " .. "$HOME/.config/nvim/utilis.vim")

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
