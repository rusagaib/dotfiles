return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "jay-babu/mason-nvim-dap.nvim",
    "nvim-telescope/telescope-dap.nvim",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    require("mason-nvim-dap").setup({
        ensure_installed = { "php", "python", "node2" }, -- see list on Mason DAP
        automatic_installation = true,
    })

    local dap = require("dap")

    -- PHP (Xdebug)
    dap.adapters.php = {
        type = "executable",
        command = "php-debug-adapter",
    }

    dap.configurations.php = {
        {
            type = "php",
            request = "launch",
            name = "Listen for Xdebug",
            port = 9003,
            -- pathMappings = {
            --     ["/var/www/phpwebapps"] = vim.fn.getcwd(),  -- path to dir project (optional)
            -- }
        },
    }

    -- js
    dap.adapters.node2 = {
        type = "executable",
        command = "node",
        args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" }
    }

    dap.configurations.javascript = {
        {
            type = "node2",
            request = "launch",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
        },
    }

    -- python 
    dap.adapters.python = {
        type = "executable",
        command = os.getenv("HOME") .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python",
        args = { "-m", "debugpy.adapter" }
    }

    dap.configurations.python = {
        {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            pythonPath = function()
                return "/usr/bin/python3"
            end,
        },
    }

    require("dapui").setup()

    -- keymaps dap
    vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end)
    vim.keymap.set("n", "<F5>", function() require("dap").continue() end)
    vim.keymap.set("n", "<F10>", function() require("dap").step_over() end)
    vim.keymap.set("n", "<F11>", function() require("dap").step_into() end)
    vim.keymap.set("n", "<F12>", function() require("dap").step_out() end)
    vim.keymap.set("n", "<Leader>db", function() require("dap").toggle_breakpoint() end)
    vim.keymap.set("n", "<Leader>dr", function() require("dap").repl.open() end)
  end
}
