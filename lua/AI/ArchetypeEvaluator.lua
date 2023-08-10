--****************************************************************************
--**
--**  File     :  //lua/ai/ArchetypeEvaluator.lua
--**  Author(s): Mike Robbins
--**  Modder(s): SoLjA
--**  Summary  : AI Redux For Xbox 360
--**
--**  Copyright © 2022 Gas Powered Games, Inc.  All rights reserved.
--****************************************************************************
local ScenarioUtils = import('/lua/sim/ScenarioUtilities.lua')
local AI_VARIANCE = 2;

function ChooseArchetype(aiBrain)
    local archetypes = DiskFindFiles('/lua/AI/skirmish/Archetypes', '*.lua')
    local scores = {}
	table.resizeandclear(scores, archetypes)

    local AIEvaluationInfo = GetAIEvaluationInfo(aiBrain)

     --WARN('*AI EVal info = ' .. repr(AIEvaluationInfo) )

    -- Get all archetypes and scores and store them in a table
    for k, archetype in archetypes do
        local score, name = import(archetype).Evaluate(AIEvaluationInfo)

        if score < 0 then
            continue
        end

        -- we use a +/- 10 range for scores; this way we end up with some variance
        -- but the base weight has value
		local final = Random(score-AI_VARIANCE, score+AI_VARIANCE)
        --local final = Random(score-10, score+10)

        if final < 0 then
            continue
        end

        scores[k] = {Name = name, BaseScore = score, Score = final}
    end

    -- if by some chance we do NOT have a valid list, use the air archetype
    -- it is the safest
    if table.empty(scores) then
         --WARN('*AI Arch: No valid archs - returning air')
        return 'DefaultAirArchetype'
    end

    -- Sort the archetypes by score
    table.sort(scores, function(a,b) return a.Score > b.Score end)

    local possibles = {}
    local highestScore = -1

    --WARN('*AI Scores: Brain = ' .. aiBrain:GetArmyIndex() .. ' - Scores = ' .. repr(scores) )

    -- get possible archetypes to use
    for k, v in scores do
        if highestScore > 0 and highestScore > v.Score then
            break
        end

        if v.Score > highestScore then
            highestScore = v.Score
        end

        table.insert(possibles, v.Name)
    end

    -- get a radom archetype out of the possibles
    local index = Random(1, table.getn(possibles))
     --WARN('*AI Possibles: Brain = ' .. aiBrain:GetArmyIndex() .. ' - Scores = ' .. repr(possibles) )

    return possibles[index]
end

function GetAIEvaluationInfo(aiBrain)

    local startX, startZ = aiBrain:GetArmyStartPos()

    local closestEnemyDist = -1
    local closestNavalMarker = GetClosestMarker('NavalArea', {startX, 0, startZ})
    local navalMarkerNear = false
    local navalDistance = VDist2(closestNavalMarker[1], closestNavalMarker[3], startX, startZ)
    if closestNavalMarker[1] > 0 and closestNavalMarker[3] > 0 and navalDistance < 150 then
        navalMarkerNear = true
    end
    local landMap = true
    local amphibiousMap = true

    for k,v in ArmyBrains do
        if v == aiBrain or IsAlly(v:GetArmyIndex(), aiBrain:GetArmyIndex()) then
            continue
        end
        local startEneX, startEneZ = v:GetArmyStartPos()

        local dist = VDist2(startEneX, startEneZ, startX, startZ)

        if closestEnemyDist < 0 or dist < closestEnemyDist then
            closestEnemyDist = dist
        end

        if not SourceAndDestPathableAmphibious(startEneX, startEneZ, startX, startZ) then
            amphibiousMap = false
        end

        if not SourceAndDestPathableLand(startEneX, startEneZ, startX, startZ) then
            landMap = false
        end
    end

	if ( not landMap and navalMarkerNear ) then
        SetSkirmishLandMap(false)
    end

    if ( not amphibiousMap ) then
        SetSkirmishAmphibiousMap(false)
    end

    returnInfo = {
	    PreferredAI = ScenarioInfo.ArmySetup[aiBrain.Name].AIPersonality,
		Difficulty = aiBrain.DifficultyLevel,
        EnemyRange = closestEnemyDist,
        AmphibiousMap = amphibiousMap,
        LandMap = landMap,
        HasNavalNearby = navalMarkerNear,
        NavalDistance = navalDistance,
        Faction = aiBrain:GetFactionIndex(),
    }

    return returnInfo

end
