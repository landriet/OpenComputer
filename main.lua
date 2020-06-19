local patterns = require("patterns")
local rs = require("rs")

local function run()
    print(rs)
    print(patterns.ENDER_PEARL.ingrediants)
    rs.fetchAllItems(patterns.ENDER_PEARL.ingrediants)
    os.sleep(2)
end

run()
