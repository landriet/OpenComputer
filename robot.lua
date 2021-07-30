-- Unload all loaded vim modules to prevent persistent state across restarts
for k, _ in pairs(package.loaded) do
    if k:sub(1, 2) == "fp" then
        print(package.loaded[k], "unloaded")
        package.loaded[k] = nil
    end
end

local builder = require("fp/builder")
local patterns = require("fp/patterns")

local function promptWhatToBuild()
    print("What would you like to craft ?")
    print("[1] Machine wall")
    print("[2] " .. patterns.ENDER_PEARL.description)
    print("[3] " .. patterns.NORMAL_COMPACT_MACHINE.description)
    print("[4] " .. patterns.GIANT_COMPACT_MACHINE_3_BY_3.description)
    print("[5] " .. patterns.MAXIMUM_COMPACT_MACHINE_3_BY_3.description)
    io.write("? ")
    local choice = io.read()

    io.write("How many times shall I craft ? ")
    local times = io.read()
    print("Confirmed operation.")

    if choice == "1" then
        builder.buildMachineWall(times)
    end
    for count = 1, times do
        print(count)
        -- collect items
        inventory.takeAllItems(pattern.ingredients)

        -- move to position
        move.turnRight()
        move.forward()
        move.turnRight()

        if choice == "2" then
            builder.buildStructure(patterns.ENDER_PEARL)
        end
        if choice == "3" then
            builder.buildStructure(patterns.NORMAL_COMPACT_MACHINE)
        end
        if choice == "4" then
            builder.buildStructure(patterns.GIANT_COMPACT_MACHINE_3_BY_3)
        end
        if choice == "5" then
            builder.buildStructure(patterns.MAXIMUM_COMPACT_MACHINE_3_BY_3)
        end
    end
    os.sleep(2)
    promptWhatToBuild()
end

function builder.run()
    --
    --print("Connected to Refined Storage ?")
    --print("y/N")
    --
    --io.write("?")
    --local choice = io.read()
    --if choice == "y" then
    --    --modem.open(2)
    --    --
    --    --local _, _, from, port, _, message = event.pull("modem_message")
    --    --print("Got a message from " .. from .. " on port " .. port .. ": " .. tostring(message))
    --else
    promptWhatToBuild()
    --end
    --
end

run()
