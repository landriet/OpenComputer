local component = require("component")
local sides = require('sides')
local refineStorage = component.block_refinedstorage_interface

local rs = {}

function rs.fetchAllItems(ingredients)
    for i = 1, #ingredients do
        local ingredient = ingredients[i]
        local result = refineStorage.extractItem(ingredient, ingredient.count, sides.south)
        if result == false then
            return false
        end
    end
end

return rs