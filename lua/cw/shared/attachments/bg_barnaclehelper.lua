local att = {}
att.name = "bg_barnaclehelper"
att.displayName = "Heavy Embrace"
att.displayNameShort = "H. Embrace"
att.isBG = true
att.SpeedDec = -320

att.statModifiers = {DamageMult = 0.15,
VelocitySensitivityMult = -2.69,
RecoilMult = -0.35,
ReloadSpeedMult = -0.28,
HipSpreadMult = -0.78,
OverallMouseSensMult = 0.69}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/ar15heavystock")
	att.description = {
	[1] = {t = "Barnacle-Chan makes running feel easier somehow.", c = CustomizableWeaponry.textColors.COSMETIC},
	[2] = {t = "Barnacle-Chan makes turning the gun feel easier.", c = CustomizableWeaponry.textColors.COSMETIC},
	[3] = {t = "Barnacle-Chan loves you and lets you fondle her better", c = CustomizableWeaponry.textColors.VPOSITIVE},
	[4] = {t = "Barnacle-Chan helps keep your shoulder steady.", c = CustomizableWeaponry.textColors.POSITIVE},
	[5] = {t = "Her Embrace helps against recoil.", c = CustomizableWeaponry.textColors.POSITIVE},
	[6] = {t = "Her Embrace helps with fondling her better.", c = CustomizableWeaponry.textColors.POSITIVE},
	[7] = {t = "Running Speed is buffed.", c = CustomizableWeaponry.textColors.POSITIVE},
	[8] = {t = "Stock smells like rotting flesh..", c = CustomizableWeaponry.textColors.VNEGATIVE},
	[9] = {t = "Barnacle-Chan's tongue is wet and slimey...", c = CustomizableWeaponry.textColors.VNEGATIVE}
	
	}
end

function att:attachFunc()

self.HolsterUnderwater = false
self.HolsterOnLadder = false

		self.Sounds = {draw = {{time = 0, sound = "CW_ZEEB_EMBRACE2"}},

	reload_full = {[1] = {time = 0.6, sound = "CW_ZEEB_EMBRACE3"},
	[2] = {time = 0.9, sound = "CW_ZEEB_EMBRACE2"},
	[3] = {time = 2.3, sound = "CW_ZEEB_EMBRACE4"}},
	
	reload = {[1] = {time = 0.6, sound = "CW_ZEEB_EMBRACE4"},
	[2] = {time = 1.55, sound = "CW_ZEEB_EMBRACE1"},
	[3] = {time = 1.7, sound = "CW_ZEEB_EMBRACE3"},
	[4] = {time = 3.1, sound = "CW_ZEEB_EMBRACE4"},
	[5] = {time = 3.85, sound = "CW_ZEEB_EMBRACE1"}}}
end

function att:detachFunc()

self.HolsterUnderwater = true
self.HolsterOnLadder = true

		self.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload_full = {[1] = {time = 0.6, sound = "CW_ZEEB_HANDLE"},
	[2] = {time = 0.9, sound = "CW_ZEEB_MAGOUT"},
	[3] = {time = 2.3, sound = "CW_ZEEB_MAGIN"}},
	
	reload = {[1] = {time = 0.6, sound = "CW_ZEEB_BOLTBACK"},
	[2] = {time = 1.55, sound = "CW_ZEEB_HANDLE"},
	[3] = {time = 1.7, sound = "CW_ZEEB_MAGOUT"},
	[4] = {time = 3.1, sound = "CW_ZEEB_MAGIN"},
	[5] = {time = 3.85, sound = "CW_ZEEB_BOLTFORWARD"}}}
end

CustomizableWeaponry:registerAttachment(att)