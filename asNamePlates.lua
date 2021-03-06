﻿---설정부
local ANameP_SIZE = 0; 					-- Icon Size 0 이면 자동으로 설정
local ANameP_Size_Rate = 0.9;			-- Icon 가로 세로 비중
local ANameP_PVP_Debuff_Size_Rate = 4   -- PVP Debuff Icon Size 작게 하려면 - 값으로

local ANameP_PlayerBuffY = -5			-- Player 바 Buff 위치
local ANameP_TargetBuffY = 5			-- 대상바 Buff 위치
local ANameP_ComboBuffY = ANameP_TargetBuffY + 30 -- 특수 자원 표시시 Buff 위치
local ANameP_CooldownFontSize = 9;     --재사용 대기시간 Font Size
local ANameP_CountFontSize = 9;		--Count 폰트 Size
local ANameP_MaxDebuff = 8;				--최대 Debuff
local ANameP_DebuffsPerLine = 4;		--줄당 Debuff 수 (큰 이름표 일 경우 +1 됨)
local ANameP_MaxBuff = 1;				--최대 PVP Buff (안보이게 하려면 0)
local ANameP_ShowMyAll = true;			--내 buff/Debuff면 모두 보임 false 로 하면 아래 Show List 항목만 보임
local ANameP_ShowPVPDebuff = true;		--PVP Debuff 면 모두 보임 (다른 사람의 디법이면 회색으로 보임)
local ANameP_ShowPlayerBuff = true;		--Player NamePlate에 Buff를 안보일려면 false;
local ANameP_BuffMaxCool = 60;			--buff의 최대 Cool
local ANameP_AggroShow = true;			-- 어그로 여부를 표현할지 여부 
local ANameP_PVPAggroShow = true;		-- PVP 어그로 여부를 표현할지 여부 
local ANameP_AggroStatusBarColor = true; --생명력 바 색상으로 어그로 표시 false이면 ▶◀ 모양으로 표시
local ANameP_AggroTargetColor =  {r = 0.4, g = 0.2, b = 0.8}; -- PVE 대상이 player 였을때 Color
local ANameP_AggroColor = {r = 0.5, g = 1, b = 1}; -- 어그로 대상일때 바 Color
local ANameP_TankAggroLoseColor = {r = 1, g = 0.5, b= 0.5}; -- 탱커일때 어그로가 다른 탱커가 아닌사람일때
--local ANameP_TankAggroLoseColor2 = {r = 0.1, g = 1, b= 0.5}; -- 어그로가 파티내 다른 탱커일때
local ANameP_TankAggroLoseColor2 = {r = 1, g = 0.1, b= 0.5}; -- 어그로가 파티내 다른 탱커일때
local ANameP_TankAggroLoseColor3 = {r = 0.1, g = 0.3, b= 1}; -- 어그로가 Pet 일때 혹은 Tanking 중인데 어그로가 낮을때
local ANameP_ShowListFirst = true		-- 알림 List 가 있다면 먼저 보인다. (가나다라 순서)

local ANameP_AggroSize = 12;			-- 어그로 표시 Text Size
local ANameP_HealerSize = 14;			-- 힐러표시 Text Size
local ANameP_TargetHealthBarHeight = 3;	-- 대상 체력바 높이 증가치
local ANameP_HeathTextSize = 8;			-- 대상 체력숫자 크기
local ANameP_UpdateRate = 0.5;			-- 버프 Check 반복 시간 (초)
local ANameP_LowHealthAlert = true  	-- 낮은 체력 색상 변경 사용
local ANameP_LowHealthColor = {r = 1, g = 0.8, b= 0.5}; -- 낮은 체력 이름표 색상 변경
local ANameP_Alpha_Normal = 0.5			-- 비전투 중 투명도
local ANameP_Alpha_Combat = 1			-- 전투중 투명도


local ANameP_ShowList = nil;


local ANameP_Resourcetext = nil;


local debuffs_per_line = ANameP_DebuffsPerLine;


-- ANameP_ShowList_직업_특성 숫자
-- 아래와 같은 배열을 추가 하면 된다.
-- ["디법명"] = {알림 시간, 우선순위},
-- 우선순위는 숫자가 큰 경우 우선적으로 보이고, 같을 경우 먼저 걸린 순서로 보임
ANameP_ShowList_WARRIOR_1 = {
	["분쇄"] = {5, 1, {r = 1, g = 0.5, b = 0}},	
}

ANameP_ShowList_WARRIOR_2 = {
}

ANameP_ShowList_WARRIOR_3 = {
}

ANameP_ShowList_ROGUE_1 = {
	["목조르기"] = {5.4, 4},	
	["파열"] = {7.2, 3, {r = 1, g = 0.5, b = 0}},	
	["과다출혈"] = {6, 2},	
	["죽음의 표적"] = {0, 1},	
}

ANameP_ShowList_ROGUE_2 = {
	["유령의 일격"] = {4.5 , 2},	
	["죽음의 표적"] = {0, 1},	

}

ANameP_ShowList_ROGUE_3 = {
	["암흑칼날"] = {4.8, 2},	
	["죽음의 표적"] = {0, 1},	
}


ANameP_ShowList_HUNTER_1 = {
}

ANameP_ShowList_HUNTER_2 = {
	["사냥꾼의 징표"] = {0, 1},	

}


ANameP_ShowList_HUNTER_3 = {
	["독사 쐐기"] = {4.5, 2},	
}

ANameP_ShowList_MONK_1 = {
}



ANameP_ShowList_MONK_2 = {
}

ANameP_ShowList_MONK_3 = {
	["주학의 징표"] = {0, 1, {r = 1, g = 0.5, b = 0}},
}





ANameP_ShowList_WARLOCK_1 = {
	["고통"] = {5.4, 5, {r = 1, g = 0.5, b = 0}},	
	["부패"] = {4.2, 4},	
	["생명력 착취"] = {4.5, 3},
	["유령 출몰"] = {0, 2},
	["불안정한 고통"] = {0, 1},
}

ANameP_ShowList_WARLOCK_2 = {
	["파멸"] =  {4.56, 1},
}


ANameP_ShowList_WARLOCK_3 = {
	["제물"] = {4, 1, {r = 1, g = 0.5, b = 0}},	
	["대혼란"] = {1, 2},	
}


ANameP_ShowList_PRIEST_1 = {
	["어둠의 권능: 고통"] = {5, 2, {r = 1, g = 0.5, b = 0}},	
	["사악의 정화"] = {6, 1},	
}



ANameP_ShowList_PRIEST_2 = {
}



ANameP_ShowList_PRIEST_3 = {
	["어둠의 권능: 고통"] = {5, 3, {r = 1, g = 0.5, b = 0}},	
	["흡혈의 손길"] = {4, 2},
["파멸의 역병"] = {4, 1},	
}

ANameP_ShowList_SHAMAN_1 = {
	["화염 충격"] = {9, 1},	
}

ANameP_ShowList_SHAMAN_2 = {
}

ANameP_ShowList_SHAMAN_3 = {
}


ANameP_ShowList_DRUID_1 = {
	["달빛섬광"] = {22 * 0.3, 3, {r = 1, g = 0.5, b = 0}},	
	["태양섬광"] = {18 * 0.3, 2},	
	["항성의 섬광"] = {24 * 0.3, 1},	

}


ANameP_ShowList_DRUID_2 = {
	["갈퀴 발톱"] = {12 * 0.3, 4},	
	["도려내기"] = {19.2 * 0.3, 3, {r = 1, g = 0.5, b = 0}},	
	["난타"] = {12 * 0.3, 2},	
	["달빛섬광"] = {16 * 0.3, 1},
}

ANameP_ShowList_DRUID_3 = {
	["달빛섬광"] = {4.8, 1},
}


ANameP_ShowList_DRUID_4 = {
}


ANameP_ShowList_MAGE_1 = {
}

ANameP_ShowList_MAGE_2 = {
}


ANameP_ShowList_MAGE_3 = {
	["혹한의 추위"] = {3, 1},
	["빙결"] = {0, 3, {r = 1, g = 0.5, b = 0}},	
	["눈보라"] = {0, 1, {r = 1, g = 0.5, b = 0}},	
	["냉기 돌풍"] = {0, 2, {r = 1, g = 0.5, b = 0}},	

	


}



ANameP_ShowList_DEATHKNIGHT_1 = {
	["피의 역병"] = {9, 1} ,	
}

ANameP_ShowList_DEATHKNIGHT_2 = {
	["서리 열병"]  = {9, 1},	
}

ANameP_ShowList_DEATHKNIGHT_3 = {
	["악성 역병"] = {6.3, 1},
}


-- 아래 유닛명이면 강조
-- 색상 지정 가능
-- { r, g, b, 빤작임 여부}
local ANameP_AlertList = {
	["폭발물"] = {1, 1, 1, 0},	 -- 흰색 빤짝이 (없음)
	["그훈의 피조물"] = {0, 1, 0, 0},	-- 녹색 빤짝이 (없음)
	["고통받는 영혼"] = {0, 1, 0, 0},	-- 녹색 빤짝이 (없음)

--	["어둠그늘 곰팡이"] = {0, 1, 0, 0},	-- 녹색 빤짝이 (없음)
--	["훈련용 허수아비"] = {1, 1, 1, 0},	
	--["던전 사용자의 허수아비"] = {1, 1, 1, 0},	


}


-- 안보이게 할 디법
local ANameP_BlackList = {
--	["상처 감염 독"] = 1,	
--	["맹독"] = 1,
--	["약자 고문"] = 1,
--	["슬픔"] = 1,
--	["순환하는 기원"] = 1,
	["도전자의 짐"] = 1,	
	["도전자의 힘"] = 1,	

}

-- 크게 보이게 할 Debuff 값으로 추가 Size 를 입력 0 이거나 -도 가능
-- 일단 전장 Debuff 이 포함됨
local ANameP_BigDebuff = {

}




