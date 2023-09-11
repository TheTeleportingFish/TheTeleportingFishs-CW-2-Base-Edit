AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")




ENT.ExplodeRadius = 500
ENT.ExplodeDamage = 90
ENT.Model = "models/weapons/w_cw_fraggrenade_thrown.mdl"

local phys, ef

function ENT:Initialize()
	self:SetModel(self.Model) 
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_NONE)
	self.NextImpact = 0
	phys = self:GetPhysicsObject()

	if phys and phys:IsValid() then
		phys:Wake()
	end
	
	self:GetPhysicsObject():SetBuoyancyRatio(0)
end

function ENT:Use(activator, caller)
	return false
end

function ENT:OnRemove()
	return false
end 

local vel, len, CT

function ENT:PhysicsCollide(data, physobj)
	vel = physobj:GetVelocity()
	len = vel:Length()
	
	if len > 500 then -- let it roll
		physobj:SetVelocity(vel * 0.4) -- cheap as fuck, but it works
	end
	
	if len > 100 then
		CT = CurTime()
		
		if CT > self.NextImpact then
			self:EmitSound("physics/metal/metal_grenade_impact_hard3.wav", 75, 100)
			self.NextImpact = CT + 0.1
		end
	end
end


local traceData = {}
traceData.mask = bit.bor(CONTENTS_SOLID, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, CONTENTS_WATER)

function ENT:Fuse(t)
	t = t or 3
	
	timer.Simple(t, function()
		if self:IsValid() then
			util.BlastDamage(self, self:GetOwner(), self:GetPos(), self.ExplodeRadius, self.ExplodeDamage)
			
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
			sound.Play( Sound("CW_FragGrenade_Explode"), self:GetPos() )
			self:EmitSound("CW_FragGrenade_Explode_Back")
			ParticleEffect( "FragExplose", self:GetPos() , Angle(0,0,0) )
			
			self:Remove()
		end
	end)
end