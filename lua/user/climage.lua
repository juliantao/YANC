local status_ok, climage = pcall(require, "bufferline")
if not status_ok then
	return
end

climage.setup({
	default = {
		img_name = function()
			vim.fn.inputsave()
			local name = vim.fn.input("Name: ")
			vim.fn.inputrestore()
			return name
		end,
		affix = "![](%s)",
	},
})
