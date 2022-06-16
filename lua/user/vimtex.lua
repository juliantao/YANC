local status_ok, vimtex = pcall(require, "vimtex")
if not status_ok then
	return
end

vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_complier_progname = "nvr"
vim.g.vimtex_fold_enabled = 0
vim.g.vimtex_view_forward_search_on_start = 1
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 3
vim.g.vimtex_imaps_enabled = 1
vim.g.vimtex_complete_img_use_tail = 1
vim.g.vimtex_complete_bib = {
  simple = 1,
  menu_fmt = "@year, @author_short, @title",
}
vim.g.vimtex_echo_verbose_input = 0
vim.cmd(
  [[
  augroup vimtex_event_1
      au!
      au User VimtexEventQuit     call vimtex#compiler#clean(0)
  augroup END
  ]],
  false
)
vim.cmd(
  [[
  function! CloseViewers()
    if executable('xdotool') && exists('b:vimtex')
        \ && exists('b:vimtex.viewer') && b:vimtex.viewer.xwin_id > 0
      call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
    endif
  endfunction

  augroup vimtex_event_2
    au!
    au User VimtexEventQuit call CloseViewers()
  augroup END
  ]],
  false
)
