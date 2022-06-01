local status_ok, comment = pcall(require, "comment")
if not status_ok then
	return
end

comment.setup({
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
    },
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },
    extra = {
        above = 'gcO',
        below = 'gco',
        eol = 'gcA',
    },
    mappings = {
        basic = true,
        extra = true,
        extended = false,
    },
    pre_hook = nil,
    post_hook = nil,
})