local ANameP_PVPBuffList = {

			-- Defensive Buffs
	[122470] =1,	-- Touch of Karma
	[116849] = 1,	-- Life Cocoon
	[33206] =1,	-- Pain Suppression
	[49039] = 1,	-- Lichborne
	--54216,	-- Master's Call UNUSED?
	[5277] = 1,	-- Evasion
	[199754] =1,	-- Riposte
	--110913,	-- Dark Bargain REMOVED IN LEGION
	[108359] = 1,	-- Dark Regeneration
	[104773] = 1,	-- Unending Resolve
	[18499] =1,	-- Berserker Rage
	[61336] = 1,	-- Survival Instincts
	[22812] = 1,	-- Barkskin
	[102342] = 1,	-- Iron Bark
	[6940] = 1,	-- Hand of Sacrifice
	[110909] = 1,	-- Alter Time
	--30823,	-- Shamanistic Rage REMOVED IN LEGION
	[118038] = 1,	-- Die by the Sword
	[33891] = 1,	-- Incarnation: Tree of Life
	[74001] = 1,	-- Combat Readiness
	[108271] =1,	-- Astral Shift
	--111397,	-- Blood Horror REMOVED IN LEGION
	[108416] =1,	-- Dark Pact
	--55694,	-- Enraged Regeneration REMOVED IN LEGION
	[47788] =1,	-- Guardian Spirit
	[122783] =1,	-- Diffuse Magic
	[12975] = 1,	-- Last Stand
	[871] = 1,	-- Shield Wall
	[212800] = 1,	-- Blur
	[55233] = 1,	-- Vampiric Blood
	[194679] =1,	-- Rune Tap
	[207319] = 1,	-- Corpse Shield


		-- Immune
	[19263] = 1,	-- Deterrence
	[186265] = 1, -- Aspect of the Turtle
	[45438] = 1,	-- Ice Block
	[642] = 1,	-- Divine Shield    
	[115018] = 1,	-- Desecrated Ground
	[31821] = 1,	-- Aura Mastery
	[1022] = 1,	-- Hand of Protection
	[47585] = 1,	-- Dispersion
	[31224] =1,	-- Cloak of Shadows
	--45182,	-- Cheating Death PROBABLY UNNECESSARY
	[8178] = 1,	-- Grounding Totem Effect (Grounding Totem)
	[76577] = 1,	-- Smoke Bomb
	[88611] = 1,	-- Smoke Bomb
	[46924] = 1,	-- Bladestorm

	-- Anti CC
	[48792] = 1,	-- Icebound Fortitude
	[48707] = 1,	-- Anti-Magic Shell
	[23920] = 1,	-- Spell Reflection
	[114028] = 1,	-- Mass Spell Reflection
	[5384] = 1,	-- Feign Death

		-- Offensive Buffs
	[51690] = 2,	-- Killing Spree
	--185422,	-- Shadow Dance UNNECESSARY, SUB ROGUES DANCE ALL THE DAMNED TIME
	--84747,	-- Deep Insight (Rogue Red Buff) REMOVED IN LEGION
	--84746,	-- Moderate Insight (Rogue Yellow Buff) REMOVED IN LEGION
	[13750] = 2,	-- Adrenaline Rush
	--112071,	-- Celestial Alignment REMOVED IN LEGION
	[31884] = 2,	-- Avenging Wrath
	[1719] = 2,	-- Battle Cry
	--113858,	-- Dark Soul REMOVED IN LEGION
	--113861,	-- Dark Soul REMOVED IN LEGION
	--113860,	-- Dark Soul REMOVED IN LEGION
	[102543] = 2,	-- Incarnation: King of the Jungle
	[106951] = 2,	-- Berserk
	[102560] = 2,	-- Incarnation: Chosen of Elune
	[12472] = 2,	-- Icy Veins
	--3045,	-- Rapid Fire UNUSED?
	[193526] = 2, -- Trueshot
	[19574] = 2,	-- Bestial Wrath
	[186289] = 2,	-- Aspect of the Eagle
	[51271] = 2,	-- Pillar of Frost
	[152279] = 2,	-- Breath of Sindragosa
	[105809] = 2,	-- Holy Avenger
	[16166] = 2,	-- Elemental Mastery
	[114050] = 2,	-- Ascendance
	[107574] = 2,	-- Avatar
	[121471] = 2,	-- Shadow Blades
	[12292] = 2,	-- Bloodbath
	[162264] = 2,	-- Metamorphosis



}
local ANameP_PVPBuffList = {


		-- Mage
	[45438] = 1, --Ice Block
	[118] = 1, --Polymorph
	[198111] = 1, --Temporal Shield (pvp)

	-- DK
	[48707] = 1, --Anti-Magic Shell
	[207319] = 1, --Corpse Shield
	[221562] = 1, --Asphyxiate

	-- Shaman
	[51514] = 1, --Hex
	[210918] = 1, --Ethereal Form
	[204437] = 1, --Lightning Lasso (pvp)

	-- Druid
	[61336] = 1, --Survival Instincts
	[29166] = 1, --Innervate
	[33786] = 1, --Cyclone
	[5211] = 1, --Mighty Bash

	-- Paladin
	[642] = 1, --Divine Shield
	[86659] = 1, --Guardian of Ancient Kings
	[228049] = 1, --Guardian of the Forgotten Queen
	[6940] = 1, --Blessing of Sacrifice
	[853] = 1, --Hammer of Justice

	-- Warrior
	[871] = 1, --Warrior Shield Wall
	[5246] = 1, --Intimidating Shout

	-- Rogue
	[2094] = 1, --Blind
	[199743] = 1, --Parley
	[6770] = 1, --Sap

	-- Hunter
	[19386] = 1, --Wyvern Sting
	[186265] = 1, --Aspect of the Turtle
	[53480] = 1, --Roar of Sacrifice (pet)

	-- Monk
	[115078] = 1, --Paralysis
	[115176] = 1, --Zen Meditation
	[122783] = 1, --Diffuse Magic
	[122278] = 1, --Dampen Harm

	-- Priest
	[605] = 1, --Mind Control
	[8122] = 1, --Psychic Scream
	[205369] = 1, --Mind Bomb
	[33206] = 1, --Pain Suppression
	[64901] = 1, --Symbol of Hope
	[47788] = 1, --Guardian Spirit
	[47585] = 1, --Dispersion

	-- Warlock
	[710] = 1, --Banish
	[5782] = 1, --Fear
	[104773] = 1, --Unending Resolve
	[6789] = 1, --Death Coil
	[5484] = 1, --Howl of Terror
	[212295] = 1, --Nether Ward
	[6358] = 1, --Seduction (Succubus)

	-- Demon Hunter
	[162264] = 1, --Metamorphosis
	[196555] = 1, --Netherwalk
	[206804] = 1, --Rain from Above (pvp) ?
	[204490] = 1, --Sigil of Silence
	[205629] = 1, --Demonic Trample
	[205630] = 1, --Illidan's Grasp


	[23333] = 1, -- Warsong Flag (horde WSG flag)
	[23335] = 1, -- Silverwing Flag (alliance WSG flag)
	[34976] = 1, -- Netherstorm Flag (EotS flag)
	[121164] = 1, --Orb of Power (Kotmogu?)
	[168506] = 1, --Ancient Artifact (Ashran)


		-- Mage
	[80353] = 2, --Timewarp
	[12042] = 2, --Arcane Power
	[190319] = 2, --Combustion - burst
	[12472] = 2, --Icy Veins
	[82691] = 2, --Ring of frost
	[198144] = 2, --Ice form (pvp)
	[86949] = 2, --Cauterize

	-- DK
	[47476] = 2, --Strangulate (pvp) - silence
	[48792] = 2, --Icebound Fortitude
	[116888] = 2, --Shroud of Purgatory
	[114556] = 2, --Purgatory (cd)

	-- Shaman
	[32182] = 2, --Heroism
	[2825] = 2, --Bloodlust
	[108271] = 2, --Astral shift
	[16166] = 2, --Elemental Mastery - burst
	[204288] = 2, --Earth Shield
	[114050] = 2, --Ascendance

	-- Druid
	[106951] = 2, --Berserk - burst
	[102543] = 2, --Incarnation: King of the Jungle - burst
	[102560] = 2, --Incarnation: Chosen of Elune - burst
	[33891] = 2, --Incarnation: Tree of Life
	[1850] = 2, --Dash
	[22812] = 2, --Barkskin
	[194223] = 2, --Celestial Alignment - burst
	[78675] = 2, --Solar beam
	[77761] = 2, --Stampeding Roar
	[102793] = 2, --Ursol's Vortex
	[102342] = 2, --Ironbark
	[339] = 2, --Entangling Roots
	[102359] = 2, --Mass Entanglement
	[22570] = 2, --Maim

	-- Paladin
	[1022] = 2, --Blessing of Protection
	[204018] = 2, --Blessing of Spellwarding
	[1044] = 2, --Blessing of Freedom
	[31884] = 2, --Avenging Wrath
	[224668] = 2, --Crusade
	[216331] = 2, --Avenging Crusader
	[20066] = 2, --Repentance
	[184662] = 2, --Shield of Vengeance
	[498] = 2, --Divine Protection
	[53563] = 2, --Beacon of Light
	[156910] = 2, --Beacon of Faith
	[115750] = 2, --Blinding Light

	-- Warrior
	[1719] = 2, --Battle Cry
	[23920] = 2, --Spell Reflection
	[46968] = 2, --Shockwave
	[18499] = 2, --Berserker Rage
	[107574] = 2, --Avatar
	[213915] = 2, --Mass Spell Reflection
	[118038] = 2, --Die by the Sword
	[46924] = 2, --Bladestorm
	[12292] = 2, --Bloodbath
	[199261] = 2, --Death Wish
	[107570] = 2, --Storm Bolt

	-- Rogue
	[45182] = 2, --Cheating Death
	[31230] = 2, --Cheat Death (cd)
	[31224] = 2, --Cloak of Shadows
	[2983] = 2, --Sprint
	[121471] = 2, --Shadow Blades
	[1966] = 2, --Feint
	[5277] = 2, --Evasion
	[212182] = 2, --Smoke Bomb
	[13750] = 2, --Adrenaline Rush
	[199754] = 2, --Riposte
	[198529] = 2, --Plunder Armor
	[199804] = 2, --Between the Eyes
	[1833] = 2, --Cheap Shot
	[1776] = 2, --Gouge
	[408] = 2, --Kidney Shot

	-- Hunter
	[117526] = 2, --Binding Shot
	[209790] = 2, --Freezing Arrow
	[213691] = 2, --Scatter Shot
	[3355] = 2, --Freezing Trap
	[162480] = 2, -- Steel Trap
	[19574] = 2, --Bestial Wrath
	[193526] = 2, --Trueshot
	[19577] = 2, --Intimidation
	[90355] = 2, --Ancient Hysteria
	[160452] = 2, --Netherwinds

	-- Monk
	[125174] = 2, --Touch of Karma
	[116849] = 2, -- Life Cocoon
	[119381] = 2, --Leg Sweep

	-- Priest
	[10060] = 2, --Power Infusion
	[9484] = 2, --Shackle Undead
	[200183] = 2, --Apotheosis
	[15487] = 2, --Silence
	[15286] = 2, --Vampiric Embrace
	[193223] = 2, --Surrender to Madness
	[88625] = 2, --Holy Word: Chastise

	-- Warlock
	[108416] = 2, --Dark Pact
	[196098] = 2 , --Soul Harvest
	[30283] = 2, --Shadowfury

	-- Demon Hunter
	[198589] = 2, --Blur
	[179057] = 2, --Chaos Nova
	[209426] = 2, --Darkness
	[217832] = 2, --Imprison
	[206491] = 2, --Nemesis
	[211048] = 2, --Chaos Blades
	[207685] = 2, --Sigil of Misery
	[209261] = 2, --Last Resort (cd)
	[207810] = 2, --Nether Bond

	----
	[2335] = 2, --Swiftness Potion
	[6624] = 2, --Free Action Potion
	[67867] = 2, --Trampled (ToC arena spell when you run over someone)



}

local ANameP_PVEBuffList = {

	[277242] = 5, --'그훈의 공생체' 
	[209859] = 0, --'강화' 
}

