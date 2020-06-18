local componentlocal component = require("component")
local sides = require('sides')
local refineStorage = component.block_refinedstorage_interface

local rs = {}

local INTERFACE_CHEST_SIDE = sides.south

function rs.fetchALlItems(ingredients)
    for i = 1, #ingredients do
        local ingredient = ingredients[i]
        local result = refineStorage.extractItem(ingredient, ingredient.count, INTERFACE_CHEST_SIDE)
        if result == false then
            return false
        end
    end
end

return rs