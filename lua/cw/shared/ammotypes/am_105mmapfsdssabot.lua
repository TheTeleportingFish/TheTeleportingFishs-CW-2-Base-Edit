local att = {}
att.name = "am_105mmapfsdssabot"
att.displayName = "105mm APFSDS round"
att.displayNameShort = "SABOT"

att.statModifiers = {
DamageMult = 20,
OverallMouseSensMult = -0.3,
FireDelayMult = 2,
AimSpreadMult = -3.99,
RecoilMult = 6.8,
ReloadSpeedMult = -0.26
	}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/105mmapfsdssabot")
	att.description = {
	[1] = {t = "105mm APFSDS SABOT Round used in most modern tanks.", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "105mm APFSDS SABOT Round produces immeasurable damage upon impact.", c = CustomizableWeaponry.textColors.POSITIVE},
	[3] = {t = "Colossal Mass produces horrendous damage.", c = CustomizableWeaponry.textColors.POSITIVE},
	[4] = {t = "Massive Caliber produces horried damage.", c = CustomizableWeaponry.textColors.POSITIVE},
	[5] = {t = "Massively slower component operations.", c = CustomizableWeaponry.textColors.NEGATIVE}
	}
	
end

function att:attachFunc()
	self:EmitSound("CW_MAIN_SABOT_SLIDEIN")
	self.APFSDS = true

	self:setupBallisticsInformation()
	self:CalculateEffectiveRange()
	--print(self.Primary.Ammo)
	self:unloadWeapon()
end

function att:detachFunc()
	self:EmitSound("CW_MAIN_SABOT_SLIDEOUT")
	self.APFSDS = false
	--print(self.Primary.Ammo_Orig)
	self:setupBallisticsInformation()
	self:CalculateEffectiveRange()
	
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)