local att = {}
att.name = "bg_longbarrelmr96special"
att.displayName = "Long special barrel"
att.displayNameShort = "L. Special"
att.isBG = true

att.statModifiers = {
RecoilMult				= 1.2,
AimSpreadMult			= -0.90,
DrawSpeedMult			= -0.50,
DamageMult				= 100,
OverallMouseSensMult	= -0.25,
FireDelayMult			= 0.80,
ReloadSpeedMult			= -0.35
}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/longbarrel_revolver")
end

function att:attachFunc()

	self.SprintPos = Vector(0.5, 2, 3)
	self.SprintAng = Vector(-24, 10, -4)
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.long)
	self:updateSoundTo("CW_MRBEAN_FIRE_LONG_SPECIAL", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self:updateSoundTo("CW_MRBEAN_FIRE_SPECIAL_SUPPRESSED", CustomizableWeaponry.sounds.SUPPRESSED)
	self.Sounds = {draw = {{time = 0, sound = "CW_MRBEAN_DRAWSPECIAL"}},

	reload = {[1] = {time = 0.2, sound = "CW_MRBEAN_CYLINDEROPENSPECIAL"},
	[2] = {time = 0.8, sound = "CW_MRBEAN_ROUNDSOUTSPECIAL"},
	[3] = {time = 1.5, sound = "CW_MRBEAN_ROUNDSINSPECIAL"},
	[4] = {time = 2.05, sound = "CW_MRBEAN_CYLINDERCLOSESPECIAL"}}}
	
end

function att:detachFunc()

	self.SprintPos = Vector(-1, -7, -10)
	self.SprintAng = Vector(64, -10, -20)
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.short)
	self:restoreSound()
	self.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_LIGHT"}},

	reload = {[1] = {time = 0.2, sound = "CW_MRBEAN_CYLINDEROPEN"},
	[2] = {time = 0.8, sound = "CW_MRBEAN_ROUNDSOUT"},
	[3] = {time = 1.5, sound = "CW_MRBEAN_ROUNDSIN"},
	[4] = {time = 2.05, sound = "CW_MRBEAN_CYLINDERCLOSE"}}}
end

CustomizableWeaponry:registerAttachment(att)