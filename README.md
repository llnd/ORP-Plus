# O:RP++
 llnd's enhanced version of DimmiesTV's open source framework, Onset Roleplay.

**Make sure you update the database.lua lines 14-17 according to your MySQL settings**



## THIS PROJECT IS NOT TO BE PLAYED AS IS AND REQUIRES A LOT OF WORK TO BE A FULLY FUNCTIONAL RP SERVER. THIS MERELY GIVES YOU THE TOOLS TO DO SO
**Garage is a WIP and not even close to functional**



All of these functions are SERVER side.
Importpackage and prefix is required if using exports outside of the orp package.

## How to import orp to your new package
```
ORP = Importpackage("orp")
```
## Exports
```
ORP.Withdraw(player, amount)
ORP.Deposit(player, amount)
ORP.GetPlayerJob(player)
ORP.GetPlayerJoblvl(player)
ORP.SetJob(player, job, jobrank)
ORP.GetPlayerCash(player)
ORP.GetPlayerBank(player)
ORP.GetPlayerDirtyMoney(player)
ORP.Wire(player, player2, amount)
ORP.Pay(player, player2, amount)
ORP.Transaction(player, amount)
ORP.GetClosePlayer(player)
```

## Example
```
ORP = Importpackage("orp")

Addcommand("policewithdraw", function(player, amount)
  if amount == null then
     AddPlayerChat(player, "the correct syntax is /policewithdraw <amount>")
  else
      if ORP.GetPlayerJob(player) == "Police" then
      ORP.withdraw(player, amount)
      end
   end
end)
```




