local items = require("fp/items")

local patterns = {
    LARGE_COMPACT_MACHINE_5_BY_5 = {
        size = 5,
        ingredients = {
            { item = items.MACHINE_WALL, count = 98 },
            { item = items.ENDER_PEARL, count = 1 },
        },
        catalyst = items.ENDER_PEARL,
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

