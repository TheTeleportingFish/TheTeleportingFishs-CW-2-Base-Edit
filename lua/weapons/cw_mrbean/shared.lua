AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_bullets.lua")
include("sh_sounds.lua")
include("sh_bullets.lua")


PrecacheParticleSystem( "SABOTHIT" )
PrecacheParticleSystem( "SABOTPEN" )
CustomizableWeaponry:registerAmmo("105mm SABOT", "105mm SABOT Rounds", 10.45, 85.590)

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Mr.Bean"
	SWEP.CSMuzzleFlashes = true
	
	
	SWEP.SelectIcon = surface.GetTextureID("weaponicons/mr96")
	killicon.Add("cw_mr96", "weaponicons/mr96", Color(255, 80, 0, 150))
	
	SWEP.ViewModelMovementScale = 0.15
	
	SWEP.MuzzleEffect = "muzzleflash_6"
	SWEP.PosBasedMuz = false
	SWEP.NoShells = true
	SWEP.M203OffsetCycle_Reload = 0.93
	SWEP.M203OffsetCycle_Reload_Empty = 0.93
	SWEP.M203OffsetCycle_Draw = 0.96
	SWEP.ForeGripOffsetCycle_Draw = 0.96
	SWEP.ForeGripOffsetCycle_Reload = 0.96
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.96
		
	SWEP.IronsightPos = Vector(-1.731, 1, 0.36)
	SWEP.IronsightAng = Vector(0, 0, -0.977)
	
	SWEP.M203Pos = Vector(0, 0, -2)
	SWEP.M203Ang = Vector(20, 0, 0)
	
	SWEP.ACOGPos = Vector(-1.731, -5, -0.93)
	SWEP.ACOGAng = Vector(0.79, 0, 0)
	
	SWEP.EyeSightPos = Vector(-1, 0, -0.5)
	SWEP.EyeSightAng = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-1.731, -5, -0.70)
	SWEP.EoTechAng = Vector(0.79, 0, 0)
	
	SWEP.ShortDotPos = Vector(-1.731, -5, -0.63)
	SWEP.ShortDotAng = Vector(0.79, 0, 0)
	
	SWEP.SprintPos = Vector(-1, -7, -10)
	SWEP.SprintAng = Vector(64, -10, -20)
	
	SWEP.AlternativePos = Vector(0.319, 1.325, -1.04)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.ViewModelMovementScale = 0.3
	SWEP.FullAimViewmodelRecoil = true
	SWEP.HUD_MagText = "CYLINDER: "
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	SWEP.ACOGAxisAlign = {right = -0.5, up = 0, forward = 0}
	SWEP.SchmidtShortDotAxisAlign = {right = -2, up = 0, forward = 0}
	SWEP.SightWithRail = true
		
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
		
	SWEP.SwayIntensity = 3
	SWEP.AimSwayIntensity = 1
		
	SWEP.AttachmentModelsVM = {
	["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "MR96", pos = Vector(-0.38, -5.1, -2.05), angle = Angle(0, 0, 0), adjustment = {min = -5.1, max = 1.5, axis = "y", inverseOffsetCalc = true}, size = Vector(0.85, 0.85, 0.85)},
	["bg_mrrail"] = {model = "models/XQM/CoasterTrack/straight_4.mdl", bone = "MR96", pos = Vector(-0.06, 3.5, 2.48), angle = Angle(0, 90, 180), size = Vector(0.015, 0.0125, 0.02)},
	["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "MR96", pos = Vector(2.3, -9.2, 4.57), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), animated = true},
	["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "MR96", pos = Vector(3, -6, 0.9), angle = Angle(90, 0, 0), size = Vector(0.75, 0.75, 0.75)},
	["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "MR96", pos = Vector(0, -2.96, 0.83), angle = Angle(0, 0, 0), size = Vector(0.4, 0.4, 0.4)},
	["md_tundra9mm"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "MR96", pos = Vector(0, 9.75, 1.3), angle = Angle(0, 180, 0), size = Vector(0.6, 0.6, 0.6)},
	["md_northpole"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "MR96", pos = Vector(0, 15.25, 1.4), angle = Angle(0, 180, 0), size = Vector(0.55, 2, 0.55)},
	["bg_mrsupportmag"] = {model = "models/Items/BoxSRounds.mdl", bone = "MR96", pos = Vector(1, 1.1, 1.5), angle = Angle(0, -90, 10), size = Vector(0.1, 0.1, 0.1)},
	["bg_mrheavymag"] = {model = "models/Items/BoxMRounds.mdl", bone = "MR96", pos = Vector(0.75, 2.2, 2), angle = Angle(0, -90, 90), size = Vector(0.25, 0.05, 0.05)},
	["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "MR96", pos = Vector(-0.37, -5.1, -2.075), angle = Angle(0, -90, 0), adjustment = {min = -5.1, max = 1.5, axis = "y", inverseOffsetCalc = true}, size = Vector(0.85, 0.85, 0.85)},
	["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "MR96", pos = Vector(0.175, -9.5, -6.35), angle = Angle(0, -90, 0), adjustment = {min = -9.5, max = -3.5, axis = "y", inverseOffsetCalc = true}, size = Vector(0.85, 0.85, 0.85)},
	["bg_sabotmech"] = {model = "models/Items/car_battery01.mdl", bone = "MR96", pos = Vector(-0.05, 2, 2), angle = Angle(0, -90, 0), size = Vector(0.2, 0.05, 0.05)}
	
	
	}
	
	SWEP.AttachmentPosDependency = {["md_saker"] = {["bg_regularbarrel"] = Vector(0, -1.83, 0.83)}}
	
	SWEP.M203HoldPos = {
		["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 11, 0), angle = Angle(0, 0, 0) }
	}
	
	SWEP.ForeGripHoldPos = {
		["Bip01 L Finger0"] = {pos = Vector(0, 0, 0), angle = Angle(33.303, 1.07, 0) },
		["Bip01 L Finger01"] = {pos = Vector(0, 0, 0), angle = Angle(0, 19.94, 0) },
		["Bip01 L Finger02"] = {pos = Vector(0, 0, 0), angle = Angle(0, 96.544, 0) },
		
		["Bip01 L Finger1"] = {pos = Vector(0, 0, 0), angle = Angle(-4.395, 80, 22.27) },
		["Bip01 L Finger11"] = {pos = Vector(0, 0, 0), angle = Angle(0, 30, 0) },
		["Bip01 L Finger12"] = {pos = Vector(0, 0, 0), angle = Angle(0, 58.242, 0) },
		
		["Bip01 L Finger2"] = {pos = Vector(0, 0, 0), angle = Angle(-4.395, 70, 28.6) },
		["Bip01 L Finger21"] = {pos = Vector(0, 0, 0), angle = Angle(0, 30, 0) },
		["Bip01 L Finger22"] = {pos = Vector(0, 0, 0), angle = Angle(0, 58.242, 0) },
		
		["Bip01 L Finger3"] = {pos = Vector(0, 0, 0), angle = Angle(-4.395, 70, 27.155) },
		["Bip01 L Finger31"] = {pos = Vector(0, 0, 0), angle = Angle(0, 30, 0) },
		["Bip01 L Finger32"] = {pos = Vector(0, 0, 0), angle = Angle(0, 58.242, 0) },
		
		["Bip01 L Finger4"] = {pos = Vector(0, 0, 0), angle = Angle(-4.395, 70, 42.478) },
		["Bip01 L Finger41"] = {pos = Vector(0, 0, 0), angle = Angle(0, 30, 0) },
		["Bip01 L Finger42"] = {pos = Vector(0, 0, 0), angle = Angle(0, 58.242, 0) },

		["Bip01 L Clavicle"] = {pos = Vector(2.2, 5.15, -1.9), angle = Angle(30, 10, -20) },
		["Bip01 L Forearm"] = {pos = Vector(0, 0, 0), angle = Angle(10, 30, 50) },
		["Bip01 L ForeTwist"] = {pos = Vector(0, 0, 0), angle = Angle(10, 30, 50) },
		["Bip01 L Hand"] = {pos = Vector(-0.1, -0.9, -0.1), angle = Angle(0, 40, 50) }



	}

	SWEP.AimBreathingEnabled = true
	SWEP.CrosshairEnabled = true
	SWEP.AimViewModelFOV = 55
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0.2, hor = 0.1, roll = 10, forward = 2, pitch = 4}
	SWEP.CustomizationMenuScale = 0.007
	SWEP.DisableSprintViewSimulation = true
end




SWEP.ShootWhileProne = true

SWEP.MuzzleVelocity = 414 -- in meter/s, assuming round is a 165 grain JHP

SWEP.BarrelBGs = {main = 1, regular = 1, long = 2, special = 3, short = 0}
SWEP.LuaViewmodelRecoil = true
SWEP.CanRestOnObjects = true

SWEP.Attachments = {
[1] = {header = "Barrel Extensions", offset = {750, -600},  atts = {"md_eotech","md_acog","md_schmidt_shortdot"}},
[2] = {header = "Barrel Base Dependencies", offset = {-400, -900},  atts = {"bg_mrrail","md_eyesight"}},
[3] = {header = "Barrel", offset = {750, -200},  atts = {"bg_regularbarrel", "bg_longbarrelmr96", "bg_longbarrelmr96special"}},
[4] = {header = "Barrel Suppression", offset = {750, 300},  atts = {"md_tundra9mm" ,"md_saker", "md_northpole" }},
[5] = {header = "M203 Base", offset = {-1000, -200},  atts = {"md_m203"}},
[6] = {header = "M203 Extension", offset = {-1000, -700},  atts = {"md_foregrip"}},

["+use"] = {header = "Mag Extension", offset = {-100, -200},  atts = {"bg_mrsupportmag", "bg_mrheavymag", "bg_sabotmech"} },
["+reload"] = {header = "Ammo", offset = {-1000, 300}, atts = {"am_22lrr", "am_matchgrade", "am_magnum", "am_50calrounds", "am_antimaterial", "am_heirounds", "am_105mmapfsdssabot"}}

}

	SWEP.AttachmentDependencies = {
	["md_m203"] = {"bg_longbarrelmr96", "bg_longbarrelmr96special"}, 
	["md_foregrip"] = {"md_m203"},
	["md_tundra9mm"] = {"bg_longbarrelmr96"},
	["md_northpole"] = {"bg_longbarrelmr96"},
	["md_acog"] = {"bg_mrrail"},
	["md_eotech"] = {"bg_mrrail"},
	["md_schmidt_shortdot"] = {"bg_mrrail"}

	
	} -- this is on a PER ATTACHMENT basis, NOTE: the exclusions and dependencies in the Attachments table is PER CATEGORY
	
	SWEP.AttachmentExclusions = {
	["md_saker"] = {"bg_longbarrelmr96", "bg_longbarrelmr96special", "bg_sabotmech"},
	["md_tundra9mm"] = {"bg_sabotmech"},
	["md_northpole"] = {"bg_sabotmech"},
	["bg_sabotmech"] = {"md_northpole","md_tundra9mm","md_saker"}
	}
	
SWEP.Animations = {fire = {"shoot1", "shoot2"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {draw = {{time = 0, sound = "CW_FOLEY_LIGHT"}},

	reload = {[1] = {time = 0.2, sound = "CW_MRBEAN_CYLINDEROPEN"},
	[2] = {time = 0.8, sound = "CW_MRBEAN_ROUNDSOUT"},
	[3] = {time = 1.5, sound = "CW_MRBEAN_ROUNDSIN"},
	[4] = {time = 2.05, sound = "CW_MRBEAN_CYLINDERCLOSE"}}}

SWEP.M203ReloadSounds = {[1] = {time = 0.3, sound = "CW_MRBEAN_M203_OPEN"},
	[2] = {time = 0.4, sound = "CW_MRBEAN_M203_REMOVE"},
	[3] = {time = 1.4, sound = "CW_MRBEAN_M203_INSERT"},
	[4] = {time = 1.9, sound = "CW_MRBEAN_M203_CLOSE"}}
	
SWEP.SpeedDec = 10

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "revolver"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"auto","semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 65
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/pistols/mr96.mdl"
SWEP.WorldModel		= "models/weapons/w_357.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 12
SWEP.Primary.DefaultClip	= 12
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= ".44 Magnum"

SWEP.FireDelay = 0.40
SWEP.FireSound = "CW_MRBEAN_FIRE_SHORT"
SWEP.FireSoundSuppressed = "CW_MRBEAN_FIRE_SHORT_SUPPRESSED"
SWEP.Recoil = 1.6

SWEP.HipSpread = 0.029
SWEP.AimSpread = 0.01
SWEP.VelocitySensitivity = 1.35
SWEP.MaxSpreadInc = 0.06
SWEP.SpreadPerShot = 0.02
SWEP.SpreadCooldown = 0.25
SWEP.Shots = 1
SWEP.Damage = 10
SWEP.DeployTime = 0.7
SWEP.Chamberable = false

SWEP.ReloadSpeed = 1
SWEP.ReloadTime = 2.5
SWEP.ReloadHalt = 3

SWEP.ReloadTime_Empty = 2.5
SWEP.ReloadHalt_Empty = 3


