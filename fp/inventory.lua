local component = require("component")
local robot = require("robot")
local sides = require('sides')

local inventory = component.inventory_controller

-- -----------------------------------------------------------------------------
-- Inventory

function inventory.findEmptySlot()
    for i = 1, 16 do
        if inventory.getStackInInternalSlot(i) == nil then
            return i
        end
    end print("no empty slot")
end

function inventory.take(item, count)
    local emptySlot
    if count > 64 then
        emptySlot = items.findEmptySlot()
        item.slots[#item.slots + 1] = emptySlot
        robot.select(emptySlot)
        inventory.suckFromSlot(sides.front, 1, count - 64)
    end
    emptySlot = items.findEmptySlot()
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

return inventory

