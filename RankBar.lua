local hudComponent = 19
local XPStartLimit = 0
local XPEndLimit = 1000
local PreviousXP = 0
local CurrentXP = 0
local PlayerRank = 1
local modifier = 0.2
local enabled = true

RegisterNetEvent("rankBar:Enabled")
AddEventHandler("rankBar:Enabled", function (toggle)
    enabled = toggle
end)

RegisterNetEvent("rankBar:SetPlayerRank")
AddEventHandler("rankBar:SetPlayerRank", function (value)
    if value ~= nil then
        PlayerRank = value
    end
end)

RegisterNetEvent("rankBar:SetPlayerXP")
AddEventHandler("rankBar:SetPlayerXP", function (value)
    if value ~= nil then
        PreviousXP = value
        CurrentXP = value
    end
end)

RegisterNetEvent("rankBar:AddXP")
AddEventHandler("rankBar:AddXP", function (value)
    if value ~= nil then
        PreviousXP = PreviousXP + value
        CurrentXP = CurrentXP + value
    end
end)

RegisterNetEvent("rankBar:RemoveXP")
AddEventHandler("rankBar:RemoveXP", function (value)
    if value ~= nil then
        PreviousXP = PreviousXP - value
        CurrentXP = CurrentXP - value
    end
end)

function LoadScaleformHud()
    print("CLIENT: Requesting Rank Bar Hud Component..")
    local start = GetGameTimer()
    local time = 5000;
    RequestHudScaleform(hudComponent)
    while not HasHudScaleformLoaded(hudComponent) do
        if GetGameTimer() > start + time then
            print("CLIENT: Timed out while loading Rank Bar Hud Component.")
            return
        end
        Citizen.Wait(0) 
    end
    print("CLIENT: Loaded Rank Bar Hud Component.")
end

function DeleteScaleformHud()
    if HasHudScaleformLoaded(hudComponent) then
        RemoveScaleformScriptHudMovie(hudComponent)
    end
end

function CalculateXP(playerRank)
    return (1000 + (playerRank - 1) * 125) * playerRank
end

function CurrentExpLvl(exp)
return modifier * math.sqrt(exp)
end

function SetColor(mainColor, secordaryColor)
BeginScaleformMovieMethodHudComponent(hudComponent, "SET_COLOUR")
ScaleformMovieMethodAddParamInt(mainColor)
ScaleformMovieMethodAddParamInt(secordaryColor)
EndScaleformMovieMethod()
end

function StayOnScreen()
BeginScaleformMovieMethodHudComponent(hudComponent, "STAY_ON_SCREEN")
EndScaleformMovieMethod()
end

function ResetMovie()
BeginScaleformMovieMethodHudComponent(hudComponent, "RESET_MOVIE")
EndScaleformMovieMethod()
end

function BeforeDraw()
SetRankScores(XPStartLimit, XPEndLimit, PreviousXP, CurrentXP, PlayerRank)
end

function SetRankScores(xpStartLimit, xpEndLimit, previousXp, currentXp, playerRank)
BeginScaleformMovieMethodHudComponent(hudComponent, "SET_RANK_SCORES")
ScaleformMovieMethodAddParamInt(xpStartLimit)
ScaleformMovieMethodAddParamInt(xpEndLimit)
ScaleformMovieMethodAddParamInt(previousXp)
ScaleformMovieMethodAddParamInt(currentXp)
ScaleformMovieMethodAddParamInt(playerRank)
ScaleformMovieMethodAddParamInt(100)
ScaleformMovieMethodAddParamInt(playerRank + 1)
EndScaleformMovieMethod()
end

function Update()
    if not IsHudHidden() then
        if IsControlJustPressed(0, 20) or PreviousXP ~= CurrentXP then
        XPStartLimit = CalculateXP(PlayerRank - 1)
        XPEndLimit = CalculateXP(PlayerRank)
        LoadScaleformHud()
        SetColor(116, 123)
        BeginScaleformMovieMethodHudComponent(hudComponent, "OVERRIDE_ANIMATION_SPEED")
        ScaleformMovieMethodAddParamInt(2000)
        EndScaleformMovieMethod()
        BeginScaleformMovieMethodHudComponent(hudComponent, "OVERRIDE_ONSCREEN_DURATION")
        ScaleformMovieMethodAddParamInt(6000)
        EndScaleformMovieMethod()
        BeforeDraw()
        PreviousXP = CurrentXP
       end
       if CurrentXP >= XPEndLimit then
        XPStartLimit = CalculateXP(PlayerRank - 1)
        XPEndLimit = CalculateXP(PlayerRank)
        LoadScaleformHud()
        SetColor(116, 123)
        BeginScaleformMovieMethodHudComponent(hudComponent, "OVERRIDE_ANIMATION_SPEED")
        ScaleformMovieMethodAddParamInt(2000)
        EndScaleformMovieMethod()
        BeginScaleformMovieMethodHudComponent(hudComponent, "OVERRIDE_ONSCREEN_DURATION")
        ScaleformMovieMethodAddParamInt(6000)
        EndScaleformMovieMethod()
        BeforeDraw()
        PlayerRank = PlayerRank + 1
        PlaySoundFrontend(-1, "MP_RANK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
        BeginScaleformMovieMethodHudComponent(hudComponent, "OVERRIDE_ANIMATION_SPEED")
        ScaleformMovieMethodAddParamInt(2000)
        EndScaleformMovieMethod()
        BeginScaleformMovieMethodHudComponent(hudComponent, "OVERRIDE_ONSCREEN_DURATION")
        ScaleformMovieMethodAddParamInt(6000)
        EndScaleformMovieMethod()
        SetColor(116, 123)
        BeginScaleformMovieMethodHudComponent(hudComponent, "SET_RANK_SCORES")
        ScaleformMovieMethodAddParamInt(XPStartLimit)
        ScaleformMovieMethodAddParamInt(XPEndLimit)
        ScaleformMovieMethodAddParamInt(PreviousXP)
        ScaleformMovieMethodAddParamInt(CurrentXP)
        ScaleformMovieMethodAddParamInt(PlayerRank)
        ScaleformMovieMethodAddParamInt(100)
        EndScaleformMovieMethod()
        ResetMovie()
        XPStartLimit = CalculateXP(PlayerRank - 1)
        XPEndLimit = CalculateXP(PlayerRank)
        BeginScaleformMovieMethodHudComponent(hudComponent, "OVERRIDE_ANIMATION_SPEED")
        ScaleformMovieMethodAddParamInt(2000)
        EndScaleformMovieMethod()
        BeginScaleformMovieMethodHudComponent(hudComponent, "OVERRIDE_ONSCREEN_DURATION")
        ScaleformMovieMethodAddParamInt(6000)
        EndScaleformMovieMethod()
        SetColor(116, 123) 
       end
    end

    if not IsScriptedHudComponentActive(hudComponent) and HasHudScaleformLoaded(hudComponent) then
        DeleteScaleformHud()
    end
end

if enabled then
    Citizen.CreateThread(function ()
    while true do
        Update()
        Citizen.Wait(0)
    end
    end)

end
