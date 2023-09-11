AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
AddCSLuaFile("sh_bullets.lua")
include("sh_sounds.lua")
include("sh_bullets.lua")

PrecacheParticleSystem( "DirtExplode" )
PrecacheParticleSystem( "GroundExplode" )
PrecacheParticleSystem( "SABOTHIT" )
PrecacheParticleSystem( "SABOTPEN" )
CustomizableWeaponry:registerAmmo(".338 Lapua", ".338 Lapua", 8.58, 100.20)


if CLIENT then
	SWEP.DrawCrosshair = false
	SWEP.PrintName = "Lapuuap 99"
	SWEP.CSMuzzleFlashes = true
	SWEP.ViewModelMovementScale = 0.15
	
	SWEP.IconLetter = "r"
	killicon.AddFont("cw_l115", "CW_KillIcons", SWEP.IconLetter, Color(255, 80, 0, 150))
	
	SWEP.ZoomTextures = {{tex = surface.GetTextureID("sprites/scope_leo"), offset = {0, 1}}}
	SWEP.SimpleTelescopicsFOV = 75
	
	SWEP.MuzzleEffect = "muzzleflash_SR25"
	SWEP.PosBasedMuz = false
	SWEP.SnapToGrip = true
	SWEP.ShellScale = 1
	SWEP.ShellOffsetMul = 2
	SWEP.ShellDelay = 0.1
	SWEP.ShellPosOffset = {x = 0, y = -2, z = 0}
	SWEP.ForeGripOffsetCycle_Draw = 1
	SWEP.ForeGripOffsetCycle_Reload = 1
	SWEP.ForeGripOffsetCycle_Reload_Empty = 1

	SWEP.OverrideAimMouseSens = 0.7
	
	SWEP.DrawTraditionalWorldModel = false
	SWEP.WM = "models/weapons/w_cstm_l96.mdl"
	SWEP.WMPos = Vector(-1, 0, 1.75)
	SWEP.WMAng = Vector(0, 0, 180)
	
	SWEP.M203Pos = Vector(0, 0, 0)
	SWEP.M203Ang = Vector(5, 0, 5)
	
	SWEP.IronsightPos = Vector(-2.678, -2, 0.15)
	SWEP.IronsightAng = Vector(0, 0, 0)
	
	SWEP.ACOGPos = Vector(-1.54, 0, 0.64)
	SWEP.ACOGAng = Vector(0, 0, 10)
	
	SWEP.EyeSightPos = Vector(1, 0, -1)
	SWEP.EyeSightAng = Vector(2, 0, 0)
	
	SWEP.EoTechPos = Vector(-1, 0, 0.23)
	SWEP.EoTechAng = Vector(0, 0, 10)
	
	SWEP.SprintPos = Vector(2, 0, 0)
	SWEP.SprintAng = Vector(-5, 20, 0)
	
	SWEP.AlternativePos = Vector(0.2, 0, -1)
	SWEP.AlternativeAng = Vector(0, 0, 0)
	
	SWEP.M203CameraRotation = {p = -90, y = 0, r = -90}
	
	SWEP.M203OffsetCycle_Reload = 0.7
	SWEP.M203OffsetCycle_Reload_Empty = 0.7
	SWEP.M203OffsetCycle_Draw = 0.1
	
	SWEP.FullAimViewmodelRecoil = true
	SWEP.AimBreathingEnabled = true
	SWEP.CrosshairEnabled = true

		
	SWEP.SwayIntensity = 2.5
	SWEP.AimSwayIntensity = 1
	
	SWEP.CanRestOnObjects = true
	SWEP.CustomizationMenuScale = 0.012

	SWEP.RTAlign = {right = 1.2, up = 0.25, forward = 0}
	--SWEP.ACOGAxisAlign = {right = 1, up = 0, forward = 0}
	SWEP.BaseArm = "Bip01 L Clavicle"
	SWEP.BaseArmBoneOffset = Vector(-50, 0, 0)
	
	SWEP.LuaVMRecoilAxisMod = {vert = 0, hor = 0, roll = 1, forward = 2, pitch = 0.01}
	
	SWEP.M203HoldPos = {
		["Bip01 L Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(-0.75, 3.5, 1.75), angle = Angle(0, 0, 0) }
	}
	
	SWEP.ForeGripHoldPos = {
		["Bip01 L Finger0"] = {pos = Vector(0, 0, 0), angle = Angle(25, 0, 0) },
		["Bip01 L Finger01"] = {pos = Vector(0, 0, 0), angle = Angle(0, 20, 0) },
		["Bip01 L Finger02"] = {pos = Vector(0, 0, 0), angle = Angle(0, 95, 0) },
		
		["Bip01 L Finger1"] = {pos = Vector(0, 0, 0), angle = Angle(-10, 70, 30) },
		["Bip01 L Finger11"] = {pos = Vector(0, 0, 0), angle = Angle(0, 10, 0) },
		["Bip01 L Finger12"] = {pos = Vector(0, 0, 0), angle = Angle(0, -10, 0) },
		
		["Bip01 L Finger2"] = {pos = Vector(0, 0, 0), angle = Angle(0, 20, 30) },
		["Bip01 L Finger21"] = {pos = Vector(0, 0, 0), angle = Angle(0, 30, 0) },
		["Bip01 L Finger22"] = {pos = Vector(0, 0, 0), angle = Angle(0, 20, 0) },
		
		["Bip01 L Finger3"] = {pos = Vector(0, 0, 0), angle = Angle(5, 0, 25) },
		["Bip01 L Finger31"] = {pos = Vector(0, 0, 0), angle = Angle(0, 20, 0) },
		["Bip01 L Finger32"] = {pos = Vector(0, 0, 0), angle = Angle(0, 20, 0) },
		
		["Bip01 L Finger4"] = {pos = Vector(0, 0, 0), angle = Angle(10, -10, 30) },
		["Bip01 L Finger41"] = {pos = Vector(0, 0, 0), angle = Angle(0, 10, 0) },
		["Bip01 L Finger42"] = {pos = Vector(0, 0, 0), angle = Angle(0, 20, 0) },

		["Bip01 L Clavicle"] = {pos = Vector(2.6, 2.8, -5.5), angle = Angle(10, 40, -10) },
		["Bip01 L Forearm"] = {pos = Vector(0, 0, 0), angle = Angle(10, 30, 130) },
		["Bip01 L ForeTwist"] = {pos = Vector(0, 0, 0), angle = Angle(10, 30, 130) },
		["Bip01 L Hand"] = {pos = Vector(0, -0.4, 1.6), angle = Angle(0, 20, 50) }

	

	}
	
	SWEP.AttachmentModelsVM = {
		["bg_carryhandle"] = {model = "models/props_phx/construct/metal_wire1x1.mdl", bone = "lo_body002", pos = Vector(-0.05, 5.5, 2.2), angle = Angle(0, 0, -65), size = Vector(0.03, 0.075, 0.05)},
		["md_saker"] = {model = "models/cw2/attachments/556suppressor.mdl", bone = "lo_body002", pos = Vector(0, 10.8, -0.8), angle = Angle(0, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_m203"] = {model = "models/cw2/attachments/m203.mdl", bone = "lo_body002", pos = Vector(2.3, -8, 4), angle = Angle(0, -90, 0), size = Vector(1, 1, 1), animated = true},
		["md_northpole"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "lo_body002", pos = Vector(0, 30.8, 0.8), angle = Angle(0, 180, 0), size = Vector(0.55, 2, 0.55)},
		["md_foregrip"] = {model = "models/wystan/attachments/foregrip1.mdl", bone = "lo_body002", pos = Vector(3, -3, 0.3), angle = Angle(90, 0, 0), size = Vector(0.75, 0.75, 0.75)},
		["md_thiccym"] = {model = "models/cw2/attachments/9mmsuppressor.mdl", bone = "lo_body002", pos = Vector(0.05, 20, -0.95), angle = Angle(0, 180, 0), size = Vector(2, 3, 2)},
		["bg_luasupportmag"] = {model = "models/Items/BoxSRounds.mdl", bone = "lo_body002", pos = Vector(0.2, 2, 0.8), angle = Angle(90, 180, 0), size = Vector(0.25, 0.5, 0.1)},
		["bg_luaheavymag"] = {model = "models/Items/BoxMRounds.mdl", bone = "lo_body002", pos = Vector(-0.4, 0.5, 0.8), angle = Angle(0, 90, 90), size = Vector(0.6, 0.1, 0.2)},
		["md_acog"] = {model = "models/wystan/attachments/2cog.mdl", bone = "lo_body002", pos = Vector(-3.4, -4.5, -1.5), angle = Angle(-45, 0, 0), size = Vector(0.85, 0.85, 0.85)},
		["md_eotech"] = {model = "models/wystan/attachments/2otech557sight.mdl", bone = "lo_body002", pos = Vector(-8.5, -9, 2.75), angle = Angle(0, -90, -90), size = Vector(0.85, 0.85, 0.85)}
	
		}

end

SWEP.M203ReloadSounds = {[1] = {time = 0.3, sound = "CW_LUAS_M203_SOUNDS"},
	[2] = {time = 0.4, sound = "CW_LUAS_M203_SOUNDS"},
	[3] = {time = 1.4, sound = "CW_LUAS_M203_SOUNDS"},
	[4] = {time = 1.9, sound = "CW_LUAS_M203_SOUNDS"}}

SWEP.recoilRestoreWait = 0.2
SWEP.ForcedHipWaitTime = 0.25 -- this is how much time the player will have to wait before being able to aim again after shooting with SWEP.ForceBackToHipAfterAimedShot set to true


SWEP.MuzzleVelocity = 236 -- in meter/s

SWEP.SightBGs = {main = 2, none = 1}
SWEP.ADSFireAnim = false
SWEP.PreventQuickScoping = false
SWEP.QuickScopeSpreadIncrease = 0.2
SWEP.Attachments = {

[2] = {header = "Barrel", offset = {-150, 300},  atts = {"md_saker", "md_northpole", "md_thiccym" }},
[4] = {header = "Scope Extras", offset = {-150, -100},  atts = {"bg_carryhandle"}},
[3] = {header = "Barrel Extensions", offset = {-150, -500},  atts = {"md_m203","md_foregrip"}},
[1] = {header = "Scope Extensions", offset = {750, -500},  atts = {"md_eotech","md_eyesight"}},--,"md_acog"
["+reload"] = {header = "Ammo", offset = {750, 300}, atts = {"am_2mmkolibri","am_22lrr", "am_magnum", "am_matchgrade", "am_50calrounds", "am_antimaterial", "am_heirounds" }},
["+use"] = {header = "Mag Extension", offset = {1850, -500},  atts = {"bg_luasupportmag", "bg_luaheavymag"} }


}
SWEP.LuaViewmodelRecoil = true
	
SWEP.Animations = {fire = {"idle"},
	reload = "reload",
	idle = "idle",
	draw = "draw"}
	
SWEP.Sounds = {shot = {{time = 0.5, sound = "CW_LUAS_BOLTUP"},
		{time = 0.7, sound = "CW_LUAS_BOLTPULL"},
		{time = 1, sound = "CW_LUAS_BOLTPUSH"},
		{time = 1.35, sound = "CW_LUAS_BOLTDOWN"}},

	draw = {{time = 0, sound = "CW_LUAS_DRAW"}},

	reload = {{time = 0.17, sound = "CW_LUAS_BOLTUP"},
		{time = 0.29, sound = "CW_LUAS_BOLTPULL"},
		
	{time = 1.1, sound = "CW_LUAS_MAGOUT"},
	{time = 1.47, sound = "CW_LUAS_BOLTEND"},
	{time = 2, sound = "CW_LUAS_MAGIN"},
	{time = 2.86, sound = "CW_LUAS_BOLTPUSH"},
	{time = 3.15, sound = "CW_LUAS_BOLTDOWN"},
	{time = 3.3, sound = "CW_LUAS_BOLTEND"}}
}

SWEP.SpeedDec = 30

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.NormalHoldType = "ar2"
SWEP.RunHoldType = "passive"
SWEP.FireModes = {"auto", "3burst", "semi"}
SWEP.Base = "cw_base"
SWEP.Category = "CW 2.0"

SWEP.Author			= "Spy"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

SWEP.ViewModelFOV	= 50
SWEP.ViewModelFlip	= false
SWEP.ViewModel		= "models/cw2/rifles/l96.mdl"
SWEP.WorldModel		= "models/weapons/w_cstm_l96.mdl"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.Primary.ClipSize		= 25
SWEP.Primary.DefaultClip	= 50
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= ".338 Lapua"

SWEP.FireDelay = 0.74

SWEP.FireSound = "CW_LUAS_FIRE"
SWEP.FireSoundSuppressed = "CW_LUAS_FIRE_SUPPRESSED"
SWEP.Recoil = 1.5

SWEP.HipSpread = 0.015
SWEP.AimSpread = 0.0003
SWEP.VelocitySensitivity = 2.5
SWEP.MaxSpreadInc = 0.1
SWEP.SpreadPerShot = 0.005
SWEP.SpreadCooldown = 1.05
SWEP.Shots = 1
SWEP.Damage = 87
SWEP.DeployTime = 3.7
SWEP.HEI = false


SWEP.ReloadSpeed = 1.1
SWEP.ReloadTime = 2.42
SWEP.ReloadTime_Empty = 2.42
SWEP.ReloadHalt = 3.48
SWEP.ReloadHalt_Empty = 3.48


if CLIENT then
	local old, x, y, ang
	local reticle = surface.GetTextureID("sprites/scope_leo")

	local lens = surface.GetTextureID("cw2/gui/lense")
	local lensMat = Material("cw2/gui/lense")
	local cd, alpha = {}, 0.5
	local Ini = true

	-- render target var setup
	cd.x = 0
	cd.y = 0
	cd.w = 512
	cd.h = 512
	cd.fov = 3
	cd.drawviewmodel = false
	cd.drawhud = false
	cd.dopostprocess = false

	function SWEP:RenderTargetFunc()
		local complexTelescopics = self:canUseComplexTelescopics()
		
		-- if we don't have complex telescopics enabled, don't do anything complex, and just set the texture of the lens to a fallback 'lens' texture
		if not complexTelescopics then
			self.TSGlass:SetTexture("$basetexture", lensMat:GetTexture("$basetexture"))
			return
		end
		
		if self.dt.State == CW_AIMING then
			alpha = math.Approach(alpha, 0, FrameTime() * 5)
		else
			alpha = math.Approach(alpha, 1, FrameTime() * 5)
		end
		
		x, y = ScrW(), ScrH()
		old = render.GetRenderTarget()

		ang = self:getTelescopeAngles()
		
		if self.ViewModelFlip then
			ang.r = -self.BlendAng.z
		else
			ang.r = self.BlendAng.z
		end
		
		if not self.freeAimOn then
			ang:RotateAroundAxis(ang:Right(), self.RTAlign.right)
			ang:RotateAroundAxis(ang:Up(), self.RTAlign.up)
			ang:RotateAroundAxis(ang:Forward(), self.RTAlign.forward)
		end
		
		local size = self:getRenderTargetSize()

		cd.w = size
		cd.h = size
		cd.angles = ang
		cd.origin = self.Owner:GetShootPos()
		render.SetRenderTarget(self.ScopeRT)
		render.SetViewPort(0, 0, size, size)
			if alpha < 1 or Ini then
				render.RenderView(cd)
				Ini = false
			end
			
			ang = self.Owner:EyeAngles()
			ang.p = ang.p + self.BlendAng.x
			ang.y = ang.y + self.BlendAng.y
			ang.r = ang.r + self.BlendAng.z
			ang = -ang:Forward()
			
			local light = render.ComputeLighting(self.Owner:GetShootPos(), ang)
			
			cam.Start2D()
				surface.SetDrawColor(255, 255, 255, 255)
				surface.SetTexture(reticle)
				surface.DrawTexturedRect(0, 0, size, size)
				
				surface.SetDrawColor(150 * light[1], 150 * light[2], 150 * light[3], 255 * alpha)
				surface.SetTexture(lens)
				surface.DrawTexturedRectRotated(size * 0.5, size * 0.5, size, size, 90)
			cam.End2D()
		render.SetViewPort(0, 0, x, y)
		render.SetRenderTarget(old)
		
		if self.TSGlass then
			self.TSGlass:SetTexture("$basetexture", self.ScopeRT)
		end
	end
end
