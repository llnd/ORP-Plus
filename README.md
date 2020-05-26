# O:RP++
 llnd's enhanced version of DimmiesTV's open source framework, Onset Roleplay.







All of these functions are SERVER side.
Importpackage and prefix is required if using exports outside of the orp package.

## How to import orp to your new package
```
ORP = Importpackage("orp")
```
## Exports
```
ORP.withdraw(player, amount)
ORP.deposit(player, amount)
ORP.GetPlayerJob(player)
ORP.GetPlayerJoblvl(player)
ORP.GetPlayerCash(player)
ORP.GetPlayerBank(player)
ORP.GetPlayerDirtyMoney(player)
ORP.wire(player, player2, amount)
ORP.pay(player, player2, amount)
ORP.transaction(player, amount)
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




