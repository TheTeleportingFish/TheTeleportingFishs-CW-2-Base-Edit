local att = {}
att.name = "am_barnaclerounds"
att.displayName = "Barnacle rounds"
att.displayNameShort = "Barn"

att.statModifiers = {
DamageMult = 0.5,
AimSpreadMult = -0.5,
FireDelayMult = -0.5,
RecoilMult = -0.5,
ReloadSpeedMult = 0.5
	}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/barnaclerounds")
	att.description = {
	[1] = {t = "The Special Barnacle bullet for Barnacle-Chan.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Barnacle-Chan loves this bullet a lot.", c = CustomizableWeaponry.textColors.COSMETIC},
	[3] = {t = "Barnacle-Chan loves this bullet so properties recieve 2x buff.", c = CustomizableWeaponry.textColors.POSITIVE}
	}
	
end

function att:attachFunc()
	self:unloadWeapon()
	self:updateSoundTo("CW_ZEEB_MEATFIRE", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self:updateSoundTo("CW_ZEEB_MEATFIRE_SUPPRESSED", CustomizableWeaponry.sounds.SUPPRESSED)
	
end

function att:detachFunc()
	self:unloadWeapon()
	self:restoreSound()
	
end

CustomizableWeaponry:registerAttachment(att)