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
    HUD_RADIO_STATIONS = 16,
    HUD_SAVING_GAME = 17,
    HUD_GAME_STREAM = 18,
    HUD_WEAPON_WHEEL = 19,
    HUD_WEAPON_WHEEL_STATS = 20,
    MAX_HUD_COMPONENTS = 21,
    MAX_HUD_WEAPONS = 22,
    MAX_SCRIPTED_HUD_COMPONENTS = 141
}

local function SetData()
    local name = GetPlayerName(PlayerId())
    local id = GetPlayerServerId(PlayerId())
    local textEntry = string.format('~b~[~w~vMenu #1~b~] ~w~| ~b~Player ID~w~: %s ~w~| ~b~Player Name~w~: %s', id, name)
    Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), 'FE_THDR_GTAO', textEntry)
end

Citizen.CreateThread(function()
    SetData()
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
                if val == HUD_ELEMENTS.HUD or val == HUD_ELEMENTS.HUD_HELP_TEXT or val == HUD_ELEMENTS.HUD_FLOATING_HELP_TEXT_1 or val == HUD_ELEMENTS.HUD_FLOATING_HELP_TEXT_2 or val == HUD_ELEMENTS.HUD_SUBTITLE_TEXT or val == HUD_ELEMENTS.HUD_RADIO_STATIONS or val == HUD_ELEMENTS.HUD_SAVING_GAME or val == HUD_ELEMENTS.HUD_GAME_STREAM or val == HUD_ELEMENTS.HUD_WEAPON_WHEEL or val == HUD_ELEMENTS.HUD_WEAPON_WHEEL_STATS then
                    ShowHudComponentThisFrame(val)
                else
                    HideHudComponentThisFrame(val) 
                end
            end
        end
    end
end)
