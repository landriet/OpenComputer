local component = require("component")
local robot = require("robot")
local sides = require('sides')

-- -----------------------------------------------------------------------------
-- Mouvements

local move = {}


function move._move(side)
    local success = component.robot.move(side)
    if success ~= true then
        os.execute("shutdown")
    end
end

function move.forward(dist)
    for i = 1, dist or 1 do
        move._move(sides.front)
    end
end

function move.back(dist)
    for i = 1, dist or 1 do
        move._move(sides.back)
    end
end

function move.up(dist)
    for i = 1, dist or 1 do
        move._move(sides.up)
    end
end

function move.down(dist)
    for i = 1, dist or 1 do
        move._move(sides.down)
    end
end

function move.turnLeft() robot.turnLeft() end

function move.turnRight() robot.turnRight() end

function move.turnAround() robot.turnAround() end

function move.strafLeft(dist)
    robot.turnLeft()
    for i = 1, dist or 1 do
        robot.forward()
    end
    robot.turnRight()
end

function move.strafRight(dist)
    robot.turnRight()
    for i = 1, dist or 1 do
        robot.forward()
    end
    robot.turnLeft()
end

return move
