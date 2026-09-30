-- dap, dap-ui and virtual text come from the dap.core extra (<leader>d...)
return {
    {
        "mfussenegger/nvim-dap",
        opts = function()
            local dap = require("dap")

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
                    processId = function()
                        return require("dap.utils").pick_process()
                    end,
                },
            }
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
        },
    },
}
