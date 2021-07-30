-- Unload all loaded vim modules to prevent persistent state across restarts
for k, _ in pairs(package.loaded) do
    if k:sub(1, 2) == "fp" then
        print(package.loaded[k], "unloaded")
        package.loaded[k] = nil
    end
end

local sides = require('sides')

local move = require("fp/move")
local patterns = require("fp/patterns")
local builder = require("fp/builder")
local inventory = require("fp/inventory")

local function hash(ingredients)
    local h = ""
    for i = 1, #ingredients do
        h = h .. ingredients[i].item.name
        h = h .. ingredients[i].count
    end
    return h
end

local function run()
    move.strafRight()
    local allItems = {}
    for _, value in pairs(patterns) do
        allItems[#allItems + 1] = { pattern = value, hash = hash(value.ingredients) }
    end
    print(#allItems)

    local size = inventory.getInventorySize(sides.front);
    for i = 1, size do
        local slotItem = inventory.getStackInSlot(sides.front, i)
        inventory.take(ingredient.item, slotItem.size)
        if (slotItem ~= nil) then
            local search = slotItem.name .. math.floor(slotItem.size)
            local patternsLeft = {}
            for j = 1, #allItems do
                local result = string.match(allItems[j].hash, search)
                if (result ~= nil) then
                    patternsLeft[#patternsLeft + 1] = allItems[j]
                end
            end
            allItems = patternsLeft;
        end
    end



    if(#allItems == 1) then
        move.turnLeft()
        move.forward()
        move.turnLeft()
        builder.buildStructure(allItems[1].pattern)
    else
        move.strafLeft()
    end
end

run()
