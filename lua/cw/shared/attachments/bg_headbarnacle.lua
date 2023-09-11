local att = {}
att.name = "bg_headbarnacle"
att.displayName = "Head Barnacle"
att.displayNameShort = "Head B."
att.isBG = true
att.SpeedDec = -110

att.statModifiers = {OverallMouseSensMult = -0.25,
VelocitySensitivityMult = 3.00,
DamageMult = 0.14}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/headrounds")
	att.description = {
	[1] = {t = "Barnacle-Chan becomes so ecstatic that she resists and movement.", c = CustomizableWeaponry.textColors.GRAY},
	[2] = {t = "Makes Barnacle-Chan Happier.", c = CustomizableWeaponry.textColors.COSMETIC},
	[3] = {t = "Its a Headcrab...", c = CustomizableWeaponry.textColors.COSMETIC},
	[4] = {t = "Barnacle-Chan helps you breathe better.", c = CustomizableWeaponry.textColors.POSITIVE},
	[5] = {t = "Barnacle-Chan provides air while aiming.", c = CustomizableWeaponry.textColors.POSITIVE},

	}
end



function att:attachFunc()
	
function self:MakeRecoil(mod)
	local mod = -0.1
	local IFTP = IsFirstTimePredicted()
	
	if (SP and SERVER) or (not SP and CLIENT and IFTP) then
		ang = self.Owner:EyeAngles()
		ang.p = ang.p - self.Recoil * 0.5 * mod
		ang.y = ang.y + math.Rand(-1, 1) * self.Recoil * 0.5 * mod
	
		self.Owner:SetEyeAngles(ang)
	end

	local freeAimOn = self:isFreeAimOn()
	
	if not freeAimOn or (freeAimOn and self.dt.BipodDeployed) then
		self.Owner:ViewPunch(Angle(-self.Recoil * 1.25 * mod, 0, 0))
	end
	
	if CLIENT and IFTP then
		if self.AimBreathingEnabled then
			if self.holdingBreath then
				self:reduceBreathAmount(mod)
			else
				self:reduceBreathAmount(0)
			end
		end
	end
end
	
	self.Recoil = 1
	self.MinimumBreathPercentage = 0.1
	self.BreathRegenRate = 0.4
	self.BreathDrainRate = 0.015
end

function att:detachFunc()

	function self:MakeRecoil(mod)
	local mod = self:GetRecoilModifier(mod)
	local IFTP = IsFirstTimePredicted()
	
	if (SP and SERVER) or (not SP and CLIENT and IFTP) then
		ang = self.Owner:EyeAngles()
		ang.p = ang.p - self.Recoil * 0.5 * mod
		ang.y = ang.y + math.Rand(-1, 1) * self.Recoil * 0.5 * mod
	
		self.Owner:SetEyeAngles(ang)
	end

	local freeAimOn = self:isFreeAimOn()
	
	if not freeAimOn or (freeAimOn and self.dt.BipodDeployed) then
		self.Owner:ViewPunch(Angle(-self.Recoil * 1.25 * mod, 0, 0))
	end
	
	if CLIENT and IFTP then
		if self.AimBreathingEnabled then
			if self.holdingBreath then
				self:reduceBreathAmount(mod)
			else
				self:reduceBreathAmount(0)
			end
		end
	end
end

	self.MinimumBreathPercentage = 0.75
	self.BreathRegenRate = 0.15
	self.BreathDrainRate = 0.1
end

CustomizableWeaponry:registerAttachment(att)