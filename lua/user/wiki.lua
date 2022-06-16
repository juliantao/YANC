vim.g.vimwiki_list = {
  {
    path = "~/Dropbox (ASU)/wiki",
    syntax = "markdown",
    diary_header = "Journal",
    auto_diary_index = 1,
    auto_generate_links = 1,
    auto_generate_tags = 1,
    ext = ".qmd",
  },
}
vim.g.vimwiki_commentstring = "<!--%s-->"
vim.g.vimwiki_folding = ""
vim.g.vimwiki_conceallevel = 0
vim.g.vimwiki_markdown_link_ext = 1
vim.g.vimwiki_filetypes = { "quarto" }
vim.g.vimwiki_key_mappings = { table_mappings = 0, lists_return = 1 }
vim.g.vimwiki_global_ext = 0

-- vim.g.taskwiki_disable = true
vim.g.taskwiki_dont_preserve_folds = "yes"
vim.g.taskwiki_disable_concealcursor = "yes"
vim.g.taskwiki_maplocalleader = ",t"
