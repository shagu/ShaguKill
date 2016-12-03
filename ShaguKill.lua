local ShaguKill = CreateFrame("Frame")
ShaguKill:RegisterEvent("PLAYER_XP_UPDATE")
ShaguKill:RegisterEvent("UNIT_PET_EXPERIENCE")
ShaguKill:RegisterEvent("PLAYER_ENTERING_WORLD")

ShaguKill:SetScript("OnEvent", function() 
	if event == "PLAYER_ENTERING_WORLD" then
    ShaguKill.oldXP =  UnitXP("player")
  end

	if event == "PLAYER_XP_UPDATE" then
		ShaguKill.curXP = UnitXP("player")
		ShaguKill.maxXP = UnitXPMax("player")
	
		if ShaguKill.oldXP ~= nil then
			ShaguKill.difXP = ShaguKill.curXP - ShaguKill.oldXP
			ShaguKill.remainingXP = floor((ShaguKill.maxXP - ShaguKill.curXP)/ShaguKill.difXP)
			UIErrorsFrame:AddMessage("next level: |cffffffaa~" .. ShaguKill.remainingXP .. "|r kills.")
		end
		ShaguKill.oldXP = ShaguKill.curXP
	end

	if event == "UNIT_PET_EXPERIENCE" then
		ShaguKill.petCurXP, ShaguKill.petMaxXP = GetPetExperience()
		if ShaguKill.petOldXP ~= nil then
			ShaguKill.petDifXP = ShaguKill.petCurXP - ShaguKill.petOldXP
			ShaguKill.petRemainingXP = floor((ShaguKill.petMaxXP - ShaguKill.petCurXP)/ShaguKill.petDifXP)
			UIErrorsFrame:AddMessage("pet: |cffffffaa~" .. ShaguKill.petRemainingXP .. "|r kills.")
		end
	ShaguKill.petOldXP = ShaguKill.petCurXP
	end
end)
