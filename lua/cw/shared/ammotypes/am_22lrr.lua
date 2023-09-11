local att = {}
att.name = "am_22lrr"
att.displayName = ".22 Long Rifle rounds"
att.displayNameShort = ".22 LRR"

att.statModifiers = {DamageMult = -0.45,
AimSpreadMult = -0.80,
ReloadSpeedMult = 0.15,
FireDelayMult = -0.25,
RecoilMult = -0.35}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/22lrr")
	att.description = {[1] = {t = "Light, Accurate, Small caliber bullet.", c = CustomizableWeaponry.textColors.REGULAR},}
end

function att:attachFunc()
	self:EmitSound("CW_MAIN_22LRR_SLIDEIN")
	
	self:unloadWeapon()
end

function att:detachFunc()
	self:EmitSound("CW_MAIN_22LRR_SLIDEOUT")
	
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)