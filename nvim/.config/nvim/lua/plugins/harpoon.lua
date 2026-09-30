-- Base setup comes from the editor.harpoon2 extra (<leader>H add, <leader>h menu, <leader>1-9)
return {
    "ThePrimeagen/harpoon",
    keys = function(_, keys)
        table.insert(keys, {
            "<leader>a",
            function()
                require("harpoon"):list():add()
            end,
            desc = "Harpoon Add File",
        })
        for i = 1, 5 do
            table.insert(keys, {
                "<A-" .. i .. ">",
                function()
                    require("harpoon"):list():select(i)
                end,
                desc = "Harpoon File " .. i,
            })
        end
        return keys
    end,
}
