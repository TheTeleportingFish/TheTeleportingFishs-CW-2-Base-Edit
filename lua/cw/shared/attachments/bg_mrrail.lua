local att = {}
att.name = "bg_mrrail"
att.displayName = "Extender Rail"
att.displayNameShort = "E. Rail"
att.isBG = true

att.statModifiers = {RecoilMult = -0.05,
	OverallMouseSensMult = -0.08,
	DrawSpeedMult = -0.03
	}

if CLIENT then
	att.displayIcon = surface.GetTextureID("atts/acog")
	att.description = {[1] = {t = "A rail for which to have extended sight adjustment.", c = CustomizableWeaponry.textColors.REGULAR}}
end

function att:attachFunc()
	
end

function att:detachFunc()
	
end

CustomizableWeaponry:registerAttachment(att)