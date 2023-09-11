local att = {}
att.name = "md_eyesight"
att.displayName = "Using Eyesight 'eyeballing it'"
att.displayNameShort = "Eyesight"
att.SpeedDec = -8
att.FOVModifier = 15
att.aimPos = {"EyeSightPos", "EyeSightAng"}
att.isSight = true

att.statModifiers = {VelocitySensitivityMult = 0.3,
AimSpreadMult = 0.9,
HipSpreadMult = 0.9,
OverallMouseSensMult = 0.28,
DrawSpeedMult = 0.3,
RecoilMult = 0.24}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/eyesight")
	att.description = {[1] = {t = "Not using the scope?", c = CustomizableWeaponry.textColors.REGULAR},
	[2] = {t = "Eyeballing it potentially leaves you suseptable to bad posture..", c = CustomizableWeaponry.textColors.COSMETIC},
	[3] = {t = "this greatly decreases hip fire accuracy and increases recoil slightly.", c = CustomizableWeaponry.textColors.COSMETIC},
	[4] = {t = "Large increase in movement as you get a good grasp of depth.", c = CustomizableWeaponry.textColors.POSITIVE},
	[5] = {t = "Loosened grip leads to faster gun manuverability.", c = CustomizableWeaponry.textColors.POSITIVE},
	[6] = {t = "Without a true sight it becomes hard to aim.", c = CustomizableWeaponry.textColors.NEGATIVE}
	
	}
end

CustomizableWeaponry:registerAttachment(att)