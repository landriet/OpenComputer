local patterns = require("fp/patterns")
local rs = require("fp/rs")
local modem = component.modem

local master = {}

function master.run()
    modem.open(1)
    rs.fetchAllItems(patterns.ENDER_PEARL.ingredients)
    modem.broadcast(2, "ENDER_PEARL")

end

return master