local handle
local speed = 0.0
local depth = 0.1
local pos = 0.1
local temp = 0.0
local visible = false

function LoadScaleform()
    print("CLIENT: Requesting Drilling Scaleform..")
    local start = GetGameTimer()
    local time = 5000
    handle = RequestScaleformMovie("DRILLING")
    while not HasScaleformMovieLoaded(handle) do
        if GetGameTimer() > start + time then
            print("CLIENT: Timed out while loading Scaleform Movie 'DRILLING'.")
        end
        Citizen.Wait(0)
    end
    print("CLIENT: Loaded Drilling Scaleform.")
end

function DeleteScaleform()
    if HasScaleformMovieLoaded(handle) then
        SetScaleformMovieAsNoLongerNeeded(handle)
        handle = 0
    end

    print("CLIENT: Cleaned up Drilling Scaleform.")
end

function Draw()
if HasScaleformMovieLoaded(handle) then
BeginScaleformMovieMethod(handle, "SET_SPEED")
ScaleformMovieMethodAddParamFloat(speed)
ScaleformMovieMethodAddParamFloat(-1)
ScaleformMovieMethodAddParamFloat(-1)
ScaleformMovieMethodAddParamFloat(-1)
ScaleformMovieMethodAddParamFloat(-1)
EndScaleformMovieMethod()
BeginScaleformMovieMethod(handle, "SET_HOLE_DEPTH")
ScaleformMovieMethodAddParamFloat(depth)
ScaleformMovieMethodAddParamFloat(-1)
ScaleformMovieMethodAddParamFloat(-1)
ScaleformMovieMethodAddParamFloat(-1)
ScaleformMovieMethodAddParamFloat(-1)
EndScaleformMovieMethod()
BeginScaleformMovieMethod(handle, "SET_DRILL_POSITION")
ScaleformMovieMethodAddParamFloat(pos)
ScaleformMovieMethodAddParamFloat(-1)
ScaleformMovieMethodAddParamFloat(-1)
ScaleformMovieMethodAddParamFloat(-1)
ScaleformMovieMethodAddParamFloat(-1)
EndScaleformMovieMethod()
BeginScaleformMovieMethod(handle, "SET_TEMPERATURE")
ScaleformMovieMethodAddParamFloat(temp)
ScaleformMovieMethodAddParamFloat(-1)
ScaleformMovieMethodAddParamFloat(-1)
ScaleformMovieMethodAddParamFloat(-1)
ScaleformMovieMethodAddParamFloat(-1)
EndScaleformMovieMethod()
DrawScaleformMovieFullscreen(handle, 255, 255, 255, 255, 0)
end
end

RegisterNetEvent("drilling:SetVisible")
AddEventHandler("drilling:SetVisible", function (value)
    if value == true then
    LoadScaleform()
    else
    DeleteScaleform()
    end
    visible = value
end)

Citizen.CreateThread(function ()
    while true do
        if visible then
            Draw()
        end
        Citizen.Wait(0)
    end

end)
