-- this breaks when plugins and other commands assume cmd.exe
-- if vim.fn.has("Win32") then
-- 	vim.opt.shell = "pwsh -NoLogo"
-- end

local Terminal = {}

local function create_term(terminal)
	vim.cmd("terminal")
	terminal.buf_id = vim.api.nvim_get_current_buf()
	terminal.term_id = vim.b.terminal_job_id
end

function Terminal.open_term()
	if not Terminal.buf_id or not Terminal.term_id then
		create_term(Terminal)
		vim.api.nvim_buf_set_option(Terminal.buf_id, "bufhidden", "hide")
	else
		vim.api.nvim_set_current_buf(Terminal.buf_id)
	end
end

function Terminal.send_cmd(cmd)
	if not Terminal.buf_id or not Terminal.term_id then
		create_term(Terminal)
	end

	if cmd then
		vim.api.nvim_chan_send(Terminal.term_id, cmd .. "\r\n")
	end
end

return Terminal
