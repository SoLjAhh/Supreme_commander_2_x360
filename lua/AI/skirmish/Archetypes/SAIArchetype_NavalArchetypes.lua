-- AI Redux by SoLjA for Supreme Commander 2 Xbox 360
function Evaluate(AIInfo)
    returnScore = 0
    
	if string.find(AIInfo.PreferredAI, 'naval') and AIInfo.Faction != 3 then
        returnScore = 100
    -- illuminate can't use this
    -- don't use this if we don't have naval markers close by
    elseif AIInfo.Faction == 3 or not AIInfo.HasNavalNearby then
        returnScore = -1
    elseif AIInfo.EnemyRange <= 300 and not AIInfo.LandMap or AIInfo.Faction == 2 then
        returnScore = 15
    elseif AIInfo.EnemyRange <= 350 and not AIInfo.LandMap or AIInfo.Faction == 2 then
        returnScore = 20
    elseif AIInfo.EnemyRange <= 400 and not AIInfo.LandMap or AIInfo.Faction == 2 then
        returnScore = 30
    elseif AIInfo.EnemyRange <= 450 then
        returnScore = 40
    elseif AIInfo.EnemyRange > 450 then
        returnScore = 50
    end
	
	if AIInfo.Faction == 2 and AIInfo.HasNavalNearby and returnScore > 0 and returnScore < 50 then
		returnScore = returnScore + 5
		if returnScore > 50 then
			returnScore = 50
		end
	end
	
    return returnScore, 'DefaultNavalArchetype'
end