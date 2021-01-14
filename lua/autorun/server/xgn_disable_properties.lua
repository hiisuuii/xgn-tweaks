include("autorun/sh_xgn_globals.lua")

XGN_GLOBAL_TWEAKS = XGN_GLOBAL_TWEAKS or {} // As an extra layer of security, we're referencing this global table
                                            // instead of just locally storing the allowed groups. Basically, this
                                            // makes it a little harder to 'fool' the game into thinking they're allowed
                                            // This also makes it easier to add more groups, since you only have to
                                            // update the one file instead of updating every one that uses the groups
                                            // You can also use the same global table in other shit you might need it
                                            // just make sure to run the include!

local propertiesToDisable = {
    ["remover"] = true,
    ["gravity"] = true,
    ["bonemanipulate"] = true,
    ["npc_bigger"] = true,
    ["npc_smaller"] = true,
    ["collision"] = true,
    ["persist"] = true,
    ["ignite"] = true,
    ["extinguish"] = true,
    ["keepupright"] = true,
    ["statue"] = true,
    ["unstatue"] = true,
    ["drive"] = true,
    ["skin"] = true,
    ["bodygroups"] = true
}

local function WriteToLog(ply,property,ent)
    if not file.Exists("property_logs", "DATA") then
        file.CreateDir("property_logs")
    end
    if file.Exists("property_logs/"..os.date("%d-%m-%Y")..".txt", "DATA") then
        file.Append("property_logs/"..os.date("%d-%m-%Y")..".txt", "["..os.date("%H:%M:%S").."] :: User "..ply:Nick().." with SteamID "..ply:SteamID().." used property "..string.upper(tostring(property)).." on "..tostring(ent).." at position ("..tostring(ent:GetPos())..")\n")
    elseif not file.Exists("property_logs/"..os.date("%d-%m-%Y")..".txt", "DATA") then
        file.Write("property_logs/"..os.date("%d-%m-%Y")..".txt", "["..os.date("%H:%M:%S").."] :: User "..ply:Nick().." with SteamID "..ply:SteamID().." used property: "..string.upper(tostring(property)).." on "..tostring(ent).." at position ("..tostring(ent:GetPos())..")\n")
    end
end

hook.Add( "CanProperty", "block_remover_property", function( ply, property, ent )
	if (!XGN_GLOBAL_TWEAKS.AdminPrivilegesGroups[ply:GetUserGroup()] && propertiesToDisable[property] ) then
        return false
    end
    WriteToLog(ply,property,ent)
end )

