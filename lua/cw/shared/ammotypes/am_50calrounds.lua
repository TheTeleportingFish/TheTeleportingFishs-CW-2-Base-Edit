local att = {}
att.name = "am_50calrounds"
att.displayName = "50. Caliber rounds"
att.displayNameShort = "50. Cal"

att.statModifiers = {
DamageMult = 1.3,
AimSpreadMult = -0.9,
FireDelayMult = 0.32,
RecoilMult = 0.7,
ReloadSpeedMult = -0.13
	}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/50calround")
	att.description = {
	[1] = {t = "50. Caliber round used in most MG emplacements as well as Tank Turrets.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Heavy Mass produces increased damage.", c = CustomizableWeaponry.textColors.POSITIVE},
	[3] = {t = "Large Caliber produces increased damage.", c = CustomizableWeaponry.textColors.POSITIVE},
	[4] = {t = "Increased round mass leads to slower component operations.", c = CustomizableWeaponry.textColors.NEGATIVE}

	}
	
end

function att:attachFunc()
	self:EmitSound("CW_MAIN_50CAL_SLIDEIN")
	
	self:unloadWeapon()
end

function att:detachFunc()
	self:EmitSound("CW_MAIN_50CAL_SLIDEOUT")
	
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)