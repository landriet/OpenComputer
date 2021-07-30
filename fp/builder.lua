local component = require("component")
local robot = require("robot")
local sides = require('sides')
local redstone = component.redstone
local items = require("fp/items")
local move = require("fp/move")
local inventory = require("fp/inventory")

-- -----------------------------------------------------------------------------
-- Constants to adjust

local SUCK_FINAL_PRODUCT = true
local USE_REDSTONE_SIGNAL = false


-- -----------------------------------------------------------------------------
-- Inventory

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
            builder.place(item)
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

local builder = {}

function builder.place(item)
    robot.select(item.slots[#item.slots])
    robot.place()
    if (inventory.getStackInInternalSlot(item.slots[#item.slots]) == nil) then
        table.remove(item.slots, #item.slots)
    end
end

function builder.dropCatalyzer(item)
    robot.select(item.slots[#item.slots])
    robot.drop(1)
end

function builder.buildStructure(pattern)
    -- build the structure
    if pattern.size == 5 then
        buildStructure5(pattern.design)
    else
        buildStructure3(pattern.design)
    end

    -- drop the catalyst
    move.back()
    robot.select(pattern.catalyst.slots[#pattern.catalyst.slots])
    robot.drop(1)

    -- wait for the magic
    waitForTheMagic(pattern.timeToWait)

    -- fetch final product or activate the vacuum
    if SUCK_FINAL_PRODUCT then
        if pattern.size == 5 then
            move.forward(3)
        else
            move.forward(2)
        end
        robot.suck()
        move.turnAround()
        if pattern.size == 5 then
            move.forward(3)
        else
            move.forward(2)
        end
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


function builder.buildMachineWall(times)
    move.strafRight(1)
    move.up(2)
    inventory.take(items.REDSTONE, (times * 2))
    move.strafRight(2)
    move.down(2)
    inventory.take(items.IRON_BLOCK, times)
    move.turnLeft()
    move.forward(3)
    move.turnLeft()

    move.forward()
    for _ = 1, times do
        -- Begin construction
        builder.place(items.IRON_BLOCK)
        move.up()
        builder.place(items.REDSTONE)
        move.down()

        -- Drop catalyst
        move.back()
        builder.dropCatalyzer(items.REDSTONE)

        -- Wait the magic
        waitForTheMagic(5)

        if SUCK_FINAL_PRODUCT then
            move.forward(2)
            robot.suck()
            move.back(1)
        else
            switchVacuum(true)
            os.sleep()
            switchVacuum(false)
        end
    end
    move.back(1)
    move.turnAround()
    move.up(2)
    dropAllItems()
    move.down(2)
end

return builder