local ANameP_DangerousSpellList = { 

	[271797] = true,
	[276540] = true,
	[255824] = true,
	[253583] = true,
	[255041] = true,
	[253544] = true,
	[253517] = true,
	[256849] = true,
	[252781] = true,
	[250368] = true,
	[250096] = true,
	[257397] = true,
	[257899] = true,
	[257736] = true,
	[257784] = true,
	[257732] = true,
	[256060] = true,
	[267273] = true,
	[269973] = true,
	[270923] = true,
	[270901] = true,
	[270492] = true,
	[267763] = true,
	[268030] = true,
	[268309] = true,
	[267977] = true,
	[274437] = true,
	[268322] = true,
	[268375] = true,
	[276767] = true,
	[267818] = true,
	[256957] = true,
	[274569] = true,
	[263318] = true,
	[263775] = true,
	[265968] = true,
	[261635] = true,
	[272700] = true,
	[268061] = true,
	[265912] = true,
	[268709] = true,
	[280604] = true,
	[268129] = true,
	[268702] = true,
	[263103] = true,
	[263066] = true,
	[268797] = true,
	[269090] = true,
	[262540] = true,
	[262092] = true,
	[260879] = true,
	[266106] = true,
	[265089] = true,
	[265091] = true,
	[265433] = true,
	[272183] = true,
	[278961] = true,
	[265523] = true,
	[257791] = true,
	[258128] = true,
	[258153] = true,
	[258313] = true,
	[258634] = true,
	[258935] = true,
	[266225] = true,
	[263959] = true,
	[265876] = true,
	[265368] = true,
	[266036] = true,
	[278551] = true,
	[265407] = true,
	[267427] = true,
	[268198] = true,
	[274019] = true,
	[276540] = true,
	[277358] = true,
	[267180] = true,
	[270620] = true,
	[284578] = true,
	[283628] = true,
	[283626] = true,
	[286379] = true,
	[290084] = true,
	[284765] = true,
	[276540] = true,
	[271797] = true,
	[276540] = true,
	[255824] = true,
	[253583] = true,
	[255041] = true,
	[253544] = true,
	[253517] = true,
	[256849] = true,
	[252781] = true,
	[250368] = true,
	[250096] = true,
	[257397] = true,
	[257899] = true,
	[257736] = true,
	[257784] = true,
	[257732] = true,
	[256060] = true,
	[267273] = true,
	[269973] = true,
	[270923] = true,
	[270901] = true,
	[270492] = true,
	[267763] = true,
	[268030] = true,
	[268309] = true,
	[267977] = true,
	[274437] = true,
	[268322] = true,
	[268375] = true,
	[276767] = true,
	[267818] = true,
	[256957] = true,
	[274569] = true,
	[263318] = true,
	[263775] = true,
	[265968] = true,
	[261635] = true,
	[272700] = true,
	[268061] = true,
	[265912] = true,
	[268709] = true,
	[280604] = true,
	[268129] = true,
	[268702] = true,
	[263103] = true,
	[263066] = true,
	[268797] = true,
	[269090] = true,
	[262540] = true,
	[262092] = true,
	[260879] = true,
	[266106] = true,
	[265089] = true,
	[265091] = true,
	[265433] = true,
	[272183] = true,
	[278961] = true,
	[265523] = true,
	[257791] = true,
	[258128] = true,
	[258153] = true,
	[258313] = true,
	[258634] = true,
	[258935] = true,
	[266225] = true,
	[263959] = true,
	[265876] = true,
	[265368] = true,
	[266036] = true,
	[278551] = true,
	[265407] = true,
	[267427] = true,
	[268198] = true,
	[274019] = true,
	[276540] = true,
	[277358] = true,
	[267180] = true,
	[270620] = true,
	[284578] = true,
	[283628] = true,
	[283626] = true,
	[286379] = true,
	[290084] = true,
	[284765] = true,
	[276540] = true,	

	[285572] = true, -- 무덤화살

}



local ANameP_HealSpellList = {};

ANameP_HealSpellList["사제"] = {

 	    [047540] = "PRIEST", -- Penance XXX strange error received from user on 2015-10-15 (this spell was cast by a hunter...)
        [109964] = "PRIEST", -- Spirit shell -- not seen in disc
        [002060] = "PRIEST", -- Greater Heal
        [014914] = "PRIEST", -- Holy Fire
        [033206] = "PRIEST", -- Pain Suppression
        [000596] = "PRIEST", -- Prayer of Healing
        [000527] = "PRIEST", -- Purify
        [081749] = "PRIEST", -- Atonement
        [132157] = "PRIEST", -- Holy Nova
        [034861] = "PRIEST", -- Circle of Healing
        [064843] = "PRIEST", -- Divine Hymn
        [047788] = "PRIEST", -- Guardian Spirit
        [032546] = "PRIEST", -- Binding Heal
        [077485] = "PRIEST", -- Mastery: Echo of Light -- the passibe ability
        [077489] = "PRIEST", -- Echo of Light -- the aura applied by the afformentioned
        [000139] = "PRIEST", -- Renew

	};

ANameP_HealSpellList["드루이드"] = {

        [102342] = "DRUID", -- Ironbark
        [033763] = "DRUID", -- Lifebloom
        [088423] = "DRUID", -- Nature's Cure
        [033891] = "DRUID", -- Incarnation: Tree of Life
        [048438] = "DRUID", -- Wild Growth
        [000740] = "DRUID", -- Tranquility
	};


ANameP_HealSpellList["주술사"] = {

        [061295] = "SHAMAN", -- Riptide
        [077472] = "SHAMAN", -- Healing Wave
        [098008] = "SHAMAN", -- Spirit link totem
        [001064] = "SHAMAN", -- Chain Heal
        [073920] = "SHAMAN", -- Healing Rain

	};

ANameP_HealSpellList["성기사"] = {

        [020473] = "PALADIN", -- Holy Shock
        [053563] = "PALADIN", -- Beacon of Light
        [082326] = "PALADIN", -- Holy Light
        [085222] = "PALADIN", -- Light of Dawn
	};


ANameP_HealSpellList["수도사"] = {
        [115175] = "MONK", -- Soothing Mist
        [115310] = "MONK", -- Revival
        [116670] = "MONK", -- Vivify
        [116680] = "MONK", -- Thunder Focus Tea
        [116849] = "MONK", -- Life Cocoon
        [119611] = "MONK", -- Renewing mist

};



local ANameP_HealerGuid = {

}

local ANameP = nil;

local unusedOverlayGlows = {};
local numOverlays = 0;
local tanklist = {}

local PLAYER_UNITS = {
	player = true,
	vehicle = true,
	pet = true,
};


local lowhealthpercent = 0;

local ColorLevel = {
	None = 0,
	Custom = 1,
	Debuff = 2,
	Lowhealth = 3,
	Aggro = 4,
	Target = 5,
	Name = 6,
};


local function updateTankerList()

	local bInstance, RTB_ZoneType = IsInInstance();

	if RTB_ZoneType == "pvp" or RTB_ZoneType == "arena" then
		return nil;
	end

	tanklist =	table.wipe(tanklist)
	if IsInGroup() then
		if IsInRaid() then -- raid
			for i=1,GetNumGroupMembers() do
				local unitid = "raid"..i
				local notMe = not UnitIsUnit('player',unitid)
				local unitName = UnitName(unitid)
				if unitName and notMe then
					local _,_,_,_,_,_,_,_,_,role,_, assignedRole = GetRaidRosterInfo(i) -- role = 'MAINTANK|MAINASSIST', assignedRole = 'TANK|HEALER|DAMAGER|NONE'
					if assignedRole == "TANK" then
						table.insert(tanklist, unitid)
					end
				end
			end
		else -- party
			for i=1,GetNumSubgroupMembers() do
				local unitid = "party"..i
				local unitName = UnitName(unitid)
				if unitName then
					local role,assignedRole
					if ( GetPartyAssignment('MAINTANK', unitid) ) then
						role = 'MAINTANK'
					end
					assignedRole = UnitGroupRolesAssigned(unitid)

					if assignedRole == "TANK" then
						table.insert(tanklist, unitid)
					end

				end
			end
		end
	end
end



function ANameP_OverlayGlowAnimOutFinished(animGroup)
	local overlay = animGroup:GetParent();
	local actionButton = overlay:GetParent();
	overlay:Hide();
	tinsert(unusedOverlayGlows, overlay);
	actionButton.overlay = nil;
end

function  ANameP_GetOverlayGlow()
	local overlay = tremove(unusedOverlayGlows);
	if ( not overlay ) then
		numOverlays = numOverlays + 1;
		overlay = CreateFrame("Frame", "ANameP_ActionButtonOverlay"..numOverlays, UIParent, "ANameP_ActionBarButtonSpellActivationAlert");
	end
	return overlay;
end


function ANameP_ShowOverlayGlow(self)
	if ( self.overlay ) then
		if ( self.overlay.animOut:IsPlaying() ) then
			self.overlay.animOut:Stop();
			self.overlay.animIn:Play();
		end
	else
		self.overlay = ANameP_GetOverlayGlow();
		local frameWidth, frameHeight = self:GetSize();
		self.overlay:SetParent(self);
		self.overlay:ClearAllPoints();
		--Make the height/width available before the next frame:
		self.overlay:SetSize(frameWidth * 1.4, frameHeight * 1.4);
		self.overlay:SetPoint("TOPLEFT", self, "TOPLEFT", -frameWidth * 0.3, frameHeight * 0.3);
		self.overlay:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", frameWidth * 0.3, -frameHeight * 0.3);
		self.overlay.animIn:Play();
	end
end

function ANameP_HideOverlayGlow(self)
	if ( self.overlay ) then
		if ( self.overlay.animIn:IsPlaying() ) then
			self.overlay.animIn:Stop();
		end
		if ( self:IsVisible() ) then
			self.overlay.animOut:Play();
		else
			ANameP_OverlayGlowAnimOutFinished(self.overlay.animOut);	--We aren't shown anyway, so we'll instantly hide it.
		end
	end
end






function ANameP_OverlayGlowOnUpdate(self, elapsed)
	AnimateTexCoords(self.ants, 256, 256, 48, 48, 22, elapsed, 0.01);
end



local function IsPlayerEffectivelyTank()
	local assignedRole = UnitGroupRolesAssigned("player");
	if ( assignedRole == "NONE" ) then
		local spec = GetSpecialization();
		return spec and GetSpecializationRole(spec) == "TANK";
	end
	return assignedRole == "TANK";
end



local function asShouldShowBuff(name, caster, nameplateShowPersonal, nameplateShowAll, duration)
	if (not name) then
		return false;
	end
	return (nameplateShowAll or (nameplateShowPersonal and PLAYER_UNITS[caster]));
end


local function createDebuffFrame(parent, frameName)

	local ret = CreateFrame("Frame", frameName, parent, "asNamePlatesBuffFrameTemplate");
	ret:EnableMouse(false);
					
	for _,r in next,{_G[frameName.."Cooldown"]:GetRegions()}	do 
		if r:GetObjectType()=="FontString" then 
			r:SetFont(STANDARD_TEXT_FONT, ANameP_CooldownFontSize,"OUTLINE")
			r:SetPoint("TOPLEFT", -2, 4);
			break;
		end 
	end

	local font, size, flag = _G[frameName.."Count"]:GetFont()

	_G[frameName.."Count"]:SetFont(font, ANameP_CountFontSize, "OUTLINE")
	_G[frameName.."Count"]:SetPoint("BOTTOMRIGHT", 0, 0);

	local frameIcon = _G[frameName.."Icon"];
	local frameBorder = _G[frameName.."Border"];
					
	frameIcon:SetTexCoord(.08, .92, .08, .92)
	frameBorder:SetTexture("Interface\\Addons\\asNamePlates\\border.tga")
	frameBorder:SetTexCoord(0.08,0.08, 0.08,0.92, 0.92,0.08, 0.92,0.92)	

	return ret;

end

