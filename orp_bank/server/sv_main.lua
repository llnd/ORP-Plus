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

--------------------------GIVING & RECEIVING PAYOUT-------------------------
function cfmdeposit(player, amnt)
    ORP.deposit(player, amnt)
end
AddRemoteEvent("cfmdeposit", cfmdeposit)


function cfmwithdraw(player, amnt)
    ORP.withdraw(player, amnt)
end
AddRemoteEvent("cfmwithdraw", cfmwithdraw)
----------------------------------------------------------------------------