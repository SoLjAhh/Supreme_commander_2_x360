-- AI Redux by SoLjA for Supreme Commander 2 Xbox 360
function Evaluate(AIInfo)
    returnScore = 0
    
	if string.find(AIInfo.PreferredAI, 'balanced') then
        returnScore = 100
	elseif string.find(AIInfo.PreferredAI, 'supreme') then
		returnScore = 100
    -- This AI is never chosen on maps with islands. The builds end up with a lot
    -- of land units that are difficult to move around
    elseif not AIInfo.LandMap and not AIInfo.AmphibiousMap then
        returnScore = -1
    elseif AIInfo.EnemyRange <= 250 then
        returnScore = 10
    elseif AIInfo.EnemyRange <= 300 then
        returnScore = 15
    elseif AIInfo.EnemyRange <= 350 then
        returnScore = 30
    elseif AIInfo.EnemyRange <= 400 then
        returnScore = 35
    elseif AIInfo.EnemyRange <= 450 then
        returnScore = 50
    elseif AIInfo.EnemyRange <= 550 then
        returnScore = 40
    elseif AIInfo.EnemyRange <= 600 then
        returnScore = 30
    elseif AIInfo.EnemyRange <= 650 then
        returnScore = 20
    elseif AIInfo.EnemyRange > 650 then
        returnScore = 10
    end
    
    return returnScore, 'DefaultBalancedArchetype'
end