local function setFrame(frameName, texture, count, expirationTime, duration, color)

	local frameIcon = _G[frameName.."Icon"];
	frameIcon:SetTexture(texture);

	local frameCount = _G[frameName.."Count"];
	local frameCooldown = _G[frameName.."Cooldown"];

	if count and  (count > 1) then
		frameCount:SetText(count);
		frameCount:Show();
		frameCooldown:SetDrawSwipe(false);
	else
		frameCount:Hide();
		frameCooldown:SetDrawSwipe(true);
	end

	CooldownFrame_Set(frameCooldown, expirationTime - duration, duration, duration > 0, true);
	frameCooldown:SetHideCountdownNumbers(false);
						
	local frameBorder = _G[frameName.."Border"];
	frameBorder:SetVertexColor(color.r, color.g, color.b);
end


local function setSize(frame, size)

	frame:SetWidth(size + 2);
	frame:SetHeight((size + 2) * ANameP_Size_Rate);

end



local function updateDebuffAnchor(debuffName, index, anchorIndex, size, offsetX, right, parent)

	local buff = _G[debuffName..index];
	local point1 = "BOTTOMLEFT";
	local point2 = "BOTTOMLEFT";
	local point3 = "BOTTOMRIGHT";

	if (right == false) then
		point1 = "BOTTOMRIGHT";
		point2 = "BOTTOMRIGHT";
		point3 = "BOTTOMLEFT";
		offsetX = -offsetX;
	end

	buff:ClearAllPoints();

	if parent.downbuff then

		if ( index == 1 ) then
		--buff:SetPoint(point1, parent, point2, 0, 0);
			buff:SetPoint("TOPLEFT", parent, "BOTTOMLEFT", 0, 0);
		elseif ( index == (debuffs_per_line + 1) ) then
			buff:SetPoint("TOPLEFT", _G[debuffName..1], "BOTTOMLEFT", 0, -4);
		else
			buff:SetPoint(point1, _G[debuffName..(index-1)], point3, offsetX, 0);
		end

	else

		if ( index == 1 ) then
			--buff:SetPoint(point1, parent, point2, 0, 0);
			buff:SetPoint("BOTTOMLEFT", parent, "TOPLEFT", 0, 0);
		elseif ( index == (debuffs_per_line + 1) ) then
			buff:SetPoint("BOTTOMLEFT", _G[debuffName..1], "TOPLEFT", 0, 4);
		else
			buff:SetPoint(point1, _G[debuffName..(index-1)], point3, offsetX, 0);
		end


	end


	-- Resize
	buff:SetWidth(size);
	buff:SetHeight(size * ANameP_Size_Rate);
	local debuffFrame =_G[debuffName..index.."Border"];
	debuffFrame:SetWidth(size+2);
	debuffFrame:SetHeight((size+2) * ANameP_Size_Rate);
end


local function Comparison(AIndex, BIndex)



	local AID = AIndex[2];
	local BID = BIndex[2];

	if (AID ~= BID) then
		return AID > BID;
	end

	return false;
end



local function updateAuras(self, unit, filter, showbuff, helpful, showdebuff)

	local numDebuffs = 1;
	local frametype = self:GetParent():GetName() .. "Buff"
	local size_list = {};
	local parent = self:GetParent();
	local healthBar = parent.UnitFrame.healthBar;


	self.unit = unit;
	self.reflesh_time = nil;

	if not self.unit then
		return
	end

	local value = UnitHealth(unit);
	local valueMax = UnitHealthMax(unit);
	local valuePct = 0;

	if valueMax > 0 then
		valuePct =  (math.ceil((value / valueMax) * 100));
	end

	if self.colorlevel <= ColorLevel.Lowhealth and not UnitIsUnit(unit, "player") and lowhealthpercent > 0  then
		if valuePct <= lowhealthpercent then
			healthBar:SetStatusBarColor(ANameP_LowHealthColor.r, ANameP_LowHealthColor.g, ANameP_LowHealthColor.b);
			self.colorlevel = ColorLevel.Lowhealth;
		elseif self.colorlevel == ColorLevel.Lowhealth and healthBar.currcolor then
			healthBar:SetStatusBarColor(healthBar.currcolor[1], healthBar.currcolor[2], healthBar.currcolor[3]);
			self.colorlevel = ColorLevel.None;
		end		
	end

       
    local inRange, checkedRange = UnitInRange(unit);

	if UnitAffectingCombat("player") then

		if UnitAffectingCombat(unit) or valuePct < 100 or self.colorlevel > ColorLevel.None then
		    if ( checkedRange and not inRange ) then	--If we weren't able to check the range for some reason, we'll just treat them as in-range (for example, enemy units)
    		    parent.UnitFrame:SetAlpha(0.55);
            else
    		   	parent.UnitFrame:SetAlpha(ANameP_Alpha_Combat);
        	end
		else
			parent.UnitFrame:SetAlpha(ANameP_Alpha_Normal);
		end
	else

        if ( checkedRange and not inRange ) then	--If we weren't able to check the range for some reason, we'll just treat them as in-range (for example, enemy units)
    		parent.UnitFrame:SetAlpha(0.55);
        else
		   	parent.UnitFrame:SetAlpha(1);
    	end
	end


	local icon_size = self.icon_size; 

	if showbuff and not showdebuff then

		local aShowIdx = {};
		local aShowNum = 1;

		for i = 1, BUFF_MAX_DISPLAY do

			if (filter == "NONE" and self.buffList[i]) then
				self.buffList[i]:Hide();
				self:Hide();
				return;
			end
		
			local name,  texture, count, debuffType, duration, expirationTime, caster, isStealable, nameplateShowPersonal, spellId, _, _, _, nameplateShowAll = UnitAura(unit, i, "HELPFUL");
			if name then

				local show = false;
				local bPVP = false;

				if UnitIsPlayer(unit) then
					show = ANameP_PVPBuffList[spellId];
					bPVP = true;
				else
					if ANameP_PVEBuffList and  ANameP_PVEBuffList[spellId] then
						show = true;
					elseif isStealable then
						show = true;
					elseif caster and UnitIsUnit(unit, caster) then
						show = true;
					end

					if show  and ANameP_BlackList[name] then
						show = false;
					end
				end
						
				if  show  then


					if UnitIsPlayer(unit) then
						aShowIdx[aShowNum] = {i, 0};


						aShowNum =aShowNum  + 1;
						-- 일단 1개만
						if numDebuffs + aShowNum - 1   > ANameP_MaxBuff  then
							break;
						end

					else				
						if ANameP_PVEBuffList and ANameP_PVEBuffList[spellId]  then
							aShowIdx[aShowNum] = {i, ANameP_PVEBuffList[spellId]};
						elseif isStealable then
							aShowIdx[aShowNum] = {i, 4};
						else
							aShowIdx[aShowNum] = {i, 1};
						end
						
						aShowNum =aShowNum  + 1;

						-- PVE 는 계속

					end
				end
			else
				break;
			end
		end


		if ANameP_ShowListFirst then
			-- sort
			table.sort(aShowIdx, Comparison);
		end


		for v = 1 , aShowNum - 1 do

			if numDebuffs  > ANameP_MaxBuff  then
				break;
			end


			local i = aShowIdx[v][1];
			
			local name,  texture, count, debuffType, duration, expirationTime, caster, isStealable, nameplateShowPersonal, spellId, _, _, _, nameplateShowAll = UnitAura(unit, i, "HELPFUL");


			local frameName = frametype.. numDebuffs;
					
			if (not self.buffList[numDebuffs]) then
				self.buffList[numDebuffs] = createDebuffFrame(self, frameName)
			end

			local frame = self.buffList[numDebuffs];

			if bPVP == true then
				size_list[numDebuffs] = icon_size + 2;
			else
				size_list[numDebuffs] = icon_size;
			end

			setSize (frame, size_list[numDebuffs])

						
			if isStealable then
				ANameP_ShowOverlayGlow(frame);
			else
				ANameP_HideOverlayGlow(frame);
			end
	

			local color = {r = 1, g = 1, b = 1}
			setFrame(frameName, texture, count, expirationTime, duration, color)
		
			frame:Show();

			numDebuffs = numDebuffs + 1;
		end
	end

	if not showdebuff then
		


		local aShowIdx = {};
		local aShowNum = 1;

		for i = 1, BUFF_MAX_DISPLAY do

			if (filter == "NONE" and self.buffList[i]) then
				self.buffList[i]:Hide();
				self:Hide();
				return;
			end

			if numDebuffs + aShowNum - 1  > ANameP_MaxDebuff  then
				break;
			end

			local name,  texture, count, debuffType, duration, expirationTime, caster, _, nameplateShowPersonal, spellId, _, isBossDebuff, _, nameplateShowAll  = UnitAura(unit, i, filter);
			if name then


				-- Default 로 Show List 에 있는 것만 보임
				local show = PLAYER_UNITS[caster] and (ANameP_ShowList and ANameP_ShowList[name]);

				-- Player 일 경우
				if  UnitIsUnit("player", unit) then
					if ANameP_ShowPlayerBuff and PLAYER_UNITS[caster] and duration > 0 and duration <= ANameP_BuffMaxCool then
						show = true;
					end			
				else

					if ANameP_ShowMyAll and PLAYER_UNITS[caster] then
						if helpful then
							if duration > 0 and duration <= ANameP_BuffMaxCool then
								show = true;
							end
						else
							show = true;
						end
					elseif not ANameP_ShowMyAll and PLAYER_UNITS[caster] and nameplateShowPersonal then
						show = true;

					end

					--if ANameP_ShowPVPDebuff and ANameP_PVPDebuffList[spellId] then
					if ANameP_ShowPVPDebuff and nameplateShowAll then
						show = true;
					end	

					if isBossDebuff or ( caster and  not UnitIsPlayer(unit) and UnitIsUnit(unit, caster)) then
						show = true;
					end
					
				end
										
				if show  and ANameP_BlackList[name] then
					show = false;
				end
			
				if show then

					if ANameP_ShowList and ANameP_ShowList[name]  then
						aShowIdx[aShowNum] = {i, ANameP_ShowList[name][2]};
					else
						aShowIdx[aShowNum] = {i, 0};
					end
					aShowNum =aShowNum  + 1;
				end
			else
				break;
			end
		end


		if ANameP_ShowListFirst then
			-- sort
			table.sort(aShowIdx, Comparison);
		end


		local bcannotfinddebuff = true;
		
		for v = 1 , aShowNum - 1 do

			local i = aShowIdx[v][1];
			
			local name,  texture, count, debuffType, duration, expirationTime, caster, _, nameplateShowPersonal, spellId, _, isBossDebuff, _, nameplateShowAll = UnitAura(unit, i, filter);

				
			local alert = false;
			local showlist_time = 0;
			
			if ANameP_ShowList and ANameP_ShowList[name] then
				showlist_time = ANameP_ShowList[name][1];
			
				if  showlist_time >= 0  then
					local alert_time = expirationTime - showlist_time;
		
					if (GetTime() >= alert_time) and duration > 0  then
						alert = true;
					else
						if self.reflesh_time and self.reflesh_time >= alert_time then
							self.reflesh_time = alert_time;
						elseif self.reflesh_time == nil then
							self.reflesh_time = alert_time;
						end

						if ANameP_ShowList[name][3] and self.colorlevel <= ColorLevel.Debuff then
							local color = ANameP_ShowList[name][3];
							healthBar:SetStatusBarColor(color.r, color.g, color.b);
							self.colorlevel = ColorLevel.Debuff;
							bcannotfinddebuff = false;
						end


					end
				end

			end

			local frameName = frametype.. numDebuffs;
			if (not self.buffList[numDebuffs]) then
				self.buffList[numDebuffs] = createDebuffFrame(self, frameName)
			end

			local frame = self.buffList[numDebuffs];

			size_list[numDebuffs] = icon_size;


			if (showlist_time) then
				size_list[numDebuffs] = icon_size;
			end

			if not PLAYER_UNITS[caster] then
				size_list[numDebuffs] = icon_size - 2;
			end


			if nameplateShowAll then
				size_list[numDebuffs] = icon_size + ANameP_PVP_Debuff_Size_Rate;
			end

			if isBossDebuff then
				size_list[numDebuffs] = icon_size + ANameP_PVP_Debuff_Size_Rate;
			end


			setSize (frame, size_list[numDebuffs])


			if alert and duration > 0  then
				ANameP_ShowOverlayGlow(frame);
			else
				ANameP_HideOverlayGlow(frame);
			end
		
			local color =DebuffTypeColor["none"];

			if helpful then
				color =DebuffTypeColor["Disease"];
			end

			if ( not UnitIsUnit("player", unit) and not PLAYER_UNITS[caster]) then
				color = { r = 0.3, g = 0.3, b = 0.3 };
			end


			if debuffType then
				color = DebuffTypeColor[debuffType];
			end

			setFrame(frameName, texture, count, expirationTime, duration, color)
		
			frame:Show();

			numDebuffs = numDebuffs + 1;


		end


		if self.colorlevel == ColorLevel.Debuff and bcannotfinddebuff == true then
			if healthBar.currcolor then
				healthBar:SetStatusBarColor(healthBar.currcolor[1], healthBar.currcolor[2], healthBar.currcolor[3]);
				self.colorlevel = ColorLevel.None
			end
		end

	end


	if not showdebuff then
		for i = 1, numDebuffs - 1 do
			updateDebuffAnchor(frametype, i, i - 1, size_list[i], 4, true, self);
		end
	end

	for i = numDebuffs, ANameP_MaxDebuff do
		if ( self.buffList[i] ) then
			self.buffList[i]:Hide();	
		end
	end

	if numDebuffs > 1 then
		self:Show();
	end


