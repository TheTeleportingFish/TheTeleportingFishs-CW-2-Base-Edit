local Dir, Dir2, dot, sp, ent, trace, seed, hm, position

AddCSLuaFile()

resource.AddFile( "particles/customfraggrenadeexplose.pcf" )
resource.AddFile( "particles/heibullet_explosion.pcf" )
resource.AddFile( "particles/apfsdsdirthit.pcf" )

game.AddParticles("particles/muzzleflashes_test.pcf")
game.AddParticles("particles/muzzleflashes_test_b.pcf")
game.AddParticles("particles/cstm_muzzleflashes.pcf")
game.AddParticles( "particles/customfraggrenadeexplose.pcf" )
game.AddParticles( "particles/heibullet_explosion.pcf" )
game.AddParticles( "particles/apfsdsdirthit.pcf" )

PrecacheParticleSystem( "SABOTHIT" )
PrecacheParticleSystem( "SABOTPEN" )
PrecacheParticleSystem( "AMMOCOOKEXPLODE" )
PrecacheParticleSystem( "AMMOCOOKOFF" )
PrecacheParticleSystem( "DirtExplode" )
PrecacheParticleSystem( "GroundExplode" )
PrecacheParticleSystem( "FragExplose" )

SWEP.NormalTraceMask = bit.bor(CONTENTS_SOLID, CONTENTS_OPAQUE, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, 402653442, CONTENTS_WATER)
SWEP.WallTraceMask = bit.bor(CONTENTS_TESTFOGVOLUME, CONTENTS_EMPTY, CONTENTS_MONSTER, CONTENTS_HITBOX)

SWEP.NoPenetration = {[MAT_SLOSH] = true}
SWEP.NoRicochet = {[MAT_FLESH] = true, [MAT_ANTLION] = true, [MAT_BLOODYFLESH] = true, [MAT_DIRT] = true, [MAT_SAND] = true, [MAT_GLASS] = true, [MAT_ALIENFLESH] = true, [MAT_GRASS] = true}
SWEP.PenetrationMaterialInteraction = {[MAT_SAND] = 0.5, [MAT_DIRT] = 0.8, [MAT_METAL] = 1.1, [MAT_TILE] = 0.9, [MAT_WOOD] = 1.2}
local bul, tr = {}, {}
local SP = game.SinglePlayer()
local zeroVec = Vector(0, 0, 0)

local reg = debug.getregistry()
local GetShootPos = reg.Player.GetShootPos

SWEP.bulletCallback = function(ply, traceResult, dmgInfo) -- create the callback function once, to avoid function spam
	CustomizableWeaponry.callbacks.processCategory(ply:GetActiveWeapon(), "bulletCallback", ply, traceResult, dmgInfo)
end

function SWEP:canPenetrate(traceData, direction)
	local dot = nil
	
	if not self.NoPenetration[traceData.MatType] then
		dot = self:getSurfaceReflectionDotProduct(traceData, direction)
		ent = traceData.Entity
	
		if not ent:IsNPC() and not ent:IsPlayer() then
			if dot > 0.26 and self.CanPenetrate then
				return true, dot
			end
		end
	end
	
	return false, dot
end

function SWEP:getSurfaceReflectionDotProduct(traceData, dir)
	return -dir:DotProduct(traceData.HitNormal)
end

function SWEP:canRicochet(traceData, penetrativeRange)
	penetrativeRange = penetrativeRange or self.PenetrativeRange

	if self.CanRicochet and not self.NoRicochet[traceData.MatType] and penetrativeRange * traceData.Fraction < penetrativeRange then
		return true
	end
	
	return false
end

