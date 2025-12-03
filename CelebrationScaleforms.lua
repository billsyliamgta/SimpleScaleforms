local bg, fg, main
local wallId = "CELEB_HEIST"
local wallId2 = "intro"

function LoadHeistCelebScaleforms()
    print("CLIENT: Requesting Heist Celeb Scaleforms..")
    local start = GetGameTimer()
    local time = 5000;
    bg = RequestScaleformMovie("HEIST_CELEBRATION_BG")
    while not HasScaleformMovieLoaded(bg) do
        if GetGameTimer() > start + time then
            print("CLIENT: Timed out while loading Scaleform Movie 'HEIST_CELEBRATION_BG'.")
            return
        end
        Citizen.Wait(0)
    end
    start = GetGameTimer()
    time = 5000
    fg = RequestScaleformMovie("HEIST_CELEBRATION_FG")
    while not HasScaleformMovieLoaded(fg) do
        if GetGameTimer() > start + time then
            print("CLIENT: Timed out while loading Scaleform Movie 'HEIST_CELEBRATION_FG'.")
            return
        end
        Citizen.Wait(0)
    end
    start = GetGameTimer()
    time = 5000
    main = RequestScaleformMovie("HEIST_CELEBRATION")
    while not HasScaleformMovieLoaded(main) do
        if GetGameTimer() > start + time then
            print("CLIENT: Timed out while loading Scaleform Movie 'HEIST_CELEBRATION'.")
            return
        end
        Citizen.Wait(0)
    end
    print("CLIENT: Loaded Heist Celeb Scaleforms.")
end

function DeleteScaleforms()
    if HasScaleformMovieLoaded(bg) then
        SetScaleformMovieAsNoLongerNeeded(bg)
        bg = 0
    end

    if HasScaleformMovieLoaded(fg) then
        SetScaleformMovieAsNoLongerNeeded(fg)
        fg = 0
    end

    if HasScaleformMovieLoaded(main) then
        SetScaleformMovieAsNoLongerNeeded(main)
        main = 0
    end

    print("CLIENT: Cleaned up Celebration Scaleforms.")
end

RegisterNetEvent("celeb:ShowPassed")
AddEventHandler("celeb:ShowPassed", function (smallText, bigText, bgColour, cash, rp, previousRp, xpStartLimit, xpEndLimit, playerLevel)
    ShowPassed(smallText, bigText, bgColour, cash, rp, previousRp, xpStartLimit, xpEndLimit, playerLevel)
end)

