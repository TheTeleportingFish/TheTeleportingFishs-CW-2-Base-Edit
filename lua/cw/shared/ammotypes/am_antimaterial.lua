local att = {}
att.name = "am_antimaterial"
att.displayName = "Anti-Material API rounds"
att.displayNameShort = "API"

att.statModifiers = {
DamageMult = 6.3,
AimSpreadMult = -0.93,
FireDelayMult = 0.42,
RecoilMult = 0.72,
ReloadSpeedMult = -0.19
	}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/antimaterial")
	att.description = {
	[1] = {t = "Anti-Material API Round stands for Armor Piercing Incendiary.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "API Round produces massive damage upon impact.", c = CustomizableWeaponry.textColors.POSITIVE},
	[3] = {t = "Heavy Mass produces increased damage.", c = CustomizableWeaponry.textColors.POSITIVE},
	[4] = {t = "Large Caliber produces increased damage.", c = CustomizableWeaponry.textColors.POSITIVE},
	[5] = {t = "Increased round mass leads to slower component operations.", c = CustomizableWeaponry.textColors.NEGATIVE},
	[6] = {t = "Getting Close to Penetration sparks can burn...", c = CustomizableWeaponry.textColors.VNEGATIVE}
	}
	
end

function att:attachFunc()
	self:EmitSound("CW_MAIN_50CAL_SLIDEIN")
	self.API = true
	self.HEIDamage = 56
	self.Shots = 1
	self:unloadWeapon()
end

function att:detachFunc()
	self:EmitSound("CW_MAIN_50CAL_SLIDEOUT")
	self.API = false
	self.HEIDamage = 56
	self.Shots = self.Shots_Orig
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)