local component = require("component")
local robot = require("robot")
local sides = require('sides')
local inventory = component.inventory_controller
--local redstone = component.redstone
local modem = component.modem
local event = require("event")

local items = require("fp/items")
local move = require("fp/move")
local patterns = require("fp/patterns")

-------------------------------------------------------------------------------
-- Constants to ajust

local SUCK_FINAL_PRODUCT = false
local USE_REDSTONE_SIGNAL = true


-------------------------------------------------------------------------------
-- Inventory


local function place(item)
    robot.select(item.slots[#item.slots])
    robot.place()
    if (inventory.getStackInInternalSlot(item.slots[#item.slots]) == nil) then
        table.remove(item, #item.slots)
    end
end

local function dropCatalizer(item)
    robot.select(item[#item])
    robot.drop()
end

local function waitTheMagic(waitTime)
    if USE_REDSTONE_SIGNAL then
--        os.sleep()
--        while redstone.getInput(sides.right) > 0 do
--            os.sleep()
--        end
    else
        os.sleep(waitTime)
    end
end

local function switchVacuum(high)
--    redstone.setOutput(sides.right, high and 15 or 0)
end

local function dropAllItems()
    for i = 1, 16 do
        robot.select(i)
        inventory.dropIntoSlot(sides.front, i)
    end
end

local function nextRowOnTheRight()
    move.turnRight()
    move.forward()
    move.turnRight()
    move.back(2)
end

local function nextRowOnTheLeft()
    move.turnLeft()
    move.forward()
    move.turnLeft()
    move.back(2)
end

-------------------------------------------------------------------------------
-- Build

local function buildColumn(size, direction, pattern)
    for i = 1, size do
        local item = pattern[direction == sides.up and i or size + 1 - i]
        if item ~= nil then place(item) end
        if i ~= size then
            move._move(direction)
        end
    end
end

local function buildPatternStartingOn(size, pattern, direction)
    local directions
    if (direction == sides.down) then
        directions = { sides.up, sides.down, sides.up, sides.down, sides.up }
    else
        directions = { sides.down, sides.up, sides.down, sides.up, sides.down }
    end
    for i = 1, size do
        buildColumn(size, directions[i], pattern[i])
        if i ~= size then move.back() end
    end
end

local function buildStructure3(design)
    move.forward(3)
    -- Begin construction
    buildPatternStartingOn(3, design[1], sides.down)
    nextRowOnTheRight()
    buildPatternStartingOn(3, design[2], sides.up)
    nextRowOnTheLeft()
    buildPatternStartingOn(3, design[3], sides.down)
    -- Drop catalyst
    move.down(2)
    move.strafLeft()
end


local function buildStructure5(design)
    move.forward(5)
    -- Begin construction
    buildPatternStartingOn(5, design[1], sides.down)
    nextRowOnTheRight()
    buildPatternStartingOn(5, design[2], sides.up)
    nextRowOnTheLeft()
    buildPatternStartingOn(5, design[3], sides.down)
    nextRowOnTheRight()
    buildPatternStartingOn(5, design[4], sides.up)
    nextRowOnTheLeft()
    buildPatternStartingOn(5, design[5], sides.down)
    -- Drop catalyst
    move.down(4)
    move.strafLeft(2)
end


local function buildMachineWall(times)
    for i = 1, math.ceil(times / 32) do
        local tmp = times - ((i - 1) * 32)
        local nb = tmp > 32 and 32 or tmp


        for j = 1, nb do
            move.forward()
            print("Building ", (i - 1) * 32 + j)
            -- Begin construction
            place(items.IRON_BLOCK)
            move.up()
            place(items.REDSTONE)
            move.down()

            -- Drop catalyst
            move.back()
            dropCatalizer(items.REDSTONE)

            -- Wait the magic
            waitTheMagic(5)

            if SUCK_FINAL_PRODUCT then
                move.forward(3)
                robot.suck()
                move.back(2)
            else
                switchVacuum(true)
                os.sleep()
                switchVacuum(false)
            end
        end

        if SUCK_FINAL_PRODUCT then
            move.turnAround()
            move.forward()
            move.up()
            dropAllItems()
            move.down()
        else
            move.turnAround()
        end
    end
end

local function buildStructure(pattern)
    -- collect items

    -- build the structure
    if pattern.size == 5 then
        buildStructure5(pattern.design)
    else
        buildStructure3(pattern.design)
    end

    -- drop the catalyst
    move.back()
    robot.select(pattern.catalyst[#pattern.catalyst])
    robot.drop()

    -- wait for the magic
    waitTheMagic(13)

    -- fetch final product or activate the vacuum
    if SUCK_FINAL_PRODUCT then
        move.forward(3)
        robot.suck()
        move.turnAround()
        move.forward(3)
        move.up()
        dropAllItems()
        move.down()
    else
        switchVacuum(true)
        os.sleep()
        switchVacuum(false)
        move.turnAround()
    end
end


local builder = {}

function builder.run()
    print("Start")
    modem.open(2)

    local _, _, from, port, _, message = event.pull("modem_message")
    print("Got a message from " .. from .. " on port " .. port .. ": " .. tostring(message))

--    buildStructure(patterns.ENDER_PEARL)
    collectItems()
end

return builder