end

local function updateUnitAuras(unit)

	local nameplate = C_NamePlate.GetNamePlateForUnit(unit, issecure());
	if (nameplate and nameplate.asNamePlates and not nameplate:IsForbidden()) then
		if nameplate.asNamePlates.checkaura then
			updateAuras(nameplate.asNamePlates, nameplate.namePlateUnitToken, nameplate.asNamePlates.filter, nameplate.asNamePlates.showbuff, nameplate.asNamePlates.helpful, nameplate.asNamePlates.showdebuff);
		else
			nameplate.asNamePlates:Hide();
		end

	end
end


local function updateUnitHealthText(self, unit)
	local value
	local valueMax;
	local valuePct = ""
	local namePlateFrameBase = C_NamePlate.GetNamePlateForUnit(unit, issecure());
	if not namePlateFrameBase then
		return
	end
	local frame = namePlateFrameBase.asNamePlates;

	if not frame then
		return;
	end

	if UnitIsUnit("player", frame.unit) then
	else
		local reaction = UnitReaction("player", frame.unit);
		if reaction and reaction <= 4 then
		else
			return;
		end
	end



	value = UnitHealth(unit);
	valueMax = UnitHealthMax(unit);

	if valueMax > 0 then
		valuePct =  (math.ceil((value / valueMax) * 100));
	end

	if (valueMax <= 300) then
		valuePct = value;
	end

	if valuePct > 0 then
		frame.healthtext:SetText(valuePct);
	else
		frame.healthtext:SetText("");
	end


	if valuePct <= lowhealthpercent then
		frame.healthtext:SetTextColor(1, 0.5, 0.5, 1);
	elseif valuePct > 0 then

		frame.healthtext:SetTextColor(1, 1, 1, 1);
	end

end


local function updateUnitResourceText(self, unit)
	local value;
	local valueMax;
	local valuePct = ""
	if UnitIsUnit("player", unit) then
	else
		return;
	end

	if ANameP_Resourcetext == nil then
		return;
	end

	value = UnitPower(unit);
	valueMax = UnitPowerMax(unit);

	if valueMax > 0 then
		valuePct =  (math.ceil((value / valueMax) * 100));
	end

	if (valueMax <= 300) then
		valuePct = value;
	end

	if valuePct > 0 then
		ANameP_Resourcetext:SetText(valuePct);
	else
		ANameP_Resourcetext:SetText("");
	end


	if valuePct > 0 then

		ANameP_Resourcetext:SetTextColor(1, 1, 1, 1);
	end

end



local orig_height = nil;
local orig_width = nil;


local function SetBorderColor(frame, r, g, b, a)
	frame.healthBar.border:SetVertexColor(r, g, b, a);
	if frame.castBar and frame.castBar.border then
		frame.castBar.border:SetVertexColor(r, g, b, a);
	end
end

local function asUpdateHealthBorder(frame)
	if frame.optionTable.selectedBorderColor and UnitIsUnit(frame.displayedUnit, "target") then
		SetBorderColor(frame, frame.optionTable.selectedBorderColor:GetRGBA());
		return;
	end

	--[[
	if frame.optionTable.tankBorderColor and IsInGroup() and IsPlayerEffectivelyTank() then
		local isTanking, threatStatus = UnitDetailedThreatSituation("player", frame.displayedUnit);
		local showTankingColor = (not isTanking) and IsOnThreatList(threatStatus) and IsInGroup();
		if showTankingColor then
			SetBorderColor(frame, frame.optionTable.tankBorderColor:GetRGBA());
			return;
		end
	end
	--]]

	if frame.optionTable.defaultBorderColor then
		SetBorderColor(frame, frame.optionTable.defaultBorderColor:GetRGBA());
		return;
	end
end



local function asUpdateSelectionHighlight(frame)
	if ( not frame.optionTable.displaySelectionHighlight ) then
		frame.selectionHighlight:Hide();
		return;
	end

	if ( UnitIsUnit(frame.displayedUnit, "target") ) then
		frame.selectionHighlight:Show();
	else
		frame.selectionHighlight:Hide();
	end
end


local function asShouldShowName(frame)
	if ( frame.optionTable.displayName ) then
		local failedRequirement = false;
		if ( frame.optionTable.displayNameByPlayerNameRules ) then
			if ( UnitShouldDisplayName(frame.unit) ) then
				return true;
			end
			failedRequirement = true;
		end

		--if ( frame.optionTable.displayNameWhenSelected ) then
		if ( true ) then

			if ( UnitIsUnit(frame.unit, "target") ) then
				return true;
			end
			failedRequirement = true;
		end

		return not failedRequirement;
	end

	return false;
end


local function IsOnThreatList(threatStatus)
	return threatStatus ~= nil
end



local function asCompactUnitFrame_IsOnThreatListWithPlayer(unit)
	local _, threatStatus = UnitDetailedThreatSituation("player", unit);
	return IsOnThreatList(threatStatus);
end



local function asCompactUnitFrame_IsTapDenied(frame)
	return frame.optionTable.greyOutWhenTapDenied and not UnitPlayerControlled(frame.unit) and UnitIsTapDenied(frame.unit);
end



local function asUpdateName(frame)


	if frame:IsForbidden() then
		return
	end

	if ( not asShouldShowName(frame) ) then
		frame.name:Hide();
	else
		local name = GetUnitName(frame.unit, true);
		if ( C_Commentator.IsSpectating() and name ) then
			local overrideName = C_Commentator.GetPlayerOverrideName(name);
			if overrideName then
				name = overrideName;
			end
		end

		frame.name:SetText(name);

		if ( asCompactUnitFrame_IsTapDenied(frame) ) then
			-- Use grey if not a player and can't get tap on unit
			frame.name:SetVertexColor(0.5, 0.5, 0.5);
		elseif ( frame.optionTable.colorNameBySelection ) then
			if ( frame.optionTable.considerSelectionInCombatAsHostile and asCompactUnitFrame_IsOnThreatListWithPlayer(frame.displayedUnit) ) then
				frame.name:SetVertexColor(1.0, 0.0, 0.0);
			else
				frame.name:SetVertexColor(UnitSelectionColor(frame.unit, frame.optionTable.colorNameWithExtendedColors));
			end
		end

		frame.name:Show();

	end
end

local function updateAggroColor(self, bFirst)

	if not ANameP_AggroShow then
		return
	end

	if not self.unit then
		return
	end

	local parent = self:GetParent();
	local healthBar = parent.UnitFrame.healthBar;


	if parent.UnitFrame:IsForbidden() then
		return;
	end

	if not 	self.r or self.r ~= healthBar.r then
		self.r, self.g, self.b = healthBar.r, healthBar.g, healthBar.b
		healthBar.currcolor = {};
		healthBar.currcolor = {healthBar.r, healthBar.g, healthBar.b};

	end

	local nr, ng, nb = healthBar.r, healthBar.g, healthBar.b;
	
	if self.colorlevel == ColorLevel.Name then

       local unitname = GetUnitName(self.unit);

		if unitname and ANameP_AlertList[unitname] and not healthBar:IsForbidden() then
			healthBar:SetStatusBarColor(ANameP_AlertList[unitname][1], ANameP_AlertList[unitname][2], ANameP_AlertList[unitname][3]);
			healthBar.currcolor = {};
			healthBar.currcolor = {ANameP_AlertList[unitname][1], ANameP_AlertList[unitname][2], ANameP_AlertList[unitname][3]};
			return;
		end

		return;
	end

    if bFirst then
        return;
    end

	if self.colorlevel > ColorLevel.Aggro then
		return;
	end

	
	if UnitIsUnit(self.unit.."target", "player" )  then
		nr, ng, nb = ANameP_AggroTargetColor.r, ANameP_AggroTargetColor.g, ANameP_AggroTargetColor.b;
		self.colorlevel = ColorLevel.Aggro;
	else

		local status = UnitThreatSituation("player", self.unit);
		local tanker = IsPlayerEffectivelyTank();
	

		if status == nil then
			self.colorlevel = ColorLevel.None;
		else

			if tanker then

				if status >= 2 then
					-- Tanking
					local aggrocolor = ANameP_AggroColor;
					nr, ng, nb = aggrocolor.r, aggrocolor.g, aggrocolor.b;
					self.colorlevel = ColorLevel.Aggro;
				else
					local aggrocolor = ANameP_TankAggroLoseColor;

					if #tanklist > 0 then

						for _, othertank in ipairs(tanklist) do
							if UnitIsUnit(self.unit.."target", othertank ) and not UnitIsUnit(self.unit.."target", "player" ) then
								aggrocolor = ANameP_TankAggroLoseColor2;
								self.colorlevel = ColorLevel.Aggro;
								break;
							end
						end
					
						self.colorlevel = ColorLevel.Aggro;
					
					end	

                    nr, ng, nb = aggrocolor.r, aggrocolor.g, aggrocolor.b;
				end

			else

				if status >= 1 then
					-- Tanking
					local aggrocolor = ANameP_AggroColor;
					nr, ng, nb = aggrocolor.r, aggrocolor.g, aggrocolor.b;
					self.colorlevel = ColorLevel.Aggro;
				else

					if (self.colorlevel == ColorLevel.Debuff) or (self.colorlevel == ColorLevel.Lowhealth)  then
						return;
					end


					local aggrocolor = ANameP_TankAggroLoseColor;
					aggrocolor.r, aggrocolor.g, aggrocolor.b = healthBar.r, healthBar.g, healthBar.b;

					self.colorlevel = ColorLevel.None;

					if #tanklist > 0 then
						for _, othertank in ipairs(tanklist) do
							if UnitIsUnit(self.unit.."target", othertank ) and not UnitIsUnit(self.unit.."target", "player" ) then
								aggrocolor = ANameP_TankAggroLoseColor2;
								self.colorlevel = ColorLevel.Custom;

								break;
							end
						end
					end

					if UnitIsUnit(self.unit.."target", "pet" )  then
						aggrocolor = ANameP_TankAggroLoseColor3;
						self.colorlevel = ColorLevel.Custom;

					end

					nr, ng, nb = aggrocolor.r, aggrocolor.g, aggrocolor.b;
				end
			end
		end

	end


	if ANameP_AggroStatusBarColor and nr and not healthBar:IsForbidden() then
		healthBar:SetStatusBarColor(nr, ng, nb);
		healthBar.currcolor = {};
		healthBar.currcolor = {nr, ng, nb};
	end

