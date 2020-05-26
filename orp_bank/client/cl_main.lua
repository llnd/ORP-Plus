ORP = ImportPackage("orp")

atms = {
    {["x"] = 212831.546875, ["y"] = 190175.09375, ["z"] = 1306.3321533203},
    {["x"] = 213423.640625, ["y"] = 190555.515625, ["z"] = 1306.3321533203}  
}

function bank()
    local cDist = GetNearestATM()
    if cDist <= 250 then
        CallRemoteEvent("askbank")
    else
        AddPlayerChat("You aren't at an ATM")
    end
end
AddRemoteEvent("askbank", bank)

function withdraw(amnt)
    local cDist = GetNearestATM()
    if cDist <= 250 then
        CallRemoteEvent("cfmwithdraw", amnt)
    else
        AddPlayerChat("You aren't at an ATM")
    end
end
AddRemoteEvent("withdraw", withdraw)

function deposit(amnt)
    local cDist = GetNearestATM()
    if cDist <= 250 then
        CallRemoteEvent("cfmdeposit", amnt)
    else
        AddPlayerChat("You aren't at an ATM")
    end
end
AddRemoteEvent("deposit", deposit)

function GetNearestATM()
    local x, y, z = GetPlayerLocation()
    local cDist = 500
    for k,v in pairs(atms) do
        local dist = GetDistance3D(x, y, z, v.x, v.y, v.z)
        if dist < cDist then
            cDist = dist
        end
    end
    return cDist
end