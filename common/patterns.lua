local items = require("items")
local move = require("move")

local patterns = {
    LARGE_COMPACT_MACHINE_5_BY_5 = {
        size = 5,
        ingredients = {
            { item = items.MACHINE_WALL, count = 98 },
            { item = items.ENDER_PEARL, count = 1 },
        },
        catalyst = items.ENDER_PEARL,
        collect = function()
            move.strafRight(2)
            items.take(items.ENDER_PEARL, 1)
            move.up()
            items.take(items.MACHINE_WALL, 98)
            move.down()
            move.turnAround()
        end,
        design = {
            {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }, {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, nil, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, nil, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, nil, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }, {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, nil, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, nil, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, nil, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }, {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, nil, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, nil, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, nil, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }, {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }
        }
    },
    MAXIMUM_COMPACT_MACHINE_5_BY_5 = {
        size = 5,
        ingredients = {
            { item = items.MACHINE_WALL, count = 98 },
            { item = items.GLITCHED_GIANT, count = 1 },
            { item = items.ENDER_PEARL, count = 1 },
        },
        catalyst = items.ENDER_PEARL,
        collect = function()
            move.strafRight(2)
            items.take(items.ENDER_PEARL, 1)
            move.up()
            items.take(items.MACHINE_WALL, 98)
            move.down()
            move.turnAround()
        end,
        design = {
            {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }, {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, nil, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, nil, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, nil, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }, {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, nil, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, items.GLITCHED_GIANT, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, nil, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }, {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, nil, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, nil, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, nil, nil, nil, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }, {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }
        }
    },
    SMALL_COMPACT_MACHINE = {
        size = 3,
        ingredients = {
            { items.MACHINE_WALL, 26 },
            { items.IRON_BLOCK, 1 },
            { items.ENDER_PEARL, 1 },
        },
        catalyst = items.ENDER_PEARL,
        collect = function()
            move.strafRight(2)
            items.take(items.ENDER_PEARL, 1)
            move.up()
            items.take(items.MACHINE_WALL, 26)
            move.down()
            move.strafRight()
            items.take(items.IRON_BLOCK, 1)
            move.turnLeft()
            move.forward(1)
            move.turnLeft()
        end,
        design = {
            {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }, {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.IRON_BLOCK, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }, {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }
        }
    },
    NORMAL_COMPACT_MACHINE = {
        size = 3,
        ingredients = {
            { items.MACHINE_WALL, 26 },
            { items.GOLD_BLOCK, 1 },
            { items.ENDER_PEARL, 1 },
        },
        catalyst = items.ENDER_PEARL,
        collect = function()
            move.strafRight(2)
            items.take(items.ENDER_PEARL, 1)
            move.up()
            items.take(items.MACHINE_WALL, 26)
            move.down()
            move.strafRight()
            move.up()
            items.take(items.IRON_BLOCK, 1)
            move.down()
            move.turnLeft()
            move.forward(1)
            move.turnLeft()
        end,
        design = {
            {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }, {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.GOLD_BLOCK, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }, {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }
        }
    },
    GIANT_COMPACT_MACHINE_3_BY_3 = {
        size = 3,
        ingredients = {
            { items.MACHINE_WALL, 20 },
            { items.GLITCHED_LARGE, 6 },
            { items.MACHINE_CASING, 1 },
            { items.ENDER_PEARL, 1 },
        },
        catalyst = items.ENDER_PEARL,
        collect = function()
            move.strafRight(2)
            items.take(items.ENDER_PEARL, 1)
            move.up()
            items.take(items.MACHINE_WALL, 20)
            move.up()
            items.take(items.GLITCHED_LARGE, 6)
            move.up()
            items.take(items.MACHINE_CASING, 1)
            move.down(3)
            move.turnLeft()
            move.forward(1)
            move.turnLeft()
        end,
        design = {
            {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.GLITCHED_LARGE, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }, {
                { items.MACHINE_WALL, items.GLITCHED_LARGE, items.MACHINE_WALL },
                { items.GLITCHED_LARGE, items.MACHINE_CASING, items.GLITCHED_LARGE },
                { items.MACHINE_WALL, items.GLITCHED_LARGE, items.MACHINE_WALL },
            }, {
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.GLITCHED_LARGE, items.MACHINE_WALL },
                { items.MACHINE_WALL, items.MACHINE_WALL, items.MACHINE_WALL },
            }
        }
    },
    ENDER_PEARL = {
        size = 3,
        ingredients = {
            { item = items.OBSIDIAN, count = 26 },
            { item = items.REDSTONE_BLOCK, count = 1 },
            { item = items.REDSTONE, count = 1 },
        },
        catalyst = items.REDSTONE,
        collect = function()
            move.strafRight()
            items.take(items.OBSIDIAN, 26)
            move.up()
            items.take(items.REDSTONE_BLOCK, 1)
            move.up()
            items.take(items.REDSTONE, 1)
            move.down(2)
            move.turnAround()
        end,
        design = {
            {
                { items.OBSIDIAN, items.OBSIDIAN, items.OBSIDIAN },
                { items.OBSIDIAN, items.OBSIDIAN, items.OBSIDIAN },
                { items.OBSIDIAN, items.OBSIDIAN, items.OBSIDIAN },
            }, {
                { items.OBSIDIAN, items.OBSIDIAN, items.OBSIDIAN },
                { items.OBSIDIAN, items.REDSTONE_BLOCK, items.OBSIDIAN },
                { items.OBSIDIAN, items.OBSIDIAN, items.OBSIDIAN },
            }, {
                { items.OBSIDIAN, items.OBSIDIAN, items.OBSIDIAN },
                { items.OBSIDIAN, items.OBSIDIAN, items.OBSIDIAN },
                { items.OBSIDIAN, items.OBSIDIAN, items.OBSIDIAN },
            }
        }
    },
}

return patterns

