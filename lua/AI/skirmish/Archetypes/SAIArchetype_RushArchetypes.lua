-- AI Redux by SoLjA for Supreme Commander 2 Xbox 360
function Evaluate(AIInfo)
    returnScore = 0
    
	if string.find(AIInfo.PreferredAI, 'rush') then
        returnScore = 100
	elseif string.find(AIInfo.PreferredAI, 'horde') then
		returnScore = 100
    elseif not AIInfo.LandMap then
        returnScore = -1
    elseif AIInfo.EnemyRange <= 300 then
        returnScore = 50
    elseif AIInfo.EnemyRange <= 350 then
        returnScore = 45
    elseif AIInfo.EnemyRange <= 400 then
        returnScore = 40
    elseif AIInfo.EnemyRange <= 450 then
		returnScore = 40
    elseif AIInfo.EnemyRange <= 500 then
		returnScore = 20
    elseif AIInfo.EnemyRange > 500 then
		returnScore = 10
    end
    
    return returnScore, 'DefaultRushArchetype'
end