local att = {}
att.name = "bg_e100rpkmag"
att.displayName = "RPK Magazine"
att.displayNameShort = "RPK Mag"
att.isBG = true

att.statModifiers = {ReloadSpeedMult = -0.5,
OverallMouseSensMult = -0.25}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/rpkmag")
	att.description = {[1] = {t = "Increases mag size to 185 rounds.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.rpk)
	self:unloadWeapon()
	self.Primary.ClipSize = 185
	self.Primary.ClipSize_Orig = 185
end

function att:detachFunc()
	self:setBodygroup(self.MagBGs.main, self.MagBGs.regular)
	self:unloadWeapon()
	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL
end

CustomizableWeaponry:registerAttachment(att)