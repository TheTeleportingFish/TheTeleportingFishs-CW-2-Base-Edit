ENT.Type = "anim"
ENT.Base = "base_anim"
ENT.PrintName = "105mm SABOT Ammo"
ENT.Author = "Spy"
ENT.Spawnable = true
ENT.AdminSpawnable = true 
ENT.Category = "CW 2.0 Ammo"




ENT.ResupplyMultiplier = 12 -- max amount of mags the player can take from the ammo entity before it considers him as 'full'
ENT.AmmoCapacity = 16 -- max amount of resupplies before this entity dissapears
ENT.HealthAmount = 10 -- the health of this entity
ENT.ExplodeRadius = 700 -- the explosion radius when it reaches 0 health from taking damage, measured in units
ENT.ExplodeDamage = 500 -- the explosion damage
ENT.ResupplyTime = 0.6 -- time in seconds between resupply sessions
ENT.Model = "models/Items/ammocrate_ar2.mdl"

ENT.CaliberSpecific = true -- whether the entity will give a specific ammo caliber
ENT.ResupplyAmount = 1 -- how many rounds to give
ENT.Caliber = "105mm SABOT" -- which caliber to resupply


function ENT:SetupDataTables()
	self:DTVar("Int", 0, "ammoCharge")
	self:DTVar("Int", 1, "Gradient")
end