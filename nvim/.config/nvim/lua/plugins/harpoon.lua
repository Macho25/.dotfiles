-- Base setup comes from the editor.harpoon2 extra; only its <leader>h menu is kept.
-- Its <leader>H and <leader>1-9 are dropped in favour of <leader>a and <A-1>..<A-5>.
return {
    "ThePrimeagen/harpoon",
    keys = function(_, keys)
        keys = vim.tbl_filter(function(k)
            return k[1] ~= "<leader>H" and not k[1]:match("^<leader>%d$")
        end, keys)
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
