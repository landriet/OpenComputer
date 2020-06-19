for k, _ in pairs(package.loaded) do
    if k:sub(1, 2) == "fp" then
        package.loaded[k] = nil
    end
end


local function run()
    print("What am I ?")
    print("[1] Computer")
    print("[2] Robot")

    io.write("?")
    local choice = io.read()
    if choice == "1" then
        local master = require("fp/master")
        master.run()
    elseif choice == "2" then
        local builder = require("fp/builder")
        builder.run()
    else
        print("invalid choice")
    end
end

run()