end


local function updateTargetNameP(self)

	if not self.unit then
		return
	end

	local parent = self:GetParent();

    if not parent then
        return;
    end

	local healthBar = parent.UnitFrame.healthBar;

    if not healthBar then
        return;
    end

	asUpdateSelectionHighlight(parent.UnitFrame);
	asUpdateHealthBorder(parent.UnitFrame);
	asUpdateName(parent.UnitFrame);

	local base_y = ANameP_TargetBuffY;

	if parent.UnitFrame.name:IsShown() then
		base_y = base_y + parent.UnitFrame.name:GetHeight();
	end
	local 	Buff_Y = base_y;


	if UnitIsUnit("target", self.unit) and GetCVar("nameplateResourceOnTarget") == "1" then

		local class = NamePlateDriverFrame:GetClassNameplateBar()

		if class  then
			Buff_Y = base_y +  class:GetHeight() ;
		end
	end


    if not UnitIsUnit("player", self.unit) then
        self:ClearAllPoints();
        self:SetPoint("BOTTOMLEFT", healthBar, "TOPLEFT", 0, Buff_Y);
    end


	if UnitIsUnit("player", self.unit) then
		--return
	else
		local reaction = UnitReaction("player", self.unit);
		if reaction and reaction <= 4 then
		else
			return;
		end
	end



	local unitname = GetUnitName(self.unit);
	local casticon = self.casticon;

	if  parent.UnitFrame:IsForbidden() then
		return;
	end

	
	if not healthBar then
		self.healthtext:Hide();
		return;
	end



	local height = orig_height;
	local width = orig_width;


	if UnitIsUnit(self.unit, "target") then
		
		if self.alerthealthbar then
			ANameP_HideOverlayGlow(healthBar);
		end

		self.alerthealthbar = false;
		height = orig_height + ANameP_TargetHealthBarHeight;
		self.healthtext:Show();

		if casticon then
			casticon:SetWidth(16);
			casticon:SetHeight(16);
		end


	elseif UnitIsUnit(self.unit, "player") then
		self.alerthealthbar = false;
		height = orig_height + ANameP_TargetHealthBarHeight + 3
		self.healthtext:Show();
	else

		if unitname and ANameP_AlertList[unitname] then
			if not self.alerthealthbar then
				height = orig_height + 10;
				width = orig_width + 30;
			end
			self.colorlevel = ColorLevel.Name;

			if ANameP_AlertList[unitname][4] == 1 then
				ANameP_ShowOverlayGlow(healthBar);
				self.alerthealthbar = true	
			end
		elseif self.alerthealthbar then
			ANameP_HideOverlayGlow(healthBar);

			self.alerthealthbar = false;
		end

		height = orig_height;
		width = orig_width;
		self.healthtext:Hide();

		
		if casticon then
			local castheight = parent.UnitFrame.castBar:GetHeight();
			casticon:SetWidth(height + castheight);
			casticon:SetHeight(height + castheight);
		end

	end


	if not healthBar:IsForbidden() then
		healthBar:SetHeight(height);
		healthBar:SetWidth(width);
	end

  
	updateUnitHealthText(self, "target");

end





local function updatePVPAggro(self)

	if not ANameP_PVPAggroShow then
		return
	end

	if not self.unit then
		return
	end

	local unit = self.unit;
	local parent = self:GetParent();

	if parent.UnitFrame:IsForbidden() then
		return;
	end
	

	local isTargetPlayer = UnitIsUnit (unit .. "target", "player");

	if ( isTargetPlayer) then
		self.aggro1:SetTextColor(1, 0, 0, 1);

		self.aggro1:SetText("▶");
		self.aggro1:Show();
	
		self.aggro2:SetTextColor(1, 0, 0, 1);
	
		self.aggro2:SetText("◀");
		self.aggro2:Show();
	else
		self.aggro1:Hide();
		self.aggro2:Hide();
	end
end

local function updatePVEAggro(self)

	if not ANameP_PVPAggroShow then
		return
	end

	if not self.unit then
		return
	end

	local unit = self.unit;
	local parent = self:GetParent();

	if parent.UnitFrame:IsForbidden() then
		return;
	end
	
	local parent = self:GetParent();
	local healthBar = parent.UnitFrame.healthBar;

	local isTargetPlayer = UnitIsUnit (unit .. "target", "player");

	if ( isTargetPlayer) and (self.colorlevel <= ColorLevel.Target) then
		self.colorlevel = ColorLevel.Target;
		if not healthBar:IsForbidden() then
			healthBar:SetStatusBarColor(ANameP_AggroTargetColor.r, ANameP_AggroTargetColor.g, ANameP_AggroTargetColor.b);
		end
	elseif (self.colorlevel == ColorLevel.Target) then

		if healthBar.currcolor then
			healthBar:SetStatusBarColor(healthBar.currcolor[1], healthBar.currcolor[2], healthBar.currcolor[3]);
		end

		self.colorlevel = ColorLevel.None;
	end
end




local function initAlertList()

	local spec = GetSpecialization();
	local localizedClass, englishClass = UnitClass("player")

	ANameP_ShowList = nil;

	if spec then
		listname = "ANameP_ShowList_" .. englishClass .. "_" .. spec;
	end

	ANameP_ShowList = _G[listname];

	ANameP_HealerGuid = {};

	lowhealthpercent = 0;

	if ANameP_LowHealthAlert then 
		local localizedClass, englishClass = UnitClass("player")
		local spec = GetSpecialization();
		local talentgroup = GetActiveSpecGroup();

		if (englishClass == "MAGE") then
			if (spec and spec == 2) then
				local _, _, _, selected, _ = GetTalentInfo(1, 3, talentgroup);

				if selected then
					lowhealthpercent = 30;
				end
			end
		end

		if (englishClass == "HUNTER") then
			if (spec and spec == 1) then
				local _, _, _, selected, _ = GetTalentInfo(1, 1, talentgroup);

				if selected then
					lowhealthpercent = 35;
				end
			end
		end


		if (englishClass == "WARRIOR") then
			
			if (spec and spec == 1) then
				lowhealthpercent = 20;

				local _, _, _, selected, _ = GetTalentInfo(3, 1, talentgroup);

				if selected then
					lowhealthpercent = 35;
				end
			end

			if (spec and spec == 2) then
				lowhealthpercent = 20;

				local _, _, _, selected, _ = GetTalentInfo(5, 2, talentgroup);

				if selected then
					lowhealthpercent = 35;
				end
			end
		end

	end
end

local unit_guid_list = {};

local Aggro_Y = -5;

local function isDangerousSpell(spellId, unit)
    if ANameP_DangerousSpellList[spellId] then
    	return true
     end
    return false
end



local function asNamePlates_OnEvent(self, event, ...)
	
	if ( event == "UNIT_THREAT_SITUATION_UPDATE" or event == "UNIT_THREAT_LIST_UPDATE" ) then

		updateAggroColor(self);	
	elseif( event == "PLAYER_TARGET_CHANGED" ) then
		updateTargetNameP(self);

	elseif( event == "UNIT_SPELLCAST_START" or event == "UNIT_SPELLCAST_CHANNEL_START" ) then
		local unit, name , spellid = ...;

		if not (unit == self.unit) then
			return
		end

		local alert = false;
		
		local name,  text, texture, startTime, endTime, isTradeSkill, castID, notInterruptible, spellid = UnitCastingInfo(unit);
	
		local isTargetPlayer = UnitIsUnit (unit .. "target", "player");

		if self.casticon then

			local isDanger = isDangerousSpell (spellid, unit);

			local frameIcon = _G[self.casticon:GetName().."Icon"]; 

			if name and frameIcon and (isDanger or notInterruptible) then
			--if name and frameIcon and isTargetPlayer then
				frameIcon:SetTexture(texture);
				self.casticon:Show();

				if  isDanger then
					alert = true;						
				end
			else
				self.casticon:Hide();
			end

			if alert then
				ANameP_ShowOverlayGlow(self.casticon);
			else
				ANameP_HideOverlayGlow(self.casticon);
			end

		end


	end
end


local function createNamePlate(namePlateFrameBase)

--	if	namePlateFrameBase.UnitFrame:IsForbidden() then
--		return;
--	end

