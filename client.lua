local HUD_ELEMENTS = {
    HUD = 0, 
    HUD_WANTED_STARS = 1,
    HUD_WEAPON_ICON = 2,
    HUD_CASH = 3,
    HUD_MP_CASH = 4,
    HUD_MP_MESSAGE = 5,
    HUD_VEHICLE_NAME = 6,
    HUD_AREA_NAME = 7,
    HUD_VEHICLE_CLASS = 8,
    HUD_STREET_NAME = 9,
    HUD_HELP_TEXT = 10,
    HUD_FLOATING_HELP_TEXT_1 = 11,
    HUD_FLOATING_HELP_TEXT_2 = 12,
    HUD_CASH_CHANGE = 13,
    HUD_RETICLE = 14,
    HUD_SUBTITLE_TEXT = 15,
    HUD_SAVING_GAME = 17,
    HUD_GAME_STREAM = 18,
    MAX_SCRIPTED_HUD_COMPONENTS = 141
}

function SetData()
    local name = GetPlayerName(PlayerId())
    local id = GetPlayerServerId(PlayerId())
    local textEntry = string.format('~b~[~w~Server #1~b~] ~w~| ~b~Player ID~w~: %s ~w~| ~b~Player Name~w~: %s', id, name)
    Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', textEntry)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) 
        SetData()
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for _, val in pairs(HUD_ELEMENTS) do 
            if val ~= nil and type(val) == "number" then 
                HideHudComponentThisFrame(val) 
            end
        end
    end
end)
