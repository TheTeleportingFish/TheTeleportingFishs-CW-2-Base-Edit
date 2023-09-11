local function CW_Flashbanged(data)
	local intensity = data:ReadFloat()
	local duration = data:ReadFloat()
	
	LocalPlayer():cwFlashbang(intensity, duration)
end

usermessage.Hook("CW_FLASHBANGED", CW_Flashbanged)

local function CW_Deathbanged(data)
	local intensity = data:ReadFloat()
	local duration = data:ReadFloat()
	
	LocalPlayer():cwDeathbang(intensity, duration)
end

usermessage.Hook("CW_DEATHBANGED", CW_Deathbanged)

