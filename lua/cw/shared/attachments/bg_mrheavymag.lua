local att = {}
att.name = "bg_mrheavymag"
att.displayName = "Heavy Magazine"
att.displayNameShort = "H. Mag"


att.statModifiers = {DamageMult = 2.30,
ReloadSpeedMult = -0.05,

RecoilMult = -0.3,
OverallMouseSensMult = -0.25}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/mrboxmag")
	att.description = {[1] = {t = "Increases mag size to 36 rounds.", c = CustomizableWeaponry.textColors.POSITIVE},

	}
end

function att:attachFunc()
	self:EmitSound("CW_MRBEAN_HEAVYMAG")
	self:unloadWeapon()
	self.Primary.ClipSize = 36
	self.Primary.ClipSize_Orig = 36
end

function att:detachFunc()
	self:EmitSound("CW_MRBEAN_HEAVYMAGOUT")
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)