function ShowPassed(smallText, bigText, bgColour, cash, rp, previousRp, xpStartLimit, xpEndLimit, playerLevel)
    AnimpostfxStopAll()
    DisplayHud(false)
    DisplayRadar(false)
    SetAudioFlag("LoadMPData", true)
    ReleaseNamedScriptAudioBank("HUD_321_GO")
    RequestScriptAudioBank("HUD_321_GO", false)
    TogglePausedRenderphases(false)
    LoadHeistCelebScaleforms()

    BeginScaleformMovieMethod(bg, "CLEANUP")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(fg, "CLEANUP")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(main, "CLEANUP")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(bg, "CREATE_STAT_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(bgColour)
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(fg, "CREATE_STAT_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(bgColour)
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(main, "CREATE_STAT_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(bgColour)
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(bg, "ADD_MISSION_RESULT_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(smallText)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(bigText)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamBool(true)
    ScaleformMovieMethodAddParamBool(true)
    ScaleformMovieMethodAddParamBool(true)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(fg, "ADD_MISSION_RESULT_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(smallText)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(bigText)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamBool(true)
    ScaleformMovieMethodAddParamBool(true)
    ScaleformMovieMethodAddParamBool(true)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(main, "ADD_MISSION_RESULT_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(smallText)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(bigText)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamBool(true)
    ScaleformMovieMethodAddParamBool(true)
    ScaleformMovieMethodAddParamBool(true)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(bg, "CREATE_STAT_TABLE")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("CELEB_PSCORE")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(fg, "CREATE_STAT_TABLE")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("CELEB_PSCORE")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(main, "CREATE_STAT_TABLE")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("CELEB_PSCORE")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(bg, "ADD_STAT_TABLE_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("CELEB_PSCORE")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(fg, "ADD_STAT_TABLE_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("CELEB_PSCORE")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(main, "ADD_STAT_TABLE_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("CELEB_PSCORE")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()
     
    BeginScaleformMovieMethod(bg, "CREATE_INCREMENTAL_CASH_ANIMATION")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("SUMMARY")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(fg, "CREATE_INCREMENTAL_CASH_ANIMATION")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("SUMMARY")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(main, "CREATE_INCREMENTAL_CASH_ANIMATION")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("SUMMARY")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(bg, "ADD_INCREMENTAL_CASH_WON_STEP")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("SUMMARY")
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(cash)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("TOTAL CASH EARNED")
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(3)
    ScaleformMovieMethodAddParamInt(3)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(fg, "ADD_INCREMENTAL_CASH_WON_STEP")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("SUMMARY")
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(cash)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("TOTAL CASH EARNED")
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(3)
    ScaleformMovieMethodAddParamInt(3)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(main, "ADD_INCREMENTAL_CASH_WON_STEP")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("SUMMARY")
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(cash)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("TOTAL CASH EARNED")
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(3)
    ScaleformMovieMethodAddParamInt(3)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(bg, "ADD_INCREMENTAL_CASH_ANIMATION_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("SUMMARY")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(fg, "ADD_INCREMENTAL_CASH_ANIMATION_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("SUMMARY")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(main, "ADD_INCREMENTAL_CASH_ANIMATION_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("SUMMARY")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(bg, "ADD_JOB_POINTS_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(0)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(fg, "ADD_JOB_POINTS_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(0)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(main, "ADD_JOB_POINTS_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(0)
    ScaleformMovieMethodAddParamInt(0)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(bg, "ADD_REP_POINTS_AND_RANK_BAR_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(rp) -- RP
    ScaleformMovieMethodAddParamInt(previousRp) -- Previous RP
    ScaleformMovieMethodAddParamInt(xpStartLimit) -- XP Start Limit
    ScaleformMovieMethodAddParamInt(xpEndLimit) -- XP End Limit
    ScaleformMovieMethodAddParamInt(playerLevel) -- Player Level
    ScaleformMovieMethodAddParamInt(playerLevel + 1) -- The next Player Level
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("Rank") -- 'Rank' text goes however if its undefined it'll use the GXT entry of it instead
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("Up") -- 'Up' text goes however if its undefined it'll use the GXT entry of it instead
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(fg, "ADD_REP_POINTS_AND_RANK_BAR_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(rp) -- RP
    ScaleformMovieMethodAddParamInt(previousRp) -- Previous RP
    ScaleformMovieMethodAddParamInt(xpStartLimit) -- XP Start Limit
    ScaleformMovieMethodAddParamInt(xpEndLimit) -- XP End Limit
    ScaleformMovieMethodAddParamInt(playerLevel) -- Player Level
    ScaleformMovieMethodAddParamInt(playerLevel + 1) -- The next Player Level
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("Rank") -- 'Rank' text goes however if its undefined it'll use the GXT entry of it instead
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("Up") -- 'Up' text goes however if its undefined it'll use the GXT entry of it instead
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(main, "ADD_REP_POINTS_AND_RANK_BAR_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(rp) -- RP
    ScaleformMovieMethodAddParamInt(previousRp) -- Previous RP
    ScaleformMovieMethodAddParamInt(xpStartLimit) -- XP Start Limit
    ScaleformMovieMethodAddParamInt(xpEndLimit) -- XP End Limit
    ScaleformMovieMethodAddParamInt(playerLevel) -- Player Level
    ScaleformMovieMethodAddParamInt(playerLevel + 1) -- The next Player Level
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("Rank") 
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("Up")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(bg, "ADD_BACKGROUND_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(70) -- Alpha
    ScaleformMovieMethodAddParamInt(2) -- Texture Id
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(fg, "ADD_BACKGROUND_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(70) -- Alpha
    ScaleformMovieMethodAddParamInt(2) -- Texture Id
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(main, "ADD_BACKGROUND_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(70) -- Alpha
    ScaleformMovieMethodAddParamInt(2) -- Texture Id
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(bg, "SHOW_STAT_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(fg, "SHOW_STAT_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(main, "SHOW_STAT_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId)
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    local start = GetGameTimer()
    local time = 14000
    while GetGameTimer() < start + time do
        DrawScaleformMovieFullscreenMasked(bg, fg, 255, 255, 255, 255)
        DrawScaleformMovieFullscreen(main, 255, 255, 255, 255, 0)
        Citizen.Wait(0)
    end
    
    DeleteScaleforms()
    ReleaseNamedScriptAudioBank("HUD_321_GO")
    DisplayHud(true)
    DisplayRadar(true)
    TogglePausedRenderphases(true)
    TriggerEvent("cs:ShowPassed:onComplete", source)
end

function LoadJobIntroScaleforms()
print("CLIENT: Requesting Job Intro Scaleforms..")
    local start = GetGameTimer()
    local time = 5000;
    bg = RequestScaleformMovie("MP_CELEBRATION_BG")
    while not HasScaleformMovieLoaded(bg) do
        if GetGameTimer() > start + time then
            print("CLIENT: Timed out while loading Scaleform Movie 'MP_CELEBRATION_BG'.")
            return
        end
        Citizen.Wait(0)
    end
    start = GetGameTimer()
    time = 5000
    fg = RequestScaleformMovie("MP_CELEBRATION_FG")
    while not HasScaleformMovieLoaded(fg) do
        if GetGameTimer() > start + time then
            print("CLIENT: Timed out while loading Scaleform Movie 'MP_CELEBRATION_FG'.")
            return
        end
        Citizen.Wait(0)
    end
    start = GetGameTimer()
    time = 5000
    main = RequestScaleformMovie("MP_CELEBRATION")
    while not HasScaleformMovieLoaded(main) do
        if GetGameTimer() > start + time then
            print("CLIENT: Timed out while loading Scaleform Movie 'MP_CELEBRATION'.")
            return
        end
        Citizen.Wait(0)
    end
    print("CLIENT: Loaded Job Intro Scaleforms.")
end

function ShowJobIntro(title, type, colour)
    AnimpostfxStopAll()
    DisplayHud(false)
    DisplayRadar(false)
    SetAudioFlag("LoadMPData", true)
    LoadJobIntroScaleforms()    
    BeginScaleformMovieMethod(bg, "CLEANUP")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId2)
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(fg, "CLEANUP")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId2)
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(main, "CLEANUP")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId2)
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(bg, "CREATE_STAT_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId2)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(colour)
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(-1)
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(fg, "CREATE_STAT_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId2)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(colour)
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(-1)
    EndScaleformMovieMethod()
    BeginScaleformMovieMethod(main, "CREATE_STAT_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId2)
    EndTextCommandScaleformString()
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(colour)
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(-1)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(bg, "ADD_INTRO_TO_WALL")
    -- wallId
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId2)
    EndTextCommandScaleformString()
    -- modelLabel
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(type)
    EndTextCommandScaleformString()
    -- jobName
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(title)
    EndTextCommandScaleformString()
    -- challenegeTextLabel
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    -- challengePartsText
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    -- targetTypeTextLabel
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    -- targetValue
    ScaleformMovieMethodAddParamInt(0)
    -- targetValuePrefix
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    --modelLabelIsStringLiteral
    ScaleformMovieMethodAddParamInt(1)
    -- textColourName
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("HUD_COLOUR_PURE_WHITE")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(fg, "ADD_INTRO_TO_WALL")
    -- wallId
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId2)
    EndTextCommandScaleformString()
    -- modelLabel
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(type)
    EndTextCommandScaleformString()
    -- jobName
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(title)
    EndTextCommandScaleformString()
    -- challenegeTextLabel
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    -- challengePartsText
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    -- targetTypeTextLabel
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    -- targetValue
    ScaleformMovieMethodAddParamInt(0)
    -- targetValuePrefix
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    --modelLabelIsStringLiteral
    ScaleformMovieMethodAddParamInt(1)
    -- textColourName
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("HUD_COLOUR_PURE_WHITE")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(main, "ADD_INTRO_TO_WALL")
    -- wallId
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId2)
    EndTextCommandScaleformString()
    -- modelLabel
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(type)
    EndTextCommandScaleformString()
    -- jobName
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(title)
    EndTextCommandScaleformString()
    -- challenegeTextLabel
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    -- challengePartsText
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    -- targetTypeTextLabel
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    -- targetValue
    ScaleformMovieMethodAddParamInt(0)
    -- targetValuePrefix
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("")
    EndTextCommandScaleformString()
    --modelLabelIsStringLiteral
    ScaleformMovieMethodAddParamInt(1)
    -- textColourName
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName("HUD_COLOUR_PURE_WHITE")
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(bg, "ADD_BACKGROUND_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId2)
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(70) -- Alpha
    ScaleformMovieMethodAddParamInt(0) -- Texture Id
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(fg, "ADD_BACKGROUND_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId2)
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(70) -- Alpha
    ScaleformMovieMethodAddParamInt(0) -- Texture Id
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(main, "ADD_BACKGROUND_TO_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId2)
    EndTextCommandScaleformString()
    ScaleformMovieMethodAddParamInt(70) -- Alpha
    ScaleformMovieMethodAddParamInt(0) -- Texture Id
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(bg, "SHOW_STAT_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId2)
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(fg, "SHOW_STAT_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId2)
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(main, "SHOW_STAT_WALL")
    BeginTextCommandScaleformString("STRING")
    AddTextComponentSubstringPlayerName(wallId2)
    EndTextCommandScaleformString()
    EndScaleformMovieMethod()

    local start = GetGameTimer()
    local time = 350
    while GetGameTimer() < start + time do
        DrawScaleformMovieFullscreenMasked(bg, fg, 255, 255, 255, 255)
        DrawScaleformMovieFullscreen(main, 255, 255, 255, 255, 0)
        Citizen.Wait(0)
    end
    PlaySoundFrontend(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", true)
    start = GetGameTimer()
    time = 2500
    while GetGameTimer() < start + time do
        DrawScaleformMovieFullscreenMasked(bg, fg, 255, 255, 255, 255)
        DrawScaleformMovieFullscreen(main, 255, 255, 255, 255, 0)
        Citizen.Wait(0)
    end
    DeleteScaleform()
    DisplayHud(true)
    DisplayRadar(true)
end

RegisterNetEvent("celeb:ShowJobIntro")
AddEventHandler("celeb:ShowJobIntro", function (title, type, colour)
    ShowJobIntro(title, type, colour)
end)

Citizen.CreateThread(function()
    while true do
        Wait(0) -- Prevents freezing the game
        if IsControlJustPressed(0, 51) then
            TriggerEvent("cs:ShowJobIntro", "Belle cock and balls torture", "CELEB_MISSION", "HUD_COLOUR_RED")
        end
    end
end)

exports('celeb:ShowPassed', ShowPassed)

exports('celeb:ShowJobIntro', ShowJobIntro)