--	if namePlateFrameBase.UnitFrame.BuffFrame then
--		namePlateFrameBase.UnitFrame.BuffFrame:Hide();
--	end

	namePlateFrameBase:SetScript("OnSizeChanged", nil);

	if not namePlateFrameBase.asNamePlates  then
	namePlateFrameBase.asNamePlates = CreateFrame("Frame", "$parentasNamePlates", namePlateFrameBase, "NamePlateUnitFrameTemplate");
	end
	
	namePlateFrameBase.asNamePlates:EnableMouse(false);
	if not namePlateFrameBase.asNamePlates.buffList then
	namePlateFrameBase.asNamePlates.buffList = {}
	end
	namePlateFrameBase.asNamePlates.unit = nil;
	namePlateFrameBase.asNamePlates.reflesh_time = nil;
	namePlateFrameBase.asNamePlates.update = 0;
	namePlateFrameBase.asNamePlates.alerthealthbar = false;

	
	namePlateFrameBase.asNamePlates.filter = nil;
	namePlateFrameBase.asNamePlates.helpful = false;
	namePlateFrameBase.asNamePlates.checkaura = false;
	namePlateFrameBase.asNamePlates.showbuff = false;
	namePlateFrameBase.asNamePlates.downbuff = false;
	namePlateFrameBase.asNamePlates.checkpvptarget = false;
	namePlateFrameBase.asNamePlates.colorlevel = ColorLevel.None;


	local Size = ANameP_AggroSize;
	local namePlateVerticalScale = tonumber(GetCVar("NamePlateVerticalScale"));
	
	if namePlateVerticalScale > 1.0 then
		Aggro_Y = -1
		Size = ANameP_AggroSize + 2
		debuffs_per_line = ANameP_DebuffsPerLine + 1;
	else
		debuffs_per_line = ANameP_DebuffsPerLine;
	end




	ANameP_MaxDebuff = debuffs_per_line * 2;
	 
	Aggro_Y = 0;


	if not namePlateFrameBase.asNamePlates.aggro1  then

	namePlateFrameBase.asNamePlates.aggro1 = namePlateFrameBase.UnitFrame.healthBar:CreateFontString(namePlateFrameBase.asNamePlates:GetName().."aggrotext1", "OVERLAY");
	end

	namePlateFrameBase.asNamePlates.aggro1:SetFont(STANDARD_TEXT_FONT, Size, "THICKOUTLINE");
    namePlateFrameBase.asNamePlates.aggro1:ClearAllPoints();
	namePlateFrameBase.asNamePlates.aggro1:SetPoint("RIGHT", namePlateFrameBase.UnitFrame.healthBar, "LEFT", -5  , Aggro_Y)


	if not namePlateFrameBase.asNamePlates.aggro2  then

	namePlateFrameBase.asNamePlates.aggro2 = namePlateFrameBase.UnitFrame.healthBar:CreateFontString(namePlateFrameBase.asNamePlates:GetName().."aggrotext2", "OVERLAY");
	end
	namePlateFrameBase.asNamePlates.aggro2:SetFont(STANDARD_TEXT_FONT, Size, "THICKOUTLINE");
    namePlateFrameBase.asNamePlates.aggro2:ClearAllPoints();
	namePlateFrameBase.asNamePlates.aggro2:SetPoint("LEFT", namePlateFrameBase.UnitFrame.healthBar, "RIGHT", 0, Aggro_Y)

	if not namePlateFrameBase.asNamePlates.healer  then
	namePlateFrameBase.asNamePlates.healer = namePlateFrameBase.UnitFrame.healthBar:CreateFontString(namePlateFrameBase.asNamePlates:GetName().."Healer", "OVERLAY");
	end
	if ANameP_HealerSize > 0 then
		namePlateFrameBase.asNamePlates.healer:SetFont(STANDARD_TEXT_FONT, ANameP_HealerSize, "THICKOUTLINE");
	else
		namePlateFrameBase.asNamePlates.healer:SetFont(STANDARD_TEXT_FONT, 1, "THICKOUTLINE");
	end
    namePlateFrameBase.asNamePlates.healer:ClearAllPoints();
	namePlateFrameBase.asNamePlates.healer:SetPoint("RIGHT", namePlateFrameBase.UnitFrame.healthBar, "LEFT", -5  , Aggro_Y)
	namePlateFrameBase.asNamePlates.healer:SetText("★");
	namePlateFrameBase.asNamePlates.healer:SetTextColor(0, 1, 0, 1);
	namePlateFrameBase.asNamePlates.healer:Hide();


	if not namePlateFrameBase.asNamePlates.healthtext then
	namePlateFrameBase.asNamePlates.healthtext = namePlateFrameBase.UnitFrame.healthBar:CreateFontString(namePlateFrameBase.asNamePlates:GetName().."healthtext", "OVERLAY");
	end

	namePlateFrameBase.asNamePlates.healthtext:SetFont(STANDARD_TEXT_FONT, ANameP_HeathTextSize, "OUTLINE");
	namePlateFrameBase.asNamePlates.healthtext:ClearAllPoints();
	namePlateFrameBase.asNamePlates.healthtext:SetPoint("CENTER", namePlateFrameBase.UnitFrame.healthBar, "CENTER", 0  , 0)


	if namePlateFrameBase.UnitFrame.castBar then


		if not namePlateFrameBase.asNamePlates.casticon  then
		namePlateFrameBase.asNamePlates.casticon = CreateFrame("Frame", namePlateFrameBase.asNamePlates:GetName().."casticon", namePlateFrameBase.UnitFrame.castBar, "asNamePlatesBuffFrameTemplate");
		end
		namePlateFrameBase.asNamePlates.casticon:EnableMouse(false);
        namePlateFrameBase.asNamePlates.casticon:ClearAllPoints();
		namePlateFrameBase.asNamePlates.casticon:SetPoint("BOTTOMLEFT", namePlateFrameBase.UnitFrame.castBar, "BOTTOMRIGHT", 2, 1)

		namePlateFrameBase.asNamePlates.casticon:SetWidth(16);
		namePlateFrameBase.asNamePlates.casticon:SetHeight(16);


		local frameIcon = _G[namePlateFrameBase.asNamePlates.casticon:GetName().."Icon"]; 
		local frameBorder = _G[namePlateFrameBase.asNamePlates.casticon:GetName().."Border"];
				
		frameIcon:SetTexCoord(.08, .92, .08, .92)
		frameBorder:SetTexture("Interface\\Addons\\asNamePlates\\border.tga")
		frameBorder:SetTexCoord(0.08,0.08, 0.08,0.92, 0.92,0.08, 0.92,0.92)	



		namePlateFrameBase.asNamePlates.casticon:Hide();
	end


end


local function asUpdateHealthColor(frame)

	if frame:IsForbidden() then
		return
	end


	frame.healthBar:SetStatusBarColor(frame.healthBar.r, frame.healthBar.g, frame.healthBar.b);
	if (frame.optionTable.colorHealthWithExtendedColors) then
		frame.selectionHighlight:SetVertexColor(frame.healthBar.r,  frame.healthBar.g,  frame.healthBar.b);
	else
		frame.selectionHighlight:SetVertexColor(1, 1, 1);
	end
end


local function addNamePlate(namePlateUnitToken)
	local namePlateFrameBase = C_NamePlate.GetNamePlateForUnit(namePlateUnitToken, issecure());
	
	if namePlateFrameBase.UnitFrame:IsForbidden() then
		return;
	end

	if namePlateFrameBase.UnitFrame.BuffFrame then
		namePlateFrameBase.UnitFrame.BuffFrame:Hide();
	end


	local healthbar = namePlateFrameBase.UnitFrame.healthBar;
	local Playername = namePlateFrameBase.UnitFrame.name;
	local RaidTargetFrame = namePlateFrameBase.UnitFrame.RaidTargetFrame;
	local ClassificationFrame = namePlateFrameBase.UnitFrame.ClassificationFrame;

	if healthbar then
		healthbar:Show();
	end

	Playername.color = nil;
	Playername:ClearAllPoints();
	Playername:SetPoint("BOTTOM", healthbar, "TOP", 0  , 3)
	RaidTargetFrame:ClearAllPoints();
	RaidTargetFrame:SetPoint("RIGHT", healthbar, "LEFT", -15  , 0)


	if not orig_height then
		orig_height = healthbar:GetHeight();
		orig_width = healthbar:GetWidth();
	end

	namePlateFrameBase.UnitFrame:UnregisterEvent("UNIT_THREAT_SITUATION_UPDATE");
	namePlateFrameBase.UnitFrame:UnregisterEvent("UNIT_THREAT_LIST_UPDATE");
	namePlateFrameBase.UnitFrame:UnregisterEvent("PLAYER_TARGET_CHANGED");
	namePlateFrameBase.UnitFrame:UnregisterEvent("GROUP_JOINED");
	namePlateFrameBase.UnitFrame:UnregisterEvent("GROUP_LEFT");


	asUpdateHealthColor(namePlateFrameBase.UnitFrame);
	asUpdateName( namePlateFrameBase.UnitFrame);
	
	if namePlateFrameBase.asNamePlates then 
	
		namePlateFrameBase.asNamePlates.unit = namePlateUnitToken;
		namePlateFrameBase.asNamePlates.filter = nil;
		namePlateFrameBase.asNamePlates.helpful = false;
		namePlateFrameBase.asNamePlates.checkaura = false;
		namePlateFrameBase.asNamePlates.showbuff = false;
		namePlateFrameBase.asNamePlates.downbuff = false;
		namePlateFrameBase.asNamePlates.healthtext:Hide();
		namePlateFrameBase.asNamePlates.checkpvptarget = false;
		namePlateFrameBase.asNamePlates.colorlevel = ColorLevel.None;

		for i = 1, ANameP_MaxDebuff do
			if ( namePlateFrameBase.asNamePlates.buffList[i] ) then
				namePlateFrameBase.asNamePlates.buffList[i]:Hide();	
			end
		end

        if UnitIsPlayer(namePlateUnitToken) then
			namePlateFrameBase.asNamePlates.colorlevel = ColorLevel.Name;
        else
            updateTargetNameP( namePlateFrameBase.asNamePlates );
            updateAggroColor( namePlateFrameBase.asNamePlates, true);	
        end

		
		local bInstance, RTB_ZoneType = IsInInstance();

		if not (RTB_ZoneType == "pvp" or RTB_ZoneType == "arena") then
			--PVP 에서는 어그로 Check 안함
			namePlateFrameBase.asNamePlates:RegisterUnitEvent("UNIT_THREAT_SITUATION_UPDATE", "player", namePlateUnitToken );
			namePlateFrameBase.asNamePlates:RegisterUnitEvent("UNIT_THREAT_LIST_UPDATE", "player", namePlateUnitToken );
		end


		namePlateFrameBase.asNamePlates:RegisterEvent("PLAYER_TARGET_CHANGED");
		namePlateFrameBase.asNamePlates:RegisterUnitEvent("UNIT_SPELLCAST_START", namePlateUnitToken);
		namePlateFrameBase.asNamePlates:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_START", namePlateUnitToken);
		namePlateFrameBase.asNamePlates:SetScript("OnEvent", asNamePlates_OnEvent);
		
			
		if ANameP_SIZE > 0 then
			namePlateFrameBase.asNamePlates.icon_size = ANameP_SIZE;
		else
			namePlateFrameBase.asNamePlates.icon_size = (namePlateFrameBase.UnitFrame.healthBar:GetWidth() / debuffs_per_line) - (debuffs_per_line - 1);
		end
		
		local base_y = ANameP_TargetBuffY;

		if namePlateFrameBase.UnitFrame.name:IsShown() then
			base_y = base_y + namePlateFrameBase.UnitFrame.name:GetHeight();
		end
		local 	Buff_Y = base_y;

		if UnitIsUnit("target", namePlateUnitToken) and GetCVar("nameplateResourceOnTarget") == "1" then

			local class = NamePlateDriverFrame:GetClassNameplateBar()

			if class  then
				Buff_Y = base_y +  class:GetHeight() ;
			end
		end

		if UnitIsUnit("player", namePlateUnitToken) then
			Buff_Y = ANameP_PlayerBuffY;

			if Buff_Y < 0 then
				namePlateFrameBase.asNamePlates.downbuff = true;
			end
		end

		local class = UnitClassification(namePlateUnitToken)

		namePlateFrameBase.asNamePlates.aggro1:ClearAllPoints();

		if class == "worldboss" or class == "elite" then
			namePlateFrameBase.asNamePlates.aggro1:SetPoint("RIGHT", namePlateFrameBase.UnitFrame.healthBar, "LEFT", -5  , Aggro_Y)
		else
			namePlateFrameBase.asNamePlates.aggro1:SetPoint("RIGHT", namePlateFrameBase.UnitFrame.healthBar, "LEFT", 0  , Aggro_Y)
		end


		namePlateFrameBase.asNamePlates.aggro1:Hide();
		namePlateFrameBase.asNamePlates.aggro2:Hide();
		
		namePlateFrameBase.asNamePlates:ClearAllPoints();
		if namePlateFrameBase.asNamePlates.downbuff and UnitIsUnit("player", namePlateUnitToken) then



		
			local class = NamePlateDriverFrame:GetClassNameplateBar()


			if class and GetCVar("nameplateResourceOnTarget") == "0" then
				namePlateFrameBase.asNamePlates:SetPoint("TOPLEFT", ClassNameplateManaBarFrame, "BOTTOMLEFT", 0, Buff_Y - class:GetHeight() );
			else
				namePlateFrameBase.asNamePlates:SetPoint("TOPLEFT", ClassNameplateManaBarFrame, "BOTTOMLEFT", 0, Buff_Y);
			end
		else
			namePlateFrameBase.asNamePlates:SetPoint("BOTTOMLEFT", namePlateFrameBase.UnitFrame.healthBar, "TOPLEFT", 0, Buff_Y);
		end

		namePlateFrameBase.asNamePlates:SetWidth(1)
		namePlateFrameBase.asNamePlates:SetHeight(1)
		namePlateFrameBase.asNamePlates:SetScale(1)
		namePlateFrameBase.asNamePlates:Show()

		local showbuff = false;
		local helpful = false;
		local showhealer = false;
		local checkaura = false;
		local showdebuff = false;
		local checkpvptarget = false;

		if UnitIsUnit("player", namePlateUnitToken) then
	
			if ANameP_ShowPlayerBuff then

				if ANameP_ShowPlayerBuffDefault then
					filter = "HELPFUL|INCLUDE_NAME_PLATE_ONLY";
				else
					filter = "HELPFUL|PLAYER|INCLUDE_NAME_PLATE_ONLY";
				end
				helpful = true;
				checkaura = true;
			else
				checkaura = false;
			end
			
			-- Resource Text
			if ClassNameplateManaBarFrame and ANameP_Resourcetext == nil then
				ANameP_Resourcetext = ClassNameplateManaBarFrame:CreateFontString("ANameP_Resourcetext", "OVERLAY");
				ANameP_Resourcetext:SetFont(STANDARD_TEXT_FONT, ANameP_HeathTextSize, "OUTLINE");
				ANameP_Resourcetext:SetAllPoints(true);
				ANameP_Resourcetext:SetPoint("CENTER", ClassNameplateManaBarFrame, "CENTER", 0  , 0);
			end

			ANameP:RegisterUnitEvent("UNIT_AURA", "player");

		else
			local reaction = UnitReaction("player", namePlateUnitToken);
			if reaction and reaction <= 4 then
				-- Reaction 4 is neutral and less than 4 becomes increasingly more hostile
				filter = "HARMFUL|INCLUDE_NAME_PLATE_ONLY";
				showbuff = true;

				if UnitIsPlayer(namePlateUnitToken) and ANameP_HealerGuid[UnitGUID(namePlateUnitToken)] then
					showhealer = true;
				end

				if UnitIsPlayer(namePlateUnitToken) then
					checkpvptarget = true;
				end


				checkaura = true;

			elseif not namePlateFrameBase:IsForbidden() then
				filter = "HELPFUL|INCLUDE_NAME_PLATE_ONLY|PLAYER";
				helpful = true;
				showbuff = true;

				checkaura = false
			
				if not showdebuff  and not UnitIsUnit(namePlateUnitToken, "player") and  ANameP_HealerGuid[UnitGUID(namePlateUnitToken)] then
					showhealer = true;
				end
			end
		end

		namePlateFrameBase.asNamePlates.filter = filter;
		namePlateFrameBase.asNamePlates.helpful = helpful;
		namePlateFrameBase.asNamePlates.checkaura = checkaura;
		namePlateFrameBase.asNamePlates.showbuff = showbuff;
		namePlateFrameBase.asNamePlates.showdebuff = showdebuff;
		namePlateFrameBase.asNamePlates.checkpvptarget = checkpvptarget;


		if showhealer and ANameP_HealerSize > 0  then
			namePlateFrameBase.asNamePlates.healer:Show();
		else
			namePlateFrameBase.asNamePlates.healer:Hide();
		end

		updateUnitAuras(namePlateUnitToken);
	end


	if UnitIsPlayer(namePlateUnitToken) then
		unit_guid_list[UnitGUID(namePlateUnitToken)] = namePlateUnitToken;
	end	

