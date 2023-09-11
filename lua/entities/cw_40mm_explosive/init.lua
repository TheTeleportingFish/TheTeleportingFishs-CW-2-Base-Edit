AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.BlastDamage = 200
ENT.BlastRadius = 500

function ENT:Initialize()
	self:SetModel("models/Items/AR2_Grenade.mdl") 
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_NONE)
	local phys = self:GetPhysicsObject()

	if phys and phys:IsValid() then
		phys:Wake()
	end
	
	self:GetPhysicsObject():SetBuoyancyRatio(0)
	self.ArmTime = CurTime() + 0.2
	
	spd = physenv.GetPerformanceSettings()
    spd.MaxVelocity = 2996
	
    physenv.SetPerformanceSettings(spd)
end

function ENT:Use(activator, caller)
	return false
end

function ENT:OnRemove()
	return false
end 

local vel, len

local traceData = {}
traceData.mask = bit.bor(CONTENTS_SOLID, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, CONTENTS_WATER)

function ENT:PhysicsCollide(data, physobj)
	if self.dt.Misfire then
		vel = physobj:GetVelocity()
		len = vel:Length()
		
		if len > 500 then
			physobj:SetVelocity(vel * 0.6)
		end
	
		return
	end
	
	if CurTime() > self.ArmTime then
		util.BlastDamage(self, self:GetOwner(), self:GetPos(), self.BlastRadius, self.BlastDamage)
					
					
			for key, obj in ipairs(player.GetAll()) do
						if obj:Alive() then

								
						traceData.filter = obj
						


	
						local direction = (self:GetPos() - obj:GetPos()):GetNormal()
						
						
						traceData.start = obj:GetPos()
						traceData.endpos = traceData.start + direction *500
						
						local trace = util.TraceLine(traceData)
						local ent = trace.Entity
						
						--print(ent)
						
						if IsValid(ent) and ent == self then
								if (SERVER) then
								SendUserMessage("CW_DEATHBANG", obj)
							end
							
							
							end
						end
						
					end
		util.ScreenShake( self:GetPos(), 10, 2, 2, 850 )
			self:EmitSound("CW_FragGrenade_Explode")
			ParticleEffect( "FragExplose", self:GetPos() , Angle(0,0,0) )
		self:Remove()
	else
		self:EmitSound("physics/metal/metal_grenade_impact_hard" .. math.random(1, 3) .. ".wav", 80, 100)
		self.dt.Misfire = true
		SafeRemoveEntityDelayed(self, 10)
		
		vel = physobj:GetVelocity()
		len = vel:Length()
		
		if len > 500 then
			physobj:SetVelocity(vel * 0.6)
		end
	end
end
