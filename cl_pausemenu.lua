function SetData()
    local name = GetPlayerName(PlayerId())
    local id = GetPlayerServerId(PlayerId())
    local textEntry = string.format('~y~[SERVER] ~w~| ~y~Player ID~w~: %s ~w~| ~y~Player Name~w~: %s', id, name)
    Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', textEntry)
end

Citizen.CreateThread(function()
    SetData()
    while true do
        Citizen.Wait(100)
        SetData()
    end
end)
