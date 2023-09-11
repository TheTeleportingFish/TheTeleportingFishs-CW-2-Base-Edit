local function CW20_Grenade_InitPostEntity()
	local ply = LocalPlayer()
	ply.cwFlashbangDuration = 0
	ply.cwFlashbangIntensity = 0
	ply.cwFlashbangDisplayIntensity = 0
	ply.cwFlashDuration = 0
	ply.cwFlashIntensity = 0
	
	ply.cwDeathDuration = 0
	ply.cwDeathIntensity = 0
	ply.cwDeathDisplayIntensity = 0
	ply.cwDeathDuration = 0
	ply.cwDeathIntensity = 0
end

hook.Add("InitPostEntity", "CW20_Grenade_InitPostEntity", CW20_Grenade_InitPostEntity)

local function CW20_RenderScreenspaceEffects()
	local ply = LocalPlayer()
	local curTime = CurTime()
	local frameTime = FrameTime()
	
	if curTime > ply.cwFlashbangDuration then
		ply.cwFlashbangIntensity = math.Approach(ply.cwFlashbangIntensity, 0, frameTime)
	end
	
	ply.cwFlashbangDisplayIntensity = math.Approach(ply.cwFlashbangDisplayIntensity, ply.cwFlashbangIntensity, frameTime * 15)
	
	if curTime > ply.cwFlashDuration then
		ply.cwFlashIntensity = math.Approach(ply.cwFlashIntensity, 0, frameTime)
	end
	
	if ply.cwFlashbangDisplayIntensity > 0 then
		DrawMotionBlur(0.01 * (1 - ply.cwFlashbangDisplayIntensity), ply.cwFlashbangDisplayIntensity, 0)
		
		surface.SetDrawColor(255, 255, 255, 255 * ply.cwFlashIntensity * ply.cwFlashbangDisplayIntensity)
		surface.DrawRect(-1, -1, ScrW() + 2, ScrH() + 2)
	end
	
	
	------------------------------------------------------------
		if curTime > ply.cwDeathDuration then
		ply.cwDeathIntensity = math.Approach(ply.cwDeathIntensity, 0, frameTime)
	end
	
	ply.cwDeathDisplayIntensity = math.Approach(ply.cwDeathDisplayIntensity, ply.cwDeathIntensity, frameTime * 15)
	
	if curTime > ply.cwDeathDuration then
		ply.cwDeathIntensity = math.Approach(ply.cwDeathIntensity, 0, frameTime)
	end
	
	if ply.cwDeathDuration > 0 then
		DrawMotionBlur(0.1, 0.3, 0.1)
		print("help")
		local Vignette = surface.GetTextureID("cw2/effects/vignette")
						
		surface.SetDrawColor(0, 0, 0, 255 )
		surface.SetTexture(Vignette)
		surface.DrawTexturedRect(0, 0, x, y)
		
		surface.SetDrawColor(0, 0, 0, 255 * ply.cwDeathIntensity )
		surface.DrawRect(-1, -1, ScrW() + 2, ScrH() + 2)
	end
	
	
	
end

hook.Add("RenderScreenspaceEffects", "CW20_RenderScreenspaceEffects", CW20_RenderScreenspaceEffects)