AddCSLuaFile()
AddCSLuaFile("cl_player_funcs.lua")
AddCSLuaFile("cl_umsgs.lua")

local lotsagrenade

if CLIENT then
	include("cl_umsgs.lua")
	include("cl_player_funcs.lua")
	
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Grenade base"
	SWEP.CSMuzzleFlashes = true
	
	SWEP.IconLetter = "f"
	killicon.AddFont("cw_deagle", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.ViewModelMovementScale = 0.8
	SWEP.DisableSprintViewSimulation = true
end

SWEP.CanRestOnObjects = false
	
SWEP.Attachments = {}
SWEP.Sounds = {}

SWEP.SpeedDec = 5

SWEP.Slot = 1
SWEP.SlotPos = 0
SWEP.NormalHoldType = "grenade"
SWEP.RunHoldType = "normal"
SWEP.FireModes = {"auto"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 60
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= ""
SWEP.WorldModel		= ""

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.Primary.ClipSize		= 1
SWEP.Primary.DefaultClip	= 1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= ""

SWEP.SprintingEnabled = true
SWEP.AimingEnabled = true
SWEP.CanCustomize = false

SWEP.HipSpread = 0.45
SWEP.AimSpread = 0.45
SWEP.VelocitySensitivity = 0.6
SWEP.MaxSpreadInc = 0.1
SWEP.SpreadPerShot = 0.01
SWEP.SpreadCooldown = 0.01
SWEP.Shots = 3
SWEP.Damage = 56
SWEP.DeployTime = 0.1

SWEP.ReloadSpeed = 0.01
SWEP.ReloadTime = 1.98
SWEP.ReloadHalt = 2.49

lotsagrenade = 1

SWEP.ReloadTime_Empty = 1.98
SWEP.ReloadHalt_Empty = 3.4

SWEP.timeToThrow = 0.2
SWEP.swapTime = 0.1
SWEP.fuseTime = 3

function SWEP:Reload()
end

function SWEP:IndividualThink()
	local curTime = CurTime()
	
	if self.pinPulled then
		if curTime > self.throwTime then
			if self.Owner:KeyDown(IN_ATTACK) then
				if not self.animPlayed then
					self.entityTime = CurTime() + 0.001
					self:sendWeaponAnim("throw")
					self:SetPlaybackRate( 10 )
					self.Owner:SetAnimation(PLAYER_ATTACK1)
				end
				
				if curTime > self.entityTime then
					if SERVER then
						for i = 1, lotsagrenade do
						
						local grenade = ents.Create(self.grenadeEnt)
						grenade:SetPos(self.Owner:GetShootPos() + Vector(math.random(-10,10),math.random(-10,10),math.random(-10,10)) + CustomizableWeaponry.quickGrenade:getThrowOffset(self.Owner))
						grenade:SetAngles(self.Owner:EyeAngles())
						grenade:Spawn()
						grenade:Activate()
						grenade:Fuse(self.fuseTime)
						grenade:SetOwner(self.Owner)
						CustomizableWeaponry.quickGrenade:applyThrowVelocity(self.Owner, grenade,math.random(800, 1500),Vector(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50)))
						self:TakePrimaryAmmo(1)
						
						end
					end
					
					self:SetNextPrimaryFire(curTime + 0.01)
					
					timer.Simple(self.swapTime, function()
						if IsValid(self) then
							if self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0 then -- we're out of ammo, strip this weapon
								self.Owner:ConCommand("lastinv")
							else
								self:sendWeaponAnim("draw")
							end
						end
					end)
					
					self.pinPulled = false
				end
				
				self.animPlayed = true
			end
		end
	end
end

function SWEP:PrimaryAttack()
	if self.Owner:GetAmmoCount(self.Primary.Ammo) == 0 and self:Clip1() == 0 then
		return
	end

	if self.pinPulled then
		return
	end
	
	for i = 1, 8 do
		if not self:canFireWeapon(i) then
			return
		end
	end
	
	self.pinPulled = true
	self.animPlayed = false
	self.throwTime = CurTime() + self.timeToThrow
	self:sendWeaponAnim("pullpin")
end

function SWEP:SecondaryAttack()
end