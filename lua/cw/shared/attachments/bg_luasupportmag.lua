local att = {}
att.name = "bg_luasupportmag"
att.displayName = "Light Magazine"
att.displayNameShort = "L. Mag"


att.statModifiers = {DamageMult = 1,
ReloadSpeedMult = -0.1,
FireDelayMult = -0.45,
RecoilMult = -0.05,
OverallMouseSensMult = -0.125}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/mrboxmag")
	att.description = {[1] = {t = "Increases mag size to 50 rounds.", c = CustomizableWeaponry.textColors.POSITIVE},

	}
end

function att:attachFunc()

	self:EmitSound("CW_MRBEAN_SUPPORTMAG")
	self:unloadWeapon()
	self.Primary.ClipSize = 50
	self.Primary.ClipSize_Orig = 25
end

function att:detachFunc()

	self:EmitSound("CW_MRBEAN_SUPPORTMAGOUT")
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)