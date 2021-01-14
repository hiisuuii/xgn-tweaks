local ply = LocalPlayer()
include("autorun/sh_xgn_globals.lua")

XGN_GLOBAL_TWEAKS = XGN_GLOBAL_TWEAKS or {} // As an extra layer of security, we're referencing this global table
                                            // instead of just locally storing the allowed groups. Basically, this
                                            // makes it a little harder to 'fool' the game into thinking they're allowed
                                            // This also makes it easier to add more groups, since you only have to
                                            // update the one file instead of updating every one that uses the groups
                                            // You can also use the same global table in other shit you might need it
                                            // just make sure to run the include!

hook.Add("ContextMenuOpen","XGN_DisableCMenu",function()
    if !XGN_GLOBAL_TWEAKS.AdminPrivilegesGroups[ply:GetUserGroup()] then    //Checks if the player's current usergroup appears in the AdminPrivilegesGroup table
        return false                                                        //If it doesn't, refuse to open the C menu
    end
end)

hook.Add("SpawnMenuOpen","XGN_DisableSpawnMenu",function()
    if !XGN_GLOBAL_TWEAKS.AdminPrivilegesGroups[ply:GetUserGroup()] then    //Same as above
        return false                                                        //Same as above
    end
end)