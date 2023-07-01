-- Specify your nvim latex previewer, I use Skim
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_view_skim_activate = 1
vim.g.vimtex_view_skim_reading_bar = 1

-- this is the lua function to auto save the nvim servername
-- then use it for inverse search from pdf to tex file

-- This following block is not needed any more, instead
-- follow the help document on Vimtex. 
-- For skim Pdf-Tex sync support, use the following
-- viewer: custom
-- command: nvim
-- Arg: --headless -c "VimtexInverseSearch %line '%file'"
-- local function SetServerName()
-- 	local nvim_sever_file = ''
-- 	if vim.fn.has('win32') ~= 0 then
-- 		if os.getenv("TEMP") ~= nil then
-- 			nvim_server_file = os.getenv("TEMP").."/nvim_server_f_tex.txt"
-- 		else
-- 			nvim_server_file = "/nvim_server_f_tex.txt"
-- 		end
-- 	else
-- 		nvim_server_file = "/tmp/nvim_server_f_tex.txt"
-- 	end
-- 	-- execute the echo cmd to log the servername
-- 	os.execute("rm -f "..nvim_server_file)
-- 	local name = vim.api.nvim_get_vvar("servername")
-- 	os.execute("echo "..name.." >> "..nvim_server_file)
-- end
--
-- vim.api.nvim_create_autocmd(
-- 	"FileType", 
-- 	{
-- 		pattern = "tex",
-- 		callback = SetServerName,
-- 	}
-- )
