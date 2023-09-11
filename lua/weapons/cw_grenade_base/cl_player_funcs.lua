local PLAYER = FindMetaTable("Player")

function PLAYER:cwFlashbang(intensity, duration)
	self.cwFlashbangIntensity = intensity
	self.cwFlashbangDuration = CurTime() + duration
	self.cwFlashDuration = CurTime() + duration * 0.75
	self.cwFlashIntensity = math.max(intensity * 1.5, 1)
	

	
	if intensity > 0.6 then
		self:SetDSP(35, duration <= 1)
	end
end


function PLAYER:cwDeathbang(intensity, duration)
	self.cwDeathIntensity = intensity
	self.cwDeathDuration = CurTime() + duration
	self.cwDeathDuration = CurTime() + duration * 0.75
	self.cwDeathIntensity = math.max(intensity * 1.5, 1)
	
--print(self.cwDeathIntensity)
	
	if intensity > 0.99 then
		self:SetDSP(35, duration <= 0.6)
	end
end









