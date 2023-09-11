AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "The Geiger Counter"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IronsightPos = Vector(-2.481, 3.83, 0.908)
	SWEP.IronsightAng = Vector(0.21, -0.401, -5)
	
	SWEP.AimpointPos = Vector(-2.371, -2.59, -0.925)
	SWEP.AimpointAng = Vector(0, 0, 0)
	
	SWEP.EoTechPos = Vector(-2.4, -3.493, -0.98)
	SWEP.EoTechAng = Vector(0, 0, 0)
	
	SWEP.KobraPos = Vector(-2.55, -3.224, -0.026)
	SWEP.KobraAng = Vector(0.717, -0.638, 0)
	
	SWEP.ShortenedPos = Vector(-2.428, -4.005, 0.815)
	SWEP.ShortenedAng = Vector(0, -0.036, 0)
	
	SWEP.RPKPos = Vector(-2.418, -3.481, 0.93)
	SWEP.RPKAng = Vector(0.125, -0.25, 0)
	
	SWEP.SprintPos = Vector(4, -10.28, -12)
	SWEP.SprintAng = Vector(56, 60, 15)
	
	SWEP.PSOPos = Vector(-2.5, 0.65, -0.101)
	SWEP.PSOAng = Vector(0, 0, 0)
	
	SWEP.AlternativePos = Vector(-0.24, 0, -0.48)
	SWEP.AlternativeAng = Vector(0, 0, 0)

	SWEP.ViewModelMovementScale = 0.45
	
	SWEP.IconLetter = "b"
	killicon.AddFont("cw_ak74", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MuzzleEffect = "muzzleflash_ak74"
	SWEP.PosBasedMuz = false
	SWEP.ShellScale = 0.7
	SWEP.ShellOffsetMul = 1
	SWEP.ShellPosOffset = {x = -2, y = 0, z = -3}
	SWEP.SightWithRail = true
	SWEP.ForeGripOffsetCycle_Draw = 0
	SWEP.ForeGripOffsetCycle_Reload = 0.65
	SWEP.ForeGripOffsetCycle_Reload_Empty = 0.9
	
	SWEP.BoltBone = "ak74_Bolt"
	SWEP.BoltShootOffset = Vector(0, -1, 0)
	SWEP.BoltBonePositionRecoverySpeed = 3.5
	SWEP.OffsetBoltOnBipodShoot = true
	SWEP.CustomizationMenuScale = 0.01
	
	SWEP.AttachmentModelsVM = {
		["md_rail"] = {model = "models/wystan/attachments/akrailmount.mdl", bone = "ak74_body", pos = Vector(-0.077, -0.245, 1.041), angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "ak74_body", pos = Vector(11.609, 0.275, -7.834), adjustment = {min = 9, max = 11.609, axis = "x", inverse = true, inverseDisplay = true}, angle = Angle(0, 180, 0), size = Vector(1, 1, 1)},
		["md_aimpoint"] = {model = "models/wystan/attachments/aimpoint.mdl", bone = "ak74_body", pos = Vector(6.6, -0.247, -2.79), adjustment = {min = 4, max = 6.6, axis = "x", inverse = true}, angle = Angle(0, -90, 0), size = Vector(1, 1, 1)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "ak74_body", pos = Vector(9.151, -0.433, -2.721), angle = Angle(0, -90, 0), size = Vector(1.1, 1, 1)},
		["md_pbs1"] = {model = "models/cw2/attachments/pbs1.mdl", bone = "ak74_body", pos = Vector(-16, 0, -0.88), angle = Angle(0, 90, 0), size = Vector(1, 2, 1)},
		["md_kobra"] = {model = "models/cw2/attachments/kobra.mdl", bone = "ak74_body", pos = Vector(0.731, 0.388, -1.538), angle = Angle(0, 90, 0), size = Vector(0.6, 0.6, 0.6)},
		["md_pso1"] = {model = "models/cw2/attachments/pso.mdl", bone = "ak74_body", pos = Vector(5.521, -0.174, -1.107), angle = Angle(0, 90, 0), size = Vector(0.8, 0.8, 0.8)},
		["md_schmidt_shortdot"] = {model = "models/cw2/attachments/schmidt.mdl", bone = "ak74_body", pos = Vector(4.558, -0.302, -1.67), angle = Angle(0, 180, 0), size = Vector(0.8, 0.8, 0.8)}
	}

	SWEP.ShortDotPos = Vector(-2.428, -4.107, -0.721)
	SWEP.ShortDotAng = Vector(0, 0, 0)

	SWEP.ForeGripHoldPos = {
		
		["Left_L_Arm"] = {pos = Vector(1.231, 2.617, -1.206), angle = Angle(0, 0, 54.377) },
		
		["Left_U_Arm"] = {pos = Vector(2.54, 1.8, 0.8), angle = Angle(0, 0, 0) }}
		
	SWEP.PSO1AxisAlign = {right = 0, up = 0.4, forward = -90}
	SWEP.SchmidtShortDotAxisAlign = {right = 0, up = -0.4, forward = 0}
	SWEP.AttachmentPosDependency = {["md_pbs1"] = {["bg_e100_rpkbarrel"] = Vector(-20, 0, -0.816), ["bg_e100_ubarrel"] = Vector(-16.5, 0, -0.88)}}
end




SWEP.MuzzleVelocity = 880 -- in meter/s

SWEP.LuaViewmodelRecoil = true

--SWEP.Attachments = {[1] = {header = "Sight", offset = {300, -50},  atts = {"md_kobra", "md_eotech", "md_aimpoint"}},
--	[2] = {header = "Barrel", offset = {-175, -100}, atts = {"md_pbs1"}},
--	[3] = {header = "Handguard", offset = {-100, 200}, atts = {"md_foregrip"}}}

SWEP.BarrelBGs = {main = 2, rpk = 1, short = 4, regular = 0}
SWEP.StockBGs = {main = 1, regular = 0, heavy = 1, foldable = 2}
SWEP.ReceiverBGs = {main = 3, rpk = 1, regular = 0}
SWEP.MagBGs = {main = 4, regular = 0, rpk = 1}

SWEP.Attachments = {[1] = {header = "Sight", offset = {800, -500},  atts = {"md_kobra", "md_eotech", "md_aimpoint", "md_schmidt_shortdot", "md_pso1"}},
	[2] = {header = "Barrel", offset = {300, -500}, atts = {"md_pbs1"}},
	[3] = {header = "Receiver", offset = {-300, -500}, atts = {"bg_e100_rpkbarrel", "bg_e100_ubarrel"}},
	[4] = {header = "Handguard", offset = {-300, 0}, atts = {"md_foregrip"}, exclusions = {bg_e100_rpkbarrel = true}},
	[5] = {header = "Magazine", offset = {-300, 500}, atts = {"bg_e100rpkmag"}},
	[6] = {header = "Stock", offset = {700, 500}, atts = {"bg_ak74foldablestock", "bg_ak74heavystock"}},
	["+reload"] = {header = "Ammo", offset = {800, 0}, atts = {"am_magnum", "am_matchgrade", "am_geiger"}}}

SWEP.Animations = {fire = {"fire1", "fire2", "fire3"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {	draw = {{time = 0, sound = "CW_FOLEY_MEDIUM"}},

	reload = {[1] = {time = 0.33, sound = "CW_E100_MAGOUT"},
	[2] = {time = 1.13, sound = "CW_E100_MAGIN"},
	[3] = {time = 1.9, sound = "CW_E100_BOLTPULL"}}}

SWEP.SpeedDec = 10

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 50
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/rifles/ak74.mdl"
SWEP.WorldModel		= "models/weapons/w_rif_ak47.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 120
SWEP.Primary.DefaultClip	= 120
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "5.45x39MM"

SWEP.FireDelay = 0.062
SWEP.FireSound = "CW_E100_FIRE"
SWEP.FireSoundSuppressed = "CW_E100_FIRE_SUPPRESSED"
SWEP.Recoil = 1.8

SWEP.HipSpread = 0.013
SWEP.AimSpread = 0.005
SWEP.VelocitySensitivity = 1.6
SWEP.MaxSpreadInc = 0.32
SWEP.SpreadPerShot = 0.002
SWEP.SpreadCooldown = 0.8
SWEP.Shots = 1
SWEP.Damage = 14
SWEP.DeployTime = 0.3

SWEP.ReloadSpeed = 1.8
SWEP.ReloadTime = 1.5
SWEP.ReloadTime_Empty = 3.5
SWEP.ReloadHalt = 1.65
SWEP.ReloadHalt_Empty = 3
SWEP.SnapToIdlePostReload = true