local builds = require("builds")
local patterns = require("patterns")

local function construct()
    print("What would you like to craft?")
    print("[1] Machine Wall")
    print("[2] Small compact machine")
    print("[3] Normal compact machine")
    print("[4] Large compact machine")
    print("[5] Giant compact machine")
    print("[6] Enderpearl")
    print("[7] Tunnel")
    io.write("?")
    local choice = io.read()

    io.write("How many times shall I craft?")
    local times = io.read()
    print("Confirmed operation. Constructing")
    if choice == "1" then
        builds.buildMachineWall(times)
    end
    if choice == "2" then
        for i = 1, times do
            print("Building ", i)
            builds.buildStructure(patterns.SMALL_COMPACT_MACHINE)
        end
    end
    if choice == "3" then
        for i = 1, times do
            print("Building ", i)
            builds.buildStructure(patterns.NORMAL_COMPACT_MACHINE)
        end
    end
    if choice == "4" then
        for i = 1, times do
            print("Building ", i)
            builds.buildStructure(patterns.LARGE_COMPACT_MACHINE_5_BY_5)
        end
    end
    if choice == "5" then
        for i = 1, times do
            print("Building ", i)
            builds.buildStructure(patterns.GIANT_COMPACT_MACHINE_3_BY_3)
        end
    end
    if choice == "6" then
        for i = 1, times do
            print("Building ", i)
            builds.buildStructure(patterns.ENDER_PEARL)
        end
    end
    if choice == "7" then
        builds.buildStructure(patterns.TUNNEL)
    end
    os.sleep(2)
end

construct()
