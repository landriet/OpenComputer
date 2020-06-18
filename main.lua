local patterns = require("patterns")
local rs = require("rs")


local function run()
    rs.fetchALlItem(patterns.ENDER_PEARL.ingrediants)
    os.sleep(2)
end

run()
