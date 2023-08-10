--------------------------------------------------------------------------
-- File: lua/ui/loading_tips.lua
-- Author: Chad Queen
-- Summary: Loading tips that are shown in the loading screen scene.
-- Modder: SoLjA
-- Copyright © 2022 Gas Powered Games, Inc.  All rights reserved.
--------------------------------------------------------------------------

loading_settings = {
	tip_refresh_seconds = 15.0,
}

loading_tips = {
	tip_1 = '<LOC SC2_TIPS_0000>THIS IS SUPREME COMMANDER 2 SE VERSION 1.26 RGH EDITION.',
	tip_2 = '<LOC SC2_TIPS_0001>If you capture an Engineer or Factory, you can build your opponent\'s units and structures.',
	tip_3 = '<LOC SC2_TIPS_0030>Factory build queues can be set to repeat, letting you quickly and efficiently build units in a certain order.',
	tip_4 = '<LOC SC2_TIPS_0003>If you set a patrol route for a Factory, all of the units it produces will automatically follow that path.',
	tip_5 = '<LOC SC2_TIPS_0004>Build forward bases to move the war closer to your opponents.',
	tip_6 = '<LOC SC2_TIPS_0005>Building structures too close together will make it difficult for your army to move through your base.',
	tip_7 = '<LOC SC2_TIPS_0006>Grab as many Mass deposits as possible to control the map\'s resources.',
	tip_8 = '<LOC SC2_TIPS_0007>Use radar to identify targets for long-range artillery.',
	tip_9 = '<LOC SC2_TIPS_0008>If you order a Transport to assist a Land Factory, it will transport newly built units to the factory\'s rally point.',
	tip_10 = '<LOC SC2_TIPS_0009>The ACU is both a mobile engineer and, when upgraded through research, a powerful combat unit.',
	tip_11 = '<LOC SC2_TIPS_0010>Engineers can build structures, reclaim wreckage, and capture enemy units.',
	tip_12 = '<LOC SC2_TIPS_0011>Building multiple Research Stations generates research points faster.',
	tip_13 = '<LOC SC2_TIPS_0012>Shields are effective at blocking Artillery fire and Tactical Missiles.  They will not block Nukes.',
	tip_14 = '<LOC SC2_TIPS_0013>Gunships are highly effective against land units but vulnerable to Fighters.',
	tip_15 = '<LOC SC2_TIPS_0014>You can unlock new units and Experimentals through research.',
	tip_16 = '<LOC SC2_TIPS_0015>Units receive veterancy in combat; this makes them more effective the longer they survive.',
	tip_17 = '<LOC SC2_TIPS_0016>Certain technologies on the research trees will boost the effectiveness of many units at once.',
	tip_18 = '<LOC SC2_TIPS_0017>Experimental units are extremely effective.  Build them as fast as you can.',
	tip_19 = '<LOC SC2_TIPS_0018>You can earn research points from combat, from Research Stations, and from completing objectives in the single-player game.',
	tip_20 = '<LOC SC2_TIPS_0019>Most Illuminate land units can hover, which lets them travel on water.',
	tip_21 = '<LOC SC2_TIPS_0020>The Proto-Brain Complex is an homage to the Cybran Leader Dr Gustaf Brackman, who is a brain and spinal cord in a jar.',
	tip_22 = '<LOC SC2_TIPS_0021>The Illuminate Bodaboom boosts the Health of nearby units.',
	tip_23 = '<LOC SC2_TIPS_0022>All mobile units can be set to patrol an area.',
	tip_24 = '<LOC SC2_TIPS_0023>While moving, mobile units will fire at any valid targets that enter their weapon ranges.',
	tip_25 = '<LOC SC2_TIPS_0024>Naval units have powerful long-range weaponry.',
	tip_26 = '<LOC SC2_TIPS_0025>Shields are effective at blocking Artillery fire and Tactical Missiles.  They will not block Nukes.',
	tip_27 = '<LOC SC2_TIPS_0026>While the Illuminate\'s Universal Colossus is highly effective against land units, it has no defense against air.',
	tip_28 = '<LOC SC2_TIPS_0055>Factory Add-ons are far more effective than their standalone counterparts.',
	tip_29 = '<LOC SC2_TIPS_0056>The ACU builds structures faster than an engineer.',
	tip_30 = '<LOC SC2_TIPS_0057>Tactical Missile Launchers are most effective against structures since their missiles do not track moving targets.',
	tip_31 = '<LOC SC2_TIPS_0058>Artillery units are very effective at damaging large groups of enemies.',
	tip_32 = '<LOC SC2_TIPS_0059>Assault Bots move quickly and do high damage but have low health.',
	tip_33 = '<LOC SC2_TIPS_0060>Experimental Transports can carry land-based Experimentals.',
	tip_34 = '<LOC SC2_TIPS_0061>The Illuminate Space Temple is a two-way teleporter, so it\'s possible for enemies to use its destination beacon to travel to your position.',
	tip_35 = '<LOC SC2_TIPS_0062>The Illuminate Loyalty Gun automatically captures nearby enemy units at a very fast rate.',
	tip_36 = '<LOC SC2_TIPS_0063>If you have extra Energy, you can research Mass Conversion and convert Energy to Mass.',
	tip_37 = '<LOC SC2_TIPS_0064>Building factories closer to your enemy will reduce travel time.',
	tip_38 = '<LOC SC2_TIPS_0065>You can use engineers to assist a factory, increasing the rate at which they produce units.',
}

