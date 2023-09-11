local att = {}
att.name = "am_headrounds"
att.displayName = "Poison Headcrab Rounds"
att.displayNameShort = "Head Rounds"

att.statModifiers = {
DamageMult = 3.2,
AimSpreadMult = -0.3,
FireDelayMult = -0.13,
RecoilMult = 0.4,
ClumpSpreadMult = -0.5,
ReloadSpeedMult = 0.1
	}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/headrounds")
	att.description = {
	[1] = {t = "Infused with Headcrab poison to induce maximum damage.", c = CustomizableWeaponry.textColors.POSITIVE},
	[2] = {t = "Reduced round mass leads to faster component operations.", c = CustomizableWeaponry.textColors.POSITIVE}
	}
	
end

function att:attachFunc()
	
	self.ClumpSpread = 0.03
	self.ClumpSpread_Orig = 0.004
	self:unloadWeapon()
end

function att:detachFunc()
	
	self.ClumpSpread = 0.03
	self.ClumpSpread_Orig = 0.03
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)