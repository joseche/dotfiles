local function get_python()
	local python_path = "/usr/bin/python"
	local virtualenv = vim.fn.getenv("VIRTUAL_ENV")
	if virtualenv ~= vim.NIL and virtualenv ~= "" then
		python_path = virtualenv .. "/bin/python"
	end

	return python_path
end

return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap-python",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		require("dapui").setup()
		local dap = require("dap")
        require("nvim-dap-virtual-text").setup()


		dap.adapters.python = {
			type = "executable",
			command = get_python(),
			args = { "-m", "debugpy.adapter" },
		}

		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				pythonPath = get_python(),
			},
		}
	end,
}