function SWEP:FireBullet(damage, cone, clumpSpread, bullets)
	sp = GetShootPos(self.Owner)
	local commandNumber = self.Owner:GetCurrentCommand():CommandNumber()
	math.randomseed(commandNumber)
	
	if self.Owner:Crouching() then
		cone = cone * 0.85
	end
	
	Dir = (self.Owner:EyeAngles() + self.Owner:GetViewPunchAngles() + Angle(math.Rand(-cone, cone), math.Rand(-cone, cone), 0) * 25):Forward()
	clumpSpread = clumpSpread or self.ClumpSpread
	
	CustomizableWeaponry.callbacks.processCategory(self, "adjustBulletStructure", bul)
	
	for i = 1, bullets do
		Dir2 = Dir
		
		if clumpSpread and clumpSpread > 0 then
			Dir2 = Dir + Vector(math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)) * clumpSpread
		end
		
		if not CustomizableWeaponry.callbacks.processCategory(self, "suppressDefaultBullet", sp, Dir2, commandNumber) then
			bul.Num = 1
			bul.Src = sp
			bul.Dir = Dir2
			bul.Spread 	= zeroVec --Vector(0, 0, 0)
			bul.Tracer	= 3
			bul.Force	= damage * 0.3
			bul.Damage = math.Round(damage)
			bul.Callback = self.bulletCallback
			
			self.Owner:FireBullets(bul)
			
			tr.start = sp
			tr.endpos = tr.start + Dir2 * self.PenetrativeRange
			tr.filter = self.Owner
			tr.mask = self.NormalTraceMask
			
			trace = util.TraceLine(tr)
				
			if trace.Hit and not trace.HitSky then
				local canPenetrate, dot = self:canPenetrate(trace, Dir2)
				
				if not ( self.HEI or self.API or self.APFSDS ) then
				if trace.HitWorld and not (trace.Entity:IsPlayer() or trace.Entity:IsNPC()) then
				ParticleEffect( "GroundExplode", trace.HitPos, Angle(0,0,0) )
				sound.Play( Sound("CW_HEI_Explose"), trace.HitPos )
				end end
				
				if canPenetrate and dot > 0.26 then
					tr.start = trace.HitPos
					tr.endpos = tr.start + Dir2 * self.PenStr * (self.PenetrationMaterialInteraction[trace.MatType] and self.PenetrationMaterialInteraction[trace.MatType] or 1) * self.PenMod
					tr.filter = self.Owner
					tr.mask = self.WallTraceMask
					
					trace = util.TraceLine(tr)
					
					tr.start = trace.HitPos
					tr.endpos = tr.start + Dir2 * 0.1
					tr.filter = self.Owner
					tr.mask = self.NormalTraceMask
					
					trace = util.TraceLine(tr) -- run ANOTHER trace to check whether we've penetrated a surface or not
					
					if not trace.Hit then
						bul.Num = 1
						bul.Src = trace.HitPos
						bul.Dir = Dir2
						bul.Spread 	= Vec0
						bul.Tracer	= 4
						bul.Force	= damage * 0.15
						bul.Damage = bul.Damage * 0.5
						
						self.Owner:FireBullets(bul)
						
						bul.Num = 1
						bul.Src = trace.HitPos
						bul.Dir = -Dir2
						bul.Spread 	= Vec0
						bul.Tracer	= 4
						bul.Force	= damage * 0.15
						bul.Damage = bul.Damage * 0.5
						
						self.Owner:FireBullets(bul)
					end
				else
					if self:canRicochet(trace) then
						dot = dot or self:getSurfaceReflectionDotProduct(trace, Dir2)
						Dir2 = Dir2 + (trace.HitNormal * dot) * 3
						math.randomizeVector(Dir2, 0.06)
						
						bul.Num = 1
						bul.Src = trace.HitPos
						bul.Dir = Dir2
						bul.Spread 	= Vec0
						bul.Tracer	= 0
						bul.Force	= damage * 0.225
						bul.Damage = bul.Damage * 0.75
						
						self.Owner:FireBullets(bul)
					end
				end
			end
		end
		
		

		
	end
		
		if self.HEI == true then
				
				local position = trace.HitPos + trace.HitNormal*5
				local angle = trace.HitNormal:Angle()

				--print(tostring(angle))

				self.ExplodeRadius = 110+(self.BulletDiameter * 0.9 + self.CaseLength * 0.3)
				self.ExplodeDamage = (self.HEIDamage*self.BulletDiameter) or 0
				
				util.BlastDamage(self, self:GetOwner(), position, self.ExplodeRadius, self.ExplodeDamage)
				
				if SERVER then 
				if (trace.HitNonWorld and math.random(1,3) == 1) then
				target = trace.Entity

				
				if target:IsPlayer() or target:IsNPC() then
				target:Ignite(10)
				
				end end end
				
				
				if CLIENT then
							
							local dlight = DynamicLight( -1 )
								dlight.pos = position
								dlight.r = 255
								dlight.g = 50
								dlight.b = 20
								dlight.brightness = 4
								dlight.Decay = 4000
								dlight.Size = 1000
								dlight.DieTime = CurTime() + 0.25
								
									
							end
				
				
				sound.Play( Sound("CW_Incendiary_Sizzle"), position )
				sound.Play( Sound("CW_HEI_Ignite"), position )
				sound.Play( Sound("CW_HEI_Explose"), position )
				
				if trace.HitNonWorld or trace.Hit == false then
				ParticleEffect( "DirtExplodeHit", position , Angle(0,0,0) )
				else
				ParticleEffect( "DirtExplode", position , Angle(0,0,0) )
				end
				
				
				
		elseif self.API == true then
				
				local position = trace.HitPos + trace.HitNormal*5
				local angle = trace.HitNormal:Angle()

				--print(tostring(angle))

				self.ExplodeRadius = 70+(self.BulletDiameter * 0.9 + self.CaseLength * 0.3)
				self.ExplodeDamage = ((self.HEIDamage*self.BulletDiameter)/5) or 10
				
				util.BlastDamage(self, self:GetOwner(), position, self.ExplodeRadius, self.ExplodeDamage)
				
				if SERVER then 
				if (trace.HitNonWorld and math.random(1,3) == 1)  then
				target = trace.Entity

				if target:IsPlayer() or target:IsNPC() then
				target:Ignite(10)
				end 
				elseif trace.HitNonWorld and (trace.Entity:IsPlayer() or trace.Entity:IsNPC()) then
				sound.Play( Sound("CW_API_objecthit"), position )
				end
				
				
				
				end
				
				if self.PenetrationMaterialInteraction[trace.MatType] == 1.1 or self.PenetrationMaterialInteraction[trace.MatType] == 1.1 then
				
				if position:Distance( self.Owner:GetPos() ) < 300 then
				
				if SERVER then
							
								local d = DamageInfo()
								d:SetDamage( 100/((position:Distance( self.Owner:GetPos() )+1)/50) )
								d:SetAttacker( self:GetOwner() )
								d:SetDamageType( DMG_BURN )
								self.Owner:TakeDamageInfo( d )
								print("yes")
							end
							
				end
				
				ParticleEffect( "SUPEREMBERHIT", position , self.Owner:EyeAngles():Up():Angle())
				sound.Play( Sound("CW_HEI_MetalSlam"), position )
				end
				
				
				if CLIENT then
							
							local dlight = DynamicLight( -1 )
								dlight.pos = position
								dlight.r = 255
								dlight.g = 50
								dlight.b = 20
								dlight.brightness = 2
								dlight.Decay = 8000
								dlight.Size = 500
								dlight.DieTime = CurTime() + 0.125
								
									
							end
				
				
				sound.Play( Sound("CW_Incendiary_Sizzle"), position )
				sound.Play( Sound("CW_HEI_Ignite"), position )
				
				
				if trace.HitNonWorld or trace.Hit == false then
				ParticleEffect( "DirtExplodeHit", position , Angle(0,0,0) )
				
				else
				ParticleEffect( "APIExplode", position , Angle(0,0,0) )
				end
		
		elseif self.APFSDS == true then
				
				position = trace.HitPos + trace.HitNormal*20
				angle = trace.HitNormal:Angle()
				
					if trace.HitNonWorld then
							
							target = trace.Entity
							
							self.ExplodeRadius = 300
							self.ExplodeDamage = 1000
							
							
							sound.Play( Sound("CW_APFSDS_PIERCE"), position )
							sound.Play( Sound("CW_APFSDS_Ignite"), position )
							ParticleEffect( "SABOTPEN", position , self.Owner:EyeAngles() )
							util.BlastDamage(self, self:GetOwner(), position, self.ExplodeRadius, self.ExplodeDamage)
							if SERVER then
							
								local d = DamageInfo()
								d:SetDamage( 300000 )
								d:SetAttacker( self:GetOwner() )
								d:SetDamageType( DMG_BULLET )
								target:TakeDamageInfo( d )
								
							end
							
							if CLIENT then
							
									local dlight = DynamicLight( -1 )
										dlight.pos = position
										dlight.r = 255
										dlight.g = 100
										dlight.b = 60
										dlight.brightness = 5
										dlight.Decay = 2000
										dlight.Size = 1500
										dlight.DieTime = CurTime() + 0.5
									
									
							end
							
							
					end
					
					if not trace.HitNonWorld then
					
					
					self.ExplodeRadius = 1800
					self.ExplodeDamage = 300
					util.BlastDamage(self, self:GetOwner(), position, self.ExplodeRadius, self.ExplodeDamage)
					
					
					self.ExplodeRadius = 300
					self.ExplodeDamage = 10000
					util.BlastDamage(self, self:GetOwner(), position, self.ExplodeRadius, self.ExplodeDamage)
					
					util.ScreenShake( position, 1, 12, 4, 2500 )

					sound.Play( Sound("CW_APFSDS_Ignite"), position )
					
					for key, obj in ipairs(player.GetAll()) do
						if obj:Alive() and (obj:GetPos():Distance(position)) < 1200 then

						
								if (SERVER) then
								SendUserMessage("CW_DEATHBANG", obj)
							end
						end 
					end
					
					timer.Simple( 0.2, function() 
					--sound.Play( Sound("CW_APFSDS_PIERCEEMBER"), position )
					sound.Play( Sound("CW_APFSDS_Explose_Close"), position )
					sound.Play( Sound("CW_APFSDS_Explose_Far"), position )
					end )


					ParticleEffect( "SABOTHIT", position , Angle(0,0,0) )
					
					
					
					end 
					
					
					
					
					
				
				
		end
		
		
		
	tr.mask = self.NormalTraceMask
end







