local att = {}
att.name = "bg_mp5p_nostock"
att.displayName = "No stock"
att.displayNameShort = "None"
att.isBG = true
att.SpeedDec = -5

att.statModifiers = {DrawSpeedMult = 0.2,
OverallMouseSensMult = 0.5,
RecoilMult = 0.8}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/nostock")
end

function att:attachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.none)
end

function att:detachFunc()
	self:setBodygroup(self.StockBGs.main, self.StockBGs.regular)
end

CustomizableWeaponry:registerAttachment(att)