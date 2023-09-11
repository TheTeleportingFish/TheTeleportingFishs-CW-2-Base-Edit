local att = {}
att.name = "bg_regularbarrel"
att.displayName = "Regular barrel"
att.displayNameShort = "Regular"
att.isBG = true


att.statModifiers = {
RecoilMult				= 0.5,
AimSpreadMult			= -0.25,
DrawSpeedMult			= -0.25,
DamageMult				= 5,
OverallMouseSensMult	= -0.05,
FireDelayMult			= 0.25,
ReloadSpeedMult			= -0.05
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/regularbarrel_revolver")
end

function att:attachFunc()

	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:updateSoundTo("CW_MRBEAN_FIRE", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self:updateSoundTo("CW_MRBEAN_FIRE_SUPPRESSED", CustomizableWeaponry.sounds.SUPPRESSED)
end

function att:detachFunc()

	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.short)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)