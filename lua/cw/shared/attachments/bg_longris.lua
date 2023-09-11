local att = {}
att.name = "bg_alongris"
att.displayName = "Long barrel RIS"
att.displayNameShort = "EXT RIS"
att.isBG = true
att.SpeedDec = 3

att.statModifiers = {DamageMult = 0.4,
AimSpreadMult = -0.3,
RecoilMult = 0.35,
OverallMouseSensMult = -0.4}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15longris")
	att.description = {[1] = {t = "A rail interface for long barrels.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Allows additional attachments.", c = CustomizableWeaponry.textColors.POSITIVE}}
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.longris)
	self:updateSoundTo("CW_AA222_LONGBARREL_FIRE", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self:updateSoundTo("CW_AA222_LONGBARREL_FIRE_SUPPRESSED", CustomizableWeaponry.sounds.SUPPRESSED)
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
end

CustomizableWeaponry:registerAttachment(att)