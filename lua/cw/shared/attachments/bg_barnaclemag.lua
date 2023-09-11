local att = {}
att.name = "bg_barnaclemag"
att.displayName = "Barnacle Meat"
att.displayNameShort = "Meat Mag"
att.isBG = true
att.SpeedDec = 120

att.statModifiers = {DamageMult = 0.06,
VelocitySensitivityMult = 1.84,
ReloadSpeedMult = -0.3,
AimSpreadMult = -0.12,
RecoilMult = 0.18,
OverallMouseSensMult = -0.55}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/rpkmag")
	att.description = {
	[1] = {t = "Increases mag size to 235 rounds.", c = CustomizableWeaponry.textColors.POSITIVE},
	[2] = {t = "Increases nutrient consumption by Barnacle-Chan.", c = CustomizableWeaponry.textColors.POSITIVE},
	[3] = {t = "Takes longer for her to feed on mag.", c = CustomizableWeaponry.textColors.NEGATIVE},
	[4] = {t = "Meat Mag provides so many nutrients that it is heavy.", c = CustomizableWeaponry.textColors.VNEGATIVE}
	
	}
end

function att:attachFunc()

	self.CaseLength = 73
	self.BulletDiameter = 8
	self:unloadWeapon()
	self.Primary.ClipSize = 235
	self.Primary.ClipSize_Orig = 235
	self:updateSoundTo("CW_ZEEB_MEATFIRE", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self:updateSoundTo("CW_ZEEB_MEATFIRE_SUPPRESSED", CustomizableWeaponry.sounds.SUPPRESSED)
	
end

function att:detachFunc()

	self.CaseLength = 19
	self.BulletDiameter = 9
	self:unloadWeapon()
	self:restoreSound()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
	
end

CustomizableWeaponry:registerAttachment(att)