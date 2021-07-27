local component = require("component")
local robot = require("robot")
local sides = require('sides')
local move = require("fp/move")

local inventory = component.inventory_controller

-- -----------------------------------------------------------------------------
-- Inventory

function inventory.findEmptySlot()
    for i = 1, 16 do
        if inventory.getStackInInternalSlot(i) == nil then
            return i
        end
    end
    print("no empty slot")
end

function inventory.take(item, count)
    local emptySlot
    if count > 64 then
        emptySlot = inventory.findEmptySlot()
        item.slots[#item.slots + 1] = emptySlot
        robot.select(emptySlot)
        inventory.suckFromSlot(sides.front, 1, count - 64)
    end
    emptySlot = inventory.findEmptySlot()
    item.slots[#item.slots + 1] = emptySlot
    robot.select(emptySlot)
    inventory.suckFromSlot(sides.front, 1, count)
end

function inventory.place(item)
    robot.select(item.slots[#item.slots])
    robot.place()
    if (inventory.getStackInInternalSlot(item.slots[#item.slots]) == nil) then
        table.remove(item, #item.slots)
    end
end

function inventory.takeAllItems(ingredients)
    local actualX = 0
    local actualY = 0
    for i = 1, #ingredients do
        local ingredient = ingredients[i]
        local diffX = ingredient.item.emplacement.x - actualX
        if diffX > 0 then
            move.turnRight()
        elseif diffX < 0 then
            move.turnLeft()
        end
        move.forward(math.abs(diffX))
        if diffX > 0 then
            move.turnLeft()
        elseif diffX < 0 then
            move.turnRight()
        end
        actualX = ingredient.item.emplacement.x

        local diffY = ingredient.item.emplacement.y - actualY
        if diffY > 0 then
            move.up(diffY)
        elseif diffY < 0 then
            move.down(math.abs(diffY))
        end
        actualY = ingredient.item.emplacement.y

        inventory.take(ingredient.item, ingredient.count)
    end

    -- go back
    if actualY > 0 then
        move.down(actualY)
    elseif actualY < 0 then
        move.up(actualY)
    end
    move.turnLeft()
    move.forward(actualX)
    move.turnRight()
end

return inventory

