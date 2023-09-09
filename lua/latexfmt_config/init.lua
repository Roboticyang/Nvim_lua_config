vim.g.latexfmg_no_join_any = {
	'\\(\\\\)\\@1<!%', '\\begin', '\\end', '\\section', '\\subsection',
	'\\subsubsection', '\\document', '\\(\\\\)\\@1<!\\[', '\\]'
}

vim.g.latexfmt_no_join_prev = { '\\item' } 

vim.g.latexfmt_verbatim_envs = {
	'equation', 'align', 'align*', 'eqnarray', '\\(\\\\)\\@1<!\\['
}

