function SetJob(player, job, jobrank)
	if player == nil or job == nil or jobrank == nil then
			print("Invalid Usage : <player> <job> <jobrank>")
		else
			PlayerData[player].job = job
			PlayerData[player].jobrank = jobrank
			print("Set " .. GetPlayerSteamId(player) .. "'s Job to " .. job .. " [" .. jobrank .. "]")
	end
end
AddFunctionExport("SetJob", SetJob)

function Wire(player, player2, amount)
	if amount == nil or tonumber(amount) > GetPlayerBank(player) or IsValidPlayer(player2) == false then
		AddPlayerChat(player, "Not enough bank funds, player doesn't exist or invalid Usage : /wire <receiver's id> <amount>")
	else
		PlayerData[tonumber(player)].bank = PlayerData[tonumber(player)].bank - amount
		PlayerData[tonumber(player2)].bank = PlayerData[tonumber(player2)].bank + amount
		UpdatePlayerHud(player, "bank", PlayerData[tonumber(player)].bank)
		UpdatePlayerHud(player, "bank", PlayerData[tonumber(player2)].bank)	
	end
end
AddFunctionExport("Wire", Wire)

function Deposit(player, amount)
	if amount == nil then
		print("Invalid Usage : /deposit <amount>")
	else
		PlayerData[tonumber(player)].cash = PlayerData[tonumber(player)].cash - amount
		PlayerData[tonumber(player)].bank = PlayerData[tonumber(player)].bank + amount
		UpdatePlayerHud(player, "bank", PlayerData[tonumber(player)].bank)
		UpdatePlayerHud(player, "cash", PlayerData[tonumber(player)].cash)	
		AddPlayerChat(player, "You have deposited $" ..amount.. " from the bank")
	end
end
AddFunctionExport("Deposit", Deposit)


function GetPlayerJob(player)
    return tostring(PlayerData[player].job)
end
AddFunctionExport("GetPlayerJob", GetPlayerJob)

function GetPlayerJoblvl(player)
    return tonumber(PlayerData[player].joblevel)
end
AddFunctionExport("GetPlayerJoblvl", GetPlayerJoblvl)

function GetPlayerCash(player)
    return tonumber(PlayerData[player].cash)
end
AddFunctionExport("GetPlayerCash", GetPlayerCash)

function GetPlayerBank(player)
    return tonumber(PlayerData[player].bank)
end
AddFunctionExport("GetPlayerBank", GetPlayerBank)

function GetPlayerDirtyMoney(player)
    return tonumber(PlayerData[player].dirtymoney)
end
AddFunctionExport("GetPlayerDirtyMoney", GetPlayerDirtyMoney)

function Withdraw(player, amount)
	if amount == nil then
		print("Invalid Usage : /withdraw <amount>")
	else
		PlayerData[tonumber(player)].bank = PlayerData[tonumber(player)].bank - amount
		PlayerData[tonumber(player)].cash = PlayerData[tonumber(player)].cash + amount
		UpdatePlayerHud(player, "bank", PlayerData[tonumber(player)].bank)
		UpdatePlayerHud(player, "cash", PlayerData[tonumber(player)].cash)	
		AddPlayerChat(player, "You have withdrawn $" ..amount.. " from the bank")
	end
end
AddFunctionExport("Withdraw", Withdraw)

function Pay(player, player2, amount)
	if amount == nil or tonumber(amount) > GetPlayerCash(player) or IsValidPlayer(player2) == false then
		print("Not enough cash, player doesn't exist or invalid Usage : /pay <receiver's id> <amount>")
	else
		PlayerData[tonumber(player)].cash = PlayerData[tonumber(player)].cash - amount
		PlayerData[tonumber(player2)].cash = PlayerData[tonumber(player2)].cash + amount
		UpdatePlayerHud(player, "cash", PlayerData[tonumber(player)].cash)
		UpdatePlayerHud(player, "cash", PlayerData[tonumber(player2)].cash)	
	end
end
AddFunctionExport("Pay", Pay)

function Transaction(player, amount)
	if amount == nil or tonumber(amount) > GetPlayerCash(player) then
		AddPlayerChat(player, "You do not have enough money to buy this.")
	else
		PlayerData[tonumber(player)].cash = PlayerData[tonumber(player)].cash - amount
		UpdatePlayerHud(player, "cash", PlayerData[tonumber(player)].cash)
	end
end
AddFunctionExport("Transaction", Transaction)