end

local function removeNamePlate(namePlateUnitToken)
	local namePlateFrameBase = C_NamePlate.GetNamePlateForUnit(namePlateUnitToken, issecure());
	if namePlateFrameBase and namePlateFrameBase.asNamePlates then


		for i = 1, ANameP_MaxDebuff do
			if ( namePlateFrameBase.asNamePlates.buffList[i] ) then
				namePlateFrameBase.asNamePlates.buffList[i]:Hide();	
			end
		end


		namePlateFrameBase.asNamePlates.aggro1:Hide();
		namePlateFrameBase.asNamePlates.aggro2:Hide();
		namePlateFrameBase.asNamePlates:Hide();
		namePlateFrameBase.asNamePlates:UnregisterEvent("UNIT_THREAT_SITUATION_UPDATE");
		namePlateFrameBase.asNamePlates:UnregisterEvent("PLAYER_TARGET_CHANGED");
		namePlateFrameBase.asNamePlates:UnregisterEvent("UNIT_SPELLCAST_START");
		namePlateFrameBase.asNamePlates:UnregisterEvent("UNIT_SPELLCAST_CHANNEL_START");
		namePlateFrameBase.asNamePlates:SetScript("OnEvent", nil);
		namePlateFrameBase.asNamePlates.r = nil;
		namePlateFrameBase.asNamePlates.colorlevel = ColorLevel.None;

		if namePlateFrameBase.asNamePlates.alerthealthbar then
			namePlateFrameBase.asNamePlates.alerthealthbar = false;
			ANameP_HideOverlayGlow(namePlateFrameBase.UnitFrame.healthBar);
		end
	end

	if UnitIsPlayer(namePlateUnitToken) and  UnitGUID(namePlateUnitToken) then
		unit_guid_list[UnitGUID(namePlateUnitToken)] = nil;
	end	

end



local function updateHealerMark(guid)
	local unit = unit_guid_list[guid];
	
	if unit and ANameP_HealerGuid[guid] and not UnitIsUnit(unit, "player") then
		local nameplate = C_NamePlate.GetNamePlateForUnit(unit, issecure());
		if (nameplate and nameplate.asNamePlates and not nameplate:IsForbidden() and not nameplate.asNamePlates.showdebuff and nameplate.asNamePlates.checkpvptarget ) then
			nameplate.asNamePlates.healer:Show();
		end
	end
end





local function asCompactUnitFrame_UpdateNameFaction(namePlateUnitToken)

	local namePlateFrameBase = C_NamePlate.GetNamePlateForUnit(namePlateUnitToken, issecure());
	if namePlateFrameBase and namePlateFrameBase.asNamePlates and not namePlateFrameBase:IsForbidden() then
		addNamePlate(namePlateUnitToken);
	end
end


local function ANameP_OnEvent(self, event, ...)
	
	if event == "NAME_PLATE_CREATED" then
		local namePlateFrameBase = ...;
		createNamePlate(namePlateFrameBase);
	elseif event == "NAME_PLATE_UNIT_ADDED" then
		local namePlateUnitToken = ...;
		addNamePlate(namePlateUnitToken);
	elseif event == "NAME_PLATE_UNIT_REMOVED" then
		local namePlateUnitToken = ...;
		removeNamePlate(namePlateUnitToken);
	elseif event == event == "UNIT_SPELLCAST_SUCCEEDED" and arg1 == "player"  then
		updateUnitAuras("target");
		updateUnitAuras("player");
	elseif event == "PLAYER_TARGET_CHANGED" then
		updateUnitAuras("target");
	elseif (event == "PLAYER_ENTERING_WORLD") then
		initAlertList();

		isInstance, instanceType = IsInInstance()

		if isInstance and (instance=="party" or instance=="raid" or instance=="scenario") then
			self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
		else
			self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
		end

		updateTankerList();

	elseif (event == "ACTIVE_TALENT_GROUP_CHANGED") then
		initAlertList();
	elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
	
		local _, eventType, _, sourceGUID, _, _, _, destGUID, _, _, _, spellID, _, _, auraType = CombatLogGetCurrentEventInfo();

		if eventType == "SPELL_CAST_SUCCESS" and sourceGUID and not (sourceGUID == "") then

			local className = GetPlayerInfoByGUID(sourceGUID);

			if className  and ANameP_HealSpellList[className] and  ANameP_HealSpellList[className][spellID]  then
				ANameP_HealerGuid[sourceGUID] = true;
				updateHealerMark(sourceGUID);
			end
		end
	elseif ( event == "UNIT_FACTION" ) then
	local namePlateUnitToken = ...;
	asCompactUnitFrame_UpdateNameFaction(namePlateUnitToken);
	elseif (event == "GROUP_JOINED" or event == "GROUP_ROSTER_UPDATE" or event == "PLAYER_ROLES_ASSIGNED") then
		updateTankerList();
	end

end

local update = 0;
local update2 = 0;

local function ANameP_OnUpdate (self, elapsed)

	update = update + elapsed
	update2 = update2 + elapsed


	if update >= 0.25  then
		updateUnitHealthText(self, "target")
		updateUnitHealthText(self, "player")
		updateUnitResourceText(self, "player");
		update = 0;
	end

	-- 버프 Debuff를 주기적으로 Update 한다.
	if update2 >= ANameP_UpdateRate  then

		for _,v in pairs(C_NamePlate.GetNamePlates(issecure())) do
			local nameplate = v;


			if (nameplate and  nameplate.asNamePlates and not nameplate:IsForbidden()) then

				if nameplate.asNamePlates.checkaura then
					updateAuras(nameplate.asNamePlates, nameplate.namePlateUnitToken, nameplate.asNamePlates.filter, nameplate.asNamePlates.showbuff, nameplate.asNamePlates.helpful, nameplate.asNamePlates.showdebuff);
				else
					nameplate.asNamePlates:Hide();
				end

				if nameplate.asNamePlates.checkpvptarget then
					updatePVPAggro(nameplate.asNamePlates);
				else
					updatePVEAggro(nameplate.asNamePlates);
				end
			end
		end
		update2 = 0;
	end

end

local function initAddon()

	ANameP = CreateFrame("Frame", nil, UIParent, "NamePlateUnitFrameTemplate");

	ANameP:RegisterEvent("NAME_PLATE_CREATED");
	ANameP:RegisterEvent("NAME_PLATE_UNIT_ADDED");
	ANameP:RegisterEvent("NAME_PLATE_UNIT_REMOVED");
	
	ANameP:RegisterEvent("PLAYER_TARGET_CHANGED");
	ANameP:RegisterEvent("PLAYER_ENTERING_WORLD");
	ANameP:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED");
	ANameP:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
	ANameP:RegisterEvent("UNIT_FACTION");
	ANameP:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", "player");
	ANameP:RegisterEvent("GROUP_JOINED");
	ANameP:RegisterEvent("GROUP_ROSTER_UPDATE");
	ANameP:RegisterEvent("PLAYER_ROLES_ASSIGNED");
	
	ANameP:SetScript("OnEvent", ANameP_OnEvent)
	ANameP:SetScript("OnUpdate", ANameP_OnUpdate)

	if not NamePlateDriverMixin then
		 LoadAddOn("Blizzard_NamePlates")
	end

	NamePlateDriverFrame:UnregisterEvent("UNIT_AURA");
	NamePlateDriverMixin.OnUnitAuraUpdate = function(...)	end

end



initAddon();
