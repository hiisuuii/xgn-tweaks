XGN_GLOBAL_TWEAKS = XGN_GLOBAL_TWEAKS or {}
AddCSLuaFile()

// This table is currently only used to see who can access the C and Q menus
XGN_GLOBAL_TWEAKS.AdminPrivilegesGroups = { 
    ["superadmin"] = true, 
    ["admin"] = true,
    ["operator"] = true
    // If you want to add more groups, like a group called "gamemaker", add them below this line in the same format as the groups above. Don't forget a comma after each "true" except the last one in the list
}