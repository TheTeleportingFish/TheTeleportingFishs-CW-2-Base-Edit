local att = {}
att.name = "am_geiger"
att.displayName = "Geiger rounds"
att.displayNameShort = "Geiger"

att.statModifiers = {DamageMult = -0.3,
AimSpreadMult = -0.8,
FireDelayMult = -0.5,
	RecoilMult = -0.6}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/magnumrounds")
	att.description = {}
end

function att:attachFunc()
	self:unloadWeapon()
end

function att:detachFunc()
	self:unloadWeapon()
end

CustomizableWeaponry:registerAttachment(att)