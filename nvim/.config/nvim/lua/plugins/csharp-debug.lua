return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            -- Add nvim-nio as a dependency
            "nvim-neotest/nvim-nio",

            -- DAP UI components
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Configure .NET debugger
            dap.adapters.coreclr = {
                type = "executable",
                command = vim.fn.stdpath("data") .. "/mason/bin/netcoredbg",
                args = { "--interpreter=vscode" },
            }

            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "Launch Colony Survival",
                    request = "launch",
                    program = function()
                        return vim.fn.input(
                            "Path to Colony Survival executable: ",
                            vim.fn.expand("~/.steam/steam/steamapps/common/Colony Survival/colonyserver"),
                            "file"
                        )
                    end,
                },
                {
                    type = "coreclr",
                    name = "Attach to Colony Survival",
                    request = "attach",
                    processId = require("dap.utils").pick_process,
                },
            }

            -- Setup DAP UI
            dapui.setup()

            -- Setup virtual text (shows variable values inline)
            require("nvim-dap-virtual-text").setup()

            -- Auto-open/close DAP UI when debugging starts/ends
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end,
        keys = {
            {
                "<F5>",
                function()
                    require("dap").continue()
                end,
                desc = "Debug: Start/Continue",
            },
            {
                "<F10>",
                function()
                    require("dap").step_over()
                end,
                desc = "Debug: Step Over",
            },
            {
                "<F11>",
                function()
                    require("dap").step_into()
                end,
                desc = "Debug: Step Into",
            },
            {
                "<F12>",
                function()
                    require("dap").step_out()
                end,
                desc = "Debug: Step Out",
            },
            {
                "<leader>db",
                function()
                    require("dap").toggle_breakpoint()
                end,
                desc = "Debug: Toggle Breakpoint",
            },
            {
                "<leader>dB",
                function()
                    require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
                end,
                desc = "Debug: Conditional Breakpoint",
            },
            {
                "<leader>dr",
                function()
                    require("dap").repl.open()
                end,
                desc = "Debug: Open REPL",
            },
            {
                "<leader>dl",
                function()
                    require("dap").run_last()
                end,
                desc = "Debug: Run Last",
            },
            {
                "<leader>du",
                function()
                    require("dapui").toggle()
                end,
                desc = "Debug: Toggle UI",
            },
        },
    },
}
