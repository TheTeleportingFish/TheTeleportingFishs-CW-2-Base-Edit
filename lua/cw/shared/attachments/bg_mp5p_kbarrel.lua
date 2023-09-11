local att = {}
att.name = "bg_mp5p_kbarrel"
att.displayName = "K variant"
att.displayNameShort = "Short"
att.isBG = true
att.SpeedDec = -25

att.statModifiers = {RecoilMult = -0.6,
AimSpreadMult = 0.5,
OverallMouseSensMult = 0.25,
DrawSpeedMult = 0.1,
FireDelayMult = -0.3}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/mp5_kbarrel")
end

function att:attachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.k)
	self:setupCurrentIronsights(self.SDPos, self.SDAng)
	self:updateSoundTo("CW_MP5KP_FIRE", CustomizableWeaponry.sounds.UNSUPPRESSED)
	self.ForegripOverride = true
	self.ForegripParent = "bg_mp5p_kbarrel"
	self.MuzzleEffect = "muzzleflash_smg"
	
	if not self:isAttachmentActive("sights") then
		self:updateIronsights("K")
	end
end

function att:detachFunc()
	self:setBodygroup(self.BarrelBGs.main, self.BarrelBGs.regular)
	self:restoreSound()
	self:revertToOriginalIronsights()
	self.ForegripOverride = false
	self.MuzzleEffect = "muzzleflash_smg"
end

CustomizableWeaponry:registerAttachment(att)