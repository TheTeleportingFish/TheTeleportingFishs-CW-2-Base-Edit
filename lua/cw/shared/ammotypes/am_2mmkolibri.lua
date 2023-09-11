local att = {}
att.name = "am_2mmkolibri"
att.displayName = "2mm Kolibri"
att.displayNameShort = "Kolibri"

att.statModifiers = {DamageMult = -0.95,
AimSpreadMult = -0.1,
ReloadSpeedMult = 0.30,
FireDelayMult = -0.45,
RecoilMult = -0.75}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/kolibri")
	att.description = {[1] = {t = "Very Light, Very Small caliber bullet.", c = CustomizableWeaponry.textColors.REGULAR},}
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