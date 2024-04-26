vnoremap <C-S-C> "+y
" inoremap <C-S-V> <C-r>+
set clipboard=unnamed
" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk

exmap nextTab obcommand workspace:next-tab
exmap prevTab obcommand workspace:previous-tab
nmap L :nextTab
nmap H :prevTab
