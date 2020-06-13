local component = require("component")
local robot = require("robot")
local sides = require('sides')
local inventory = component.inventory_controller
local redstone = component.redstone

local items = require("items")
local move = require("move")

-------------------------------------------------------------------------------
-- Constants to ajust

local SUCK_FINAL_PRODUCT = false
local USE_REDSTONE_SIGNAL = true

local builds = {}

function builds.dropCatalizer(item)
    robot.select(item[#item])
    robot.drop()
end

function builds.waitTheMagic(waitTime)
    if USE_REDSTONE_SIGNAL then
        os.sleep()
        while redstone.getInput(sides.right) > 0 do
            os.sleep()
        end
    else
        os.sleep(waitTime)
    end
end

function builds.switchVacuum(high)
    redstone.setOutput(sides.right, high and 15 or 0)
end

function builds.dropAllItems()
    for i = 1, 16 do
        robot.select(i)
        inventory.dropIntoSlot(sides.front, i)
    end
end

function builds.nextRowOnTheRight()
    move.turnRight()
    move.forward()
    move.turnRight()
    move.back(2)
end

function builds.nextRowOnTheLeft()
    move.turnLeft()
    move.forward()
    move.turnLeft()
    move.back(2)
end

function builds.buildColumn(size, direction, pattern)
    for i = 1, size do
        local item = pattern[direction == sides.up and i or size + 1 - i]
        if item ~= nil then items.place(item) end
        if i ~= size then
            move._move(direction)
        end
    end
end

function builds.buildPatternStartingOn(size, pattern, direction)
    local directions
    if (direction == sides.down) then
        directions = { sides.up, sides.down, sides.up, sides.down, sides.up }
    else
        directions = { sides.down, sides.up, sides.down, sides.up, sides.down }
    end
    for i = 1, size do
        builds.buildColumn(size, directions[i], pattern[i])
        if i ~= size then move.back() end
    end
end

function builds.buildStructure3(design)
    move.forward(3)
    -- Begin construction
    builds.buildPatternStartingOn(3, design[1], sides.down)
    builds.nextRowOnTheRight()
    builds.buildPatternStartingOn(3, design[2], sides.up)
    builds.nextRowOnTheLeft()
    builds.buildPatternStartingOn(3, design[3], sides.down)
    -- Drop catalyst
    move.down(2)
    move.strafLeft()
end


function builds.buildStructure5(design)
    move.forward(5)
    -- Begin construction
    builds.buildPatternStartingOn(5, design[1], sides.down)
    builds.nextRowOnTheRight()
    builds.buildPatternStartingOn(5, design[2], sides.up)
    builds.nextRowOnTheLeft()
    builds.buildPatternStartingOn(5, design[3], sides.down)
    builds.nextRowOnTheRight()
    builds.buildPatternStartingOn(5, design[4], sides.up)
    builds.nextRowOnTheLeft()
    builds.buildPatternStartingOn(5, design[5], sides.down)
    -- Drop catalyst
    move.down(4)
    move.strafLeft(2)
end


function builds.buildMachineWall(times)
    for i = 1, math.ceil(times / 32) do
        local tmp = times - ((i - 1) * 32)
        local nb = tmp > 32 and 32 or tmp

        --  fetch item
        move.strafRight()
        move.up(2)
        items.take(items.REDSTONE, nb * 2)
        move.down(2)
        move.strafRight(2)
        items.take(items.IRON_BLOCK, nb * 1)
        move.turnLeft()
        move.forward(3)
        move.turnLeft()

        for j = 1, nb do
            move.forward()
            print("Building ", (i - 1) * 32 + j)
            -- Begin construction
            items.place(items.IRON_BLOCK)
            move.up()
            items.place(items.REDSTONE)
            move.down()

            -- Drop catalyst
            move.back()
            builds.dropCatalizer(items.REDSTONE)

            -- Wait the magic
            builds.waitTheMagic(5)

            if SUCK_FINAL_PRODUCT then
                move.forward(3)
                robot.suck()
                move.back(2)
            else
                builds.switchVacuum(true)
                os.sleep()
                builds.switchVacuum(false)
            end
        end

        if SUCK_FINAL_PRODUCT then
            move.turnAround()
            move.forward()
            move.up()
            builds.dropAllItems()
            move.down()
        else
            move.turnAround()
        end
    end
end

function builds.buildStructure(pattern)
    -- collect items
    pattern.collect()

    -- build the structure
    if pattern.size == 5 then
        builds.buildStructure5(pattern.design)
    else
        builds.buildStructure3(pattern.design)
    end

    -- drop the catalyst
    move.back()
    robot.select(pattern.catalyst[#pattern.catalyst])   
    robot.drop()

    -- wait for the magic
    builds.waitTheMagic(13)

    -- fetch final product or activate the vacuum
    if SUCK_FINAL_PRODUCT then
        move.forward(3)
        robot.suck()
        move.turnAround()
        move.forward(3)
        move.up()
        builds.dropAllItems()
        move.down()
    else
        builds.switchVacuum(true)
        os.sleep()
        builds.switchVacuum(false)
        move.turnAround()
    end
end
return builds