local M = {}

function M.open_term()
	if not M.buf_id or not M.term_id then
		vim.cmd("terminal")
		M.buf_id = vim.api.nvim_get_current_buf()
		M.term_id = vim.b.terminal_job_id
		vim.api.nvim_buf_set_option(M.buf_id, "bufhidden", "hide")
	else
		vim.api.nvim_set_current_buf(M.buf_id)
	end
end

return M
