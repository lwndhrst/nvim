local autocmd = vim.api.nvim_create_autocmd

-- autocmd("TermOpen", {
-- 	command = "setlocal nonumber norelativenumber",
-- })

-- only for uni computer graphics exercise
-- autocmd({ "BufRead", "BufEnter" }, {
-- 	pattern = {
-- 		"/home/leon/Projects/cg1-exercise/**/*.cpp",
-- 		"/home/leon/Projects/cg1-exercise/**/*.h",
-- 	},
-- 	callback = function()
-- 		vim.bo.tabstop = 4
-- 		vim.bo.shiftwidth = 4
-- 		vim.bo.expandtab = false
-- 	end,
-- })
