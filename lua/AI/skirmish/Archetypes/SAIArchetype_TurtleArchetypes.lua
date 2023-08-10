-- AI Redux by SoLjA for Supreme Commander 2 Xbox 360
function Evaluate(AIInfo)
    returnScore = 0
    
    if string.find(AIInfo.PreferredAI, 'turtle') then
        returnScore = 100
	elseif string.find(AIInfo.PreferredAI, 'tech') then
        returnScore = 100
    elseif AIInfo.EnemyRange <= 500 then
        returnScore = 10
    elseif AIInfo.EnemyRange <= 550 then
        returnScore = 20
    elseif AIInfo.EnemyRange <= 600 then
        returnScore = 35
    elseif AIInfo.EnemyRange <= 650 then
        returnScore = 40
    elseif AIInfo.EnemyRange > 650 then
        returnScore = 50
    end
    
    return returnScore, 'DefaultTurtleArchetype'
end