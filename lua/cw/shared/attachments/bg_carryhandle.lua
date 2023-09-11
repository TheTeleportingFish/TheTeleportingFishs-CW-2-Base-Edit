local att = {}
att.name = "bg_carryhandle"
att.displayName = "Carry Handle"
att.displayNameShort = "Handle"
att.isBG = true

att.statModifiers = {
RecoilMult = -0.1,
OverallMouseSensMult = -0.1,
DrawSpeedMult = 0.25
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/foldsight")
	att.description = {
	[1] = {t = "Carry Handle for your rifle, Makes it look cool I guess...", c = CustomizableWeaponry.textColors.COSMETIC},
	[2] = {t = "Makes it a lot easier to unholster.", c = CustomizableWeaponry.textColors.POSITIVE
	}}
	
	
	
end

CustomizableWeaponry:registerAttachment(att)