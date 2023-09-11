local att = {}
att.name = "md_thiccym"
att.displayName = "Thiccy Mouse 4.13 Cal"
att.displayNameShort = "Thicc M."
att.isSuppressor = true

att.statModifiers = {OverallMouseSensMult = -2.5,
RecoilMult			= 1.35,
AimSpreadMult		= -8.90,
DamageMult		= 100}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/saker")
	att.description = {[1] = {t = "W- Huhhh, W- Whuat...", c = CustomizableWeaponry.textColors.COSMETIC},
	[2] = {t = "Is Thicc a good property... Probably...", c = CustomizableWeaponry.textColors.POSITIVE},
	[3] = {t = "Holy shit... What is this made of...", c = CustomizableWeaponry.textColors.NEGATIVE},
	[4] = {t = "Makes the... Well, anything lessen it's 'exist'...", c = CustomizableWeaponry.textColors.NEGATIVE},
	[5] = {t = "BEWARE : BEWARE : BEWARE : BEWARE", c = CustomizableWeaponry.textColors.VNEGATIVE},
	[6] = {t = "BEWARE : Could you not... Ever..?", c = CustomizableWeaponry.textColors.VNEGATIVE}
	}
	
end

function att:attachFunc()

	self.dt.Suppressed = true
	self.HipSpread = 0.1
self.AimSpread = 0.05

end

function att:detachFunc()

	self:resetSuppressorStatus()
	self.HipSpread = self.HipSpread_Orig
self.AimSpread = self.AimSpread_Orig

end

CustomizableWeaponry:registerAttachment(att)