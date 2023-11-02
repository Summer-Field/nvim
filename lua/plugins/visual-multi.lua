return {
  "mg979/vim-visual-multi",
  config = function()
    vim.cmd([[
      let g:VM_leader                     = {'default': ',', 'visual': ',', 'buffer': ','}
      let g:VM_maps                       = {}
      " let g:VM_custom_motions             = {'N': '0', 'M': '$'}
      let g:VM_maps['Find Under']         = '<C-i>'
      let g:VM_maps['Find Subword Under'] = '<C-I>'
      let g:VM_maps['Find Next']          = 'n'
      let g:VM_maps['Find Prev']          = 'N'
      let g:VM_maps['Remove Region']      = 'Q'
      let g:VM_maps['Skip Region']        = 'q'
      let g:VM_maps["Redo"]               = '<C-r>'
    ]])
  end,
}