x360_tips = {
    tip_1 = '<LOC SC2_TIPS_0027>THIS IS SUPREME COMMANDER 2 SE VERSION 1.26 RGH EDITION.',
	tip_2 = '<LOC SC2_TIPS_0028>To adjust patrol routes, hold down Right Trigger and select points on the route with the A button; at this point, you can move them.',
	tip_3 = '<LOC SC2_TIPS_0066>To queue multiple commands, hold down the Right Trigger.',
    tip_4 = '<LOC SC2_TIPS_0067>You can add 5 units to your build queue by holding down the Right Trigger.',
}

pc_tips = {
	tip_1 = '<LOC SC2_TIPS_0029>Toggle the military and Intel overlays to view the range of your units.',
	tip_2 = '<LOC SC2_TIPS_0002>If you select multiple factories of the same type, any units added via the build interface will be added to all of the factories.',
	tip_3 = '<LOC SC2_TIPS_0031>You can queue multiple commands by holding down Shift while issuing orders or build commands.',
	tip_4 = '<LOC SC2_TIPS_0032>You can add 5 units to your build queue by holding down the Shift key, or 50 if you hold down Ctrl.',
}

uef_tips = {
	tip_1 = '<LOC SC2_TIPS_0033>THIS IS SUPREME COMMANDER 2 SE VERSION 1.26 RGH EDITION.',
	tip_2 = '<LOC SC2_TIPS_0034>The UEF, Aeon Illuminate, and Cybran Nation fought the \"Infinite War\" for over a thousand years.',
	tip_3 = '<LOC SC2_TIPS_0035>Coalition President Riley was assassinated by an unknown assailant, sending shockwaves across the galaxy.',
	tip_4 = '<LOC SC2_TIPS_0036>The UEF, Aeon Illuminate, and Cybran Nation initially formed the Colonial Defense Coalition to fight an alien race called the Seraphim.',
	tip_5 = '<LOC SC2_TIPS_0037>The firing of a weapon called Black Sun ended the Infinite War between the UEF, Illuminate, and Cybran Nation.',
	tip_6 = '<LOC SC2_TIPS_0038>After the Seraphim invasion, the Coalition Defense Force became the governing body of the galaxy, uniting the three factions under one set of ruling law.',
	tip_7 = '<LOC SC2_TIPS_0039>Most leaders of the Coalition come from the UEF faction; this means that the UEF dominates the Coalition, and its policies become Coalition policies.',
	tip_8 = '<LOC SC2_TIPS_0040>Moderate members of all three factions coexist together in some colonies; however, nationalists remain in \"pure\" homeworlds.',
}
illuminate_tips = {
	tip_1 = '<LOC SC2_TIPS_0041>THIS IS SUPREME COMMANDER 2 SE VERSION 1.26 RGH EDITION.',
	tip_2 = '<LOC SC2_TIPS_0042>The Illuminate struggled with the changes imposed by the Coalition after the Infinite War; some members flourished, while others pined for the days when they were guided by \"The Way\".',
	tip_3 = '<LOC SC2_TIPS_0043>The Illuminate dropped the Aeon Illuminate name as a symbolic compromise with conservatives who wished to leave the Coalition and re-form as the Order of the Illuminate.',
	tip_4 = '<LOC SC2_TIPS_0044>A political group \"The Royal Guardians\" named itself after the protectors of Princess Rhianne Burke, the former leader of the Aeon Illuminate.',
	tip_5 = '<LOC SC2_TIPS_0045>\"The Royal Guardians\" want to bring the Illuminate back to their more spiritual roots as followers of \"The Way\" and Princess Rhianne Burke.',
	tip_6 = '<LOC SC2_TIPS_0046>\"The Royal Guardians\" movement was temporarily derailed when some of its leaders were embroiled in a scandal; they claim they were framed.',
}
cybran_tips = {
	tip_1 = '<LOC SC2_TIPS_0047>THIS IS SUPREME COMMANDER 2 SE VERSION 1.26 RGH EDITION.',
	tip_2 = '<LOC SC2_TIPS_0048>The Quantum Gate network, which was used to move armies and ACUs between planets was torn down after the Infinite War.',
	tip_3 = '<LOC SC2_TIPS_0049>The Cybran Nation is wary of the Coalition, but respects it; mostly, its members stay out of everyone\'s way.',
	tip_4 = '<LOC SC2_TIPS_0050>The Quantum Gate network was dismantled because it reduced the possibility of another galactic war by making it more difficult to move armies across the galaxy.',
	tip_5 = '<LOC SC2_TIPS_0051>A large Quantum Gate, thought to be Seraphim in origin, was discovered during an archaeological dig on Altair II.',
	tip_6 = '<LOC SC2_TIPS_0052>The Quantum Gate network was torn down after the Infinite War because it made it more difficult to move enormous armies across great distances, thereby reducing the possibility of another galactic war.',
	tip_7 = '<LOC SC2_TIPS_0053>Dr Brackman was the first to travel through the Seraphim Gate found on Altair II, where he discovered the Planetary Ecosynthesizer dubbed Shiva Prime.',
	tip_8 = '<LOC SC2_TIPS_0054>Moderate leaders from all three factions agreed to keep the discovery of the Seraphim Gate on Altair II a secret, choosing to house it in an enormous base covered with a stealth field generator and protect it with a large Coalition force.',
}
