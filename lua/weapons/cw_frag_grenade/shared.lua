AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Frag Grenade"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "O"
	killicon.AddFont("cw_frag_grenade", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.MoveType = 2
	SWEP.ViewModelMovementScale = 0.8
	SWEP.DisableSprintViewSimulation = true
end

SWEP.CanRestOnObjects = false
SWEP.grenadeEnt = "cw_grenade_thrown"
SWEP.noResupply = true -- for ground control
SWEP.FireDelay = 0.04

local sounds = {{time = 0.2, sound = "CW_PINPULL"}}

SWEP.Animations = {throw = {"throw"},
	pullpin = {"pullpin", "pullpin2", "pullpin3", "pullpin4"},
	idle = "idle",
	draw = "deploy"}
	
SWEP.Sounds = {pullpin = sounds,
	pullpin2 = sounds,
	pullpin3 = sounds,
	pullpin4 = sounds}
	
SWEP.SpeedDec = 5

SWEP.NoFreeAim = true

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.NormalHoldType = "grenade"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"auto"}
SWEP.Base = "cw_grenade_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 50
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/weapons/v_cw_fraggrenade.mdl"
SWEP.WorldModel		= "models/weapons/w_cw_fraggrenade_thrown.mdl"

SWEP.HipSpread = 0.45
SWEP.AimSpread = 0.45
SWEP.VelocitySensitivity = 0.6
SWEP.MaxSpreadInc = 0.1
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.01

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 1
SWEP.Primary.DefaultClip	= 1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "Frag Grenades"

SWEP.swapTime = 0.1