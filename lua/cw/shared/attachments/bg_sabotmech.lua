local att = {}
att.name = "bg_sabotmech"
att.displayName = "SABOT Mechanized Autoloader"
att.displayNameShort = "APFSDS. Mech."
att.isSuppressor = true


att.statModifiers = {DamageMult = 1,
FireDelayMult = -0.7,
ReloadSpeedMult = 0.80,
RecoilMult = -0.5,
OverallMouseSensMult = -0.25}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/mrboxmag")
	att.description = {
	[1] = {t = "Suspension systems provides ease from recoil.", c = CustomizableWeaponry.textColors.POSITIVE},
	[2] = {t = "Look out for 'Negative Recoil'!", c = CustomizableWeaponry.textColors.COSMETIC},
	[3] = {t = "Increases mag size to a small... 3 rounds...", c = CustomizableWeaponry.textColors.VNEGATIVE}

	}
end

function att:attachFunc()
	self.dt.Suppressed = true
	self:EmitSound("CW_MRBEAN_SABOTAT")
	self:unloadWeapon()
	self.Primary.ClipSize = 3
	self.Primary.ClipSize_Orig = 3


end

function att:detachFunc()
	self:resetSuppressorStatus()
	self:EmitSound("CW_MRBEAN_SABOTDE")
	self:unloadWeapon()


	self.Primary.ClipSize = self.Primary.ClipSize_ORIG_REAL
	self.Primary.ClipSize_Orig = self.Primary.ClipSize_ORIG_REAL

end

CustomizableWeaponry:registerAttachment(att)