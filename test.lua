local rec = peripheral.find("digital_receiver_box")
local con = peripheral.find("digital_controller_box")

local rnames = rec.getSignalNames()
local cnames = con.getSignalNames()

while true do
    os.queueEvent("randomEvent")
    os.pullEvent()

    h = 0
    for i,n in pairs(rnames) do
        if rec.getAspect(n) > h then
            h = rec.getAspect(n)
        end
    end

    for i,n in pairs(cnames) do
        con.setAspect(n, h)
    end
end