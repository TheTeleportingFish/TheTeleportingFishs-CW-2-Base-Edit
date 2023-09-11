local att = {}
att.name = "bg_longbarrelmr96"
att.displayName = "Long barrel"
att.displayNameShort = "Long"
att.isBG = true

att.statModifiers = {
RecoilMult				= 0.8,
AimSpreadMult			= -0.45,
DrawSpeedMult			= -0.35,
DamageMult				= 10,
OverallMouseSensMult	= -0.15,
FireDelayMult			= 0.50,
ReloadSpeedMult			= -0.20
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/longbarrel_revolver")
end

function att:attachFunc()

	self.SprintPos = Vector(-1, -17, -12)
	self.SprintAng = Vector(64, -10, -20)
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.long)
	self:updateSoundTo("CW_MRBEAN_FIRE_LONG", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self:updateSoundTo("CW_MRBEAN_FIRE_LONG_SUPPRESSED", CustomizableWeaponry.sounds.SUPPRESSED)
end

function att:detachFunc()

	self.SprintPos = Vector(-1, -7, -10)
	self.SprintAng = Vector(64, -10, -20)
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.short)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)