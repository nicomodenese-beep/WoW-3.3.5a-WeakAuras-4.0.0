function(event, ...)
    -- check all raid members for dead players
    -- Table to store dead player names
    local deadPlayers = {}
    
    -- Function to check the raid or party
    local function checkDeadPlayers()
        -- Clear the table before checking
        deadPlayers = {}
        
        -- Determine if we are in a raid or a party
        local groupType = IsInRaid() and "raid" or "party"
        local groupSize = GetNumGroupMembers()
        
        -- Iterate through group members
        for i = 1, groupSize do
            local unitID = groupType .. i -- "raid1", "raid2", ..., or "party1", "party2", ...
            
            if not UnitIsDeadOrGhost(unitID) then
                -- Skip living players
            elseif UnitName(unitID) then
                -- Add the player's name to the table if they are dead and have a valid name
                table.insert(deadPlayers, UnitName(unitID))
            end
        end
        
        -- If not in a raid, check the player themselves
        if groupType == "party" then
            if UnitIsDeadOrGhost("player") then
                table.insert(deadPlayers, UnitName("player"))
            end
        end
    end
end