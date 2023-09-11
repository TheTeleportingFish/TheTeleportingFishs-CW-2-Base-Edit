local att = {}
att.name = "md_northpole"
att.displayName = "North Pole 45."
att.displayNameShort = "N. Pole"
att.isSuppressor = true

att.statModifiers = {OverallMouseSensMult = -0.5,
RecoilMult = -0.35,
AimSpreadMult = -2.90,
DamageMult = 10.05}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/saker")
	att.description = {[1] = {t = "Suppresses existance.", c = CustomizableWeaponry.textColors.COSMETIC},
	[2] = {t = "Technically this makes the barrel longer... sooo...", c = CustomizableWeaponry.textColors.POSITIVE},
	[3] = {t = "Holy shit... This is heavy.", c = CustomizableWeaponry.textColors.NEGATIVE},
	[4] = {t = "Makes the sound... less silent.", c = CustomizableWeaponry.textColors.NEGATIVE},
	[5] = {t = "BEWARE : Could possibly suppress the user...", c = CustomizableWeaponry.textColors.VNEGATIVE},
	[6] = {t = "BEWARE : Could possibly break the face...", c = CustomizableWeaponry.textColors.VNEGATIVE}
	}
	
end

function att:attachFunc()

	self.dt.Suppressed = true
	self.HipSpread = 0.01
	self.AimSpread = 0.005

end

function att:detachFunc()

	self:resetSuppressorStatus()
	self.HipSpread = self.HipSpread_Orig
self.AimSpread = self.AimSpread_Orig

end

CustomizableWeaponry:registerAttachment(att)