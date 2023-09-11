local att = {}
att.name = "bg_mrsupportmag"
att.displayName = "Support Magazine"
att.displayNameShort = "S. Mag"


att.statModifiers = {DamageMult = 0.30,
ReloadSpeedMult = -0.025,

RecoilMult = -0.10,
OverallMouseSensMult = -0.15}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/mrboxmag")
	att.description = {[1] = {t = "Increases mag size to 20 rounds.", c = CustomizableWeaponry.textColors.POSITIVE},

	}
end

function att:attachFunc()
	self:EmitSound("CW_MRBEAN_SUPPORTMAG")
	self:unloadWeapon()
	self.Primary.ClipSize = 20
	self.Primary.ClipSize_Orig = 20
end

function att:detachFunc()
	self:EmitSound("CW_MRBEAN_SUPPORTMAGOUT")
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)