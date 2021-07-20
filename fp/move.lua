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
    if (dist ~= 0) then
        for _ = 1, dist or 1 do
            move._move(sides.front)
        end
    end
end

function move.back(dist)
    if (dist ~= 0) then
        for _ = 1, dist or 1 do
            move._move(sides.back)
        end
    end
end

function move.up(dist)
    if (dist ~= 0) then
        for _ = 1, dist or 1 do
            move._move(sides.up)
        end
    end
end

function move.down(dist)
    if (dist ~= 0) then
        for _ = 1, dist or 1 do
            move._move(sides.down)
        end
    end
end

function move.turnLeft()
    robot.turnLeft()
end

function move.turnRight()
    robot.turnRight()
end

function move.turnAround()
    robot.turnAround()
end

function move.strafLeft(dist)
    robot.turnLeft()
    for _ = 1, dist or 1 do
        robot.forward()
    end
    robot.turnRight()
end

function move.strafRight(dist)
    robot.turnRight()
    for _ = 1, dist or 1 do
        robot.forward()
    end
    robot.turnLeft()
end

return move
