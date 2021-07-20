local component = require("component")
local robot = require("robot")
local sides = require('sides')
local redstone = component.redstone
--local modem = component.modem
--local event = require("event")

local items = require("fp/items")
local move = require("fp/move")
local patterns = require("fp/patterns")
local inventory = require("fp/inventory")

-- -----------------------------------------------------------------------------
-- Constants to adjust

local SUCK_FINAL_PRODUCT = true
local USE_REDSTONE_SIGNAL = false


-- -----------------------------------------------------------------------------
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

local function waitForTheMagic(waitTime)
    if USE_REDSTONE_SIGNAL then
        os.sleep()
        while redstone.getInput(sides.right) > 0 do
            os.sleep()
        end
    else
        os.sleep(waitTime)
    end
end

local function switchVacuum(high)
    redstone.setOutput(sides.right, high and 15 or 0)
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

-- -----------------------------------------------------------------------------
-- Build

local function buildColumn(size, direction, pattern)
    for i = 1, size do
        local item = pattern[direction == sides.up and i or size + 1 - i]
        if item ~= nil then
            place(item)
        end
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
        if i ~= size then
            move.back()
        end
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

local function buildStructure(pattern)
    -- collect items

    -- move to position
    move.turnRight()
    move.forward()
    move.turnRight()

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
    waitForTheMagic(13)

    -- fetch final product or activate the vacuum
    if SUCK_FINAL_PRODUCT then
        move.forward(3)
        robot.suck()
        move.turnAround()
        move.forward(3)
        move.up()
        move.up()
        dropAllItems()
        move.down()
        move.down()
    else
        switchVacuum(true)
        os.sleep()
        switchVacuum(false)
        move.turnAround()
    end
end

local function promptWhatToBuild()
    print("What would you like to craft ?")
    print("[1] " .. patterns.ENDER_PEARL.description)
    print("[2] " .. patterns.NORMAL_COMPACT_MACHINE.description)
    io.write("?")
    local choice = io.read()


    io.write("How many times shall I craft?")
    local times = io.read()
    print("Confirmed operation.")


    for i = 1, times do
        print("Building ", i)
        if choice == "1" then
            inventory.takeAllItems(patterns.ENDER_PEARL)
            buildStructure(patterns.ENDER_PEARL)
        end
        if choice == "2" then
            inventory.takeAllItems(patterns.NORMAL_COMPACT_MACHINE)
            buildStructure(patterns.NORMAL_COMPACT_MACHINE)
        end
    end
    os.sleep(2)
end

local builder = {}


function builder.run()

    print("Connected to Refined Storage ?")
    print("y/N")

    io.write("?")
    local choice = io.read()
    if choice == "y" then
        --modem.open(2)
        --
        --local _, _, from, port, _, message = event.pull("modem_message")
        --print("Got a message from " .. from .. " on port " .. port .. ": " .. tostring(message))
    else
        promptWhatToBuild()
    end

end

return builder