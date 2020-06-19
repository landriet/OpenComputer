local patterns = require("fp/patterns")
local rs = require("fp/rs")

local function run()
    rs.fetchAllItems(patterns.ENDER_PEARL.ingredients)
    os.sleep(2)
end

run()
