ORP = ImportPackage("orp")

VehData = {}

--mariadb_query(sql, mariadb_prepare(sql, "INSERT INTO player_vehicles (steamid, model) VALUES ('?', '?')", steamId, model))

AddCommand("pv", function(player, vehid)
    if vehid == null then
        AddPlayerChat(player, "the correct syntax is /pv <vehicleid>")
    else
        local steamId = GetPlayerSteamId(player)
        mariadb_query(sql, mariadb_prepare(sql, "INSERT INTO vehicle (model, steamid) VALUES ('?', '?')", vehid, steamId))
        AddPlayerChat(player, "You just bought a " ..vehid)
    end
end)

AddCommand("gg", function(player)

end)
