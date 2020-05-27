ORP = ImportPackage("orp")

function askbank(player)
    AddPlayerChat(player, "You have: $" ..ORP.GetPlayerBank(player).. " in the bank. Use /withdraw <amount> or /deposit <amount> to make a transaction.")    
end
AddRemoteEvent("askbank", askbank)


AddCommand("bal", function(player)
CallRemoteEvent(player, "askbank")
end)

AddCommand("withdraw", function(player, amnt)
    CallRemoteEvent(player, "withdraw", amnt)
end)


AddCommand("deposit", function(player, amnt)
    CallRemoteEvent(player, "deposit", amnt)
end)

function pay(player, player2, amount)
    if amount == null or player2 == null then
        AddPlayerChat(player, "Syntax incorrect! Use /pay <receivingid> <amount>")
    else
        ORP.pay(player, player2, amount)
        AddPlayerChat(player, "You have paid " ..GetPlayerName(player2).." $" ..amount.. " in cash.")
    end
end

AddCommand("pay", pay)




--------------------------GIVING & RECEIVING PAYOUT-------------------------
function cfmdeposit(player, amnt)
    ORP.deposit(player, amnt)
end
AddRemoteEvent("cfmdeposit", cfmdeposit)


function cfmwithdraw(player, amnt)
    ORP.withdraw(player, amnt)
end
AddRemoteEvent("cfmwithdraw", cfmwithdraw)

function wire(player, player2, amount)
	if amount == nil or tonumber(amount) > ORP.GetPlayerBank(player) or IsValidPlayer(player2) == false then
        AddPlayerChat(player, "Syntax incorrect! Use /pay <receivingid> <amount>")
    else
        ORP.wire(player, player2, amount)
        AddPlayerChat(player, "You have paid " ..GetPlayerName(player2).." $" ..amount.. " via bank wire transfer.")
    end
end

AddCommand("wire", wire)
----------------------------------------------------------------------------