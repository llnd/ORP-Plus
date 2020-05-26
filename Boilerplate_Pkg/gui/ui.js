CallEvent = ue.game.callevent;

$(document).keyup(function(e) {
    if (e.key === "Escape") {
        CallEvent("TOGGLEMENUFUNCTION", false)
   }
});