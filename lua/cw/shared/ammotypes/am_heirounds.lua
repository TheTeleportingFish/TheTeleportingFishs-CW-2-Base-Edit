local att = {}
att.name = "am_heirounds"
att.displayName = "Anti-Material HEI rounds"
att.displayNameShort = "HEI"

att.statModifiers = {
DamageMult = 1.3,
AimSpreadMult = -0.92,
FireDelayMult = 0.41,
RecoilMult = 0.73,
ReloadSpeedMult = -0.2
	}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/heiround")
	att.description = {
	[1] = {t = "Anti-Material HEI Round stands for High Explosive Incendiary.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "HEI Round produces massive damage upon impact.", c = CustomizableWeaponry.textColors.POSITIVE},
	[3] = {t = "Heavy Mass produces increased damage.", c = CustomizableWeaponry.textColors.POSITIVE},
	[4] = {t = "Large Caliber produces increased damage.", c = CustomizableWeaponry.textColors.POSITIVE},
	[5] = {t = "Increased round mass leads to slower component operations.", c = CustomizableWeaponry.textColors.NEGATIVE}
	}
	
end

function att:attachFunc()
	self:EmitSound("CW_MAIN_50CAL_SLIDEIN")
	self.HEI = true
	self.HEIDamage = 56
	self.Shots = 1

	self:unloadWeapon()
end

function att:detachFunc()
	self:EmitSound("CW_MAIN_50CAL_SLIDEOUT")
	self.HEI = false
	self.HEIDamage = 0
	self.Shots = self.Shots_Orig

	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)