-- ProbablyEngine Rotation Packager
-- Custom Enhancement Shaman Rotation
-- Created on Nov 20th 2013 6:12 pm
-- Rotation based Off http://www.icy-veins.com/enhancement-shaman-wow-pve-dps-rotation-cooldowns-abilities
-- Mavmins Enhancement Lib used for Tier Checks
if not NElib then NElib = {} end

-- ** CHANGE TO TRUE IF YOU HAVE TIER 14 4PCS **
-- Think its supposed to be T9 4pc 
function NElib.t14_4pc()
		return false
	end


if TIER16_CHECK ~= true then

	NET_16 = 0
	
	local NEEnhanceT16 = {
	  99341, -- Head Heroic
	  99343, -- Shoulders Heroic
	  99347, -- Chest Heroic
	  99340, -- Gloves Heroic
	  99342, -- Legs Heroic
	 }
  
	for i=1, 19 do
		if GetInventoryItemID("player", i) ~= nil then
			for j=1, 5 do
				if GetItemInfo(GetInventoryItemID("player", i)) == GetItemInfo(EnhanceT16[j]) then
					NET_16 = NET_16 + 1
				end
			end
		end
	end	
	
	TIER16_CHECK = true	
end

if TIER15_CHECK ~= true then

	NET_15 = 0
	
	local EnhanceT15 = {
	  96691, -- Head Heroic
	  96693, -- Shoulders Heroic
	  96689, -- Chest Heroic
	  96690, -- Gloves Heroic
	  96692, -- Legs Heroic
	 }
	
	for i=1, 19 do
		if GetInventoryItemID("player", i) ~= nil then
			for j=1, 5 do
				if GetItemInfo(GetInventoryItemID("player", i)) == GetItemInfo(EnhanceT15[j]) then
					NET_15 = NET_15 + 1
				end
			end
		end
	end	
	
	TIER15_CHECK = true	
end

function NElib.t16_2pc()
	if NET_16 >= 2 then
		return true
	end
end

function NElib.t16_4pc()
	if NET_16 == 4 then
		return true
	end
end

function NElib.t15_2pc()
	if NET_15 >= 2 then
		return true
	end
end

function NElib.t15_4pc()
	if NET_15 == 4 then
		return true
	end
end
if not (totemX and totemY) then
	totemX,totemY = 0,0
end

function totemDistance()
		local totemName = select(2,GetTotemInfo(1)) or select(2,GetTotemInfo(2))
		local fire = GetSpellInfo(2894)
		local earth = GetSpellInfo(2062)

		if totemX ~= (0 or nil) and totemY ~= (0 or nil) and totemName ~= (fire or earth) then
			local a,b,c,d,e,f,g,h,i,j = GetAreaMapInfo(GetCurrentMapAreaID())
			local a1 , b1 = GetPlayerMapPosition("Player")
			local x1 , y1 = a1 * 1000, b1 * 1000
			local a2 , b2 = totemX, totemY
			local x2 , y2 = a2 * 1000, b2 * 1000
			local w = (d - e)
			local h = (f - g)
			local distance = sqrt(min(x1 - x2, w - (x1 - x2))^2 + min(y1 - y2, h - (y1-y2))^2)
			
			return distance
		else
			return 0
		end
end

function NElib.SearingTotem()
	local TOT1, FIRTOTNAME, FIRstartTime, FIRduration = GetTotemInfo(1)
	distance = totemDistance()
	
	if TARGET_MODE == "SIX" then return false end
	
	if FIRTOTNAME ~= tostring(GetSpellInfo(2894)) then
		if TOT1 == false or distance > 25 or FIRTOTNAME ~= tostring(GetSpellInfo(3599)) then
			totemX,totemY = GetPlayerMapPosition("Player")
			return true
		end
	end
end

ProbablyEngine.library.register("NElib", NElib)

ProbablyEngine.rotation.register_custom(263, "NEM PvP-Solo", 
{
-- *** NEM Standards ***		
-- PVP Trink Insignia of the Alliance
	-- Insignia of the Alliance
	{"#29593", "player.state.fear"},					
	{"#29593", "player.state.incapacitate"},
	{"#29593", "player.state.disorient"},

-- Racials start
-- PVP Gnome
	-- Escape Artist
	{"20589", "player.state.snare"},						 
	{"20589", "player.state.root"},						

-- PVP Human Racial
	-- Every Man for Himself
	{"59752", "player.state.fear"},						
	{"59752", "player.state.incapacitate"},
	{"59752", "player.state.disorient"},

-- PVP Dwarf Racial
	-- Stoneform cures Poison, Disease and Bleed
	{"20594","player.dispellable(20594)"}, -- untested
	{"20594", "player.health <= 65" },
	
-- PVP Undead Racial
	-- Will of the Forsaken
	{"7744", "player.state.charm"},						
	{"7744", "player.state.fear"},						
	{"7744", "player.state.sleep"},						

-- OTHER Racials
	-- Blood Elf Arcane Torrent by name each class has own spellID
	{"Arcane Torrent","target.range <= 8"}, --untested
	{"28730","target.range <= 8"}, --Default untested
	{"50613","target.range <= 8"}, --DK untested
	{"80483","target.range <= 8"}, --Hunter untested
	{"129597","target.range <= 8"}, --Monk untested
	{"25046","target.range <= 8"}, --Rogue untested
	{"69179","target.range <= 8"}, --Warrior untested
	
	-- Troll Berserking on CD
	{"26297",
		{	"!modifier.last",
			"target.ttd > 14",
			"!player.buff(26297)"
		}
	}, 
	-- Orc Blood Fury onCD by name multiple spellIDs
	{"20572",
		{	"!modifier.last",
			"target.ttd > 14",
			"!player.buff(20572)"
		}
	},
	{"33697",
		{	"!modifier.last",
			"target.ttd > 14",
			"!player.buff(33697)"
		}
	},
	{"33702",
		{	"!modifier.last",
			"target.ttd > 14",
			"!player.buff(33702)"
		}
	},
	{"Blood Fury",
		{	"!modifier.last",
			"target.ttd > 14",
			"!player.buff(Blood Fury)"
		}
	},
	-- Blood Fury END
	-- Draenei Gift of the Naaru **included for copy/paste**
	{"59545", --DK
		{	"!modifier.last"
			,"player.health <= 80"
		}
	},
	{"59543", --Hunter
		{	"!modifier.last"
			,"player.health <= 80"
		}
	},
	{"59548", --Mage
		{	"!modifier.last"
			,"player.health <= 80"
		}
	},
	{"Gift of the Naaru",
		{	"!modifier.last"
			,"player.health <= 80"
		}
	},
	-- Pandaren Quaking Palm SAP **included for copy/paste**
	{"107079","modifier.interrupts"},
	-- Goblin Rocket Barrage **included for copy/paste**
	-- {"69041"},
	-- Goblin Rocket Jump **included for copy/paste**
	-- {"69070"},
	-- Night Elf Shadowmeld threat > 95% and not solo
	{"58984",
		{	"player.threat >= 95",
			"!modifier.members == 0",
		}
	},
	-- Tauren War Stomp **included for copy/paste**
	{"20549",
		{	"target.range <= 8",
			"!modifier.last"
		}
	}, --untested
		-- Lifeblood on CD for haste	
	{"/run CastSpellByName('Lifeblood')","player.spell(lifeblood).cooldown = 0"},

-- Racials end	

-- Buffs
	--Windfury 8238 lvl 30
	{ "8238", 
		{	"player.level >= 30",
			"!player.enchant.mainhand" 
		}
	}, 
	--Flametounge on Main hand till 30
	{ "8024", 
		{	"player.level <= 29",
			"!player.enchant.mainhand" 
		}
	}, 
	--Flametounge
	{ "8024", "!player.enchant.offhand" }, 
	--Lightning Shield
	{ "324", "!player.buff(324)" }, 
	
	--Utility Interrupt
	--Wind Shear
	 { "!57994", 
		{	"target.casting.time <= 2",
			"target.interruptAt(50)"
		}, "target" 
	},		
	 { "57994", 
		{	"target.casting.time > 2",
			"target.interruptAt(15)"
		}, "target" 
	},
	
	--Healing / Survival 
	
	--Healthstone
	{"#5512", "player.health < 45"},
				
	--Astral shift
	{ "108271", 
		{	"!player.buff(108271)",
			"!player.buff(30823)",
			"player.health < 51"
		}
	},
	
	--Shamanistic Rage----
	{ "30823", 
		{	"!player.buff(108271)",
			"!player.buff(30823)",
			"player.health < 56"
		}
	},
		
	--Healing Stream Totem
	{ "5394", 
		{	"!player.totem(5394)",
			"!player.totem(108280)",
			"player.health < 74"
		}
	},
	
	--Healing Tide Totem----
	{ "108280", 
		{	"!player.totem(108280)",
			"player.health < 40"
		}
	},
		
	--Healing Surge----
--	{ "8004", "player.health < 60","player"},
		
	--Stone Bulwark Totem
	{ "108270", 
		{	"!player.totem(108270)",
			"player.health < 90"
		}
	},
	
	--Cleanse Spirit
	--Cleanse Spirit Mouseover
	--Purge
	--Pop Their Bubble
    --Purge 370 lvl 12 if target has PW:S
	{ "370","target.buff(17)","target" },
	
--Dispel Any Magic Buff if Button ON
    --Purge 370 lvl 12
	{ "370", 
		{	"target.dispellable(370)",
			"toggle.dispelmagic"
		},"target" 
	}, 
	    -- Totems
		-- Searomg Totem
		{ "Searing Totem", 
			{	"!player.moving",	
				"!player.totem(Fire Elemental Totem)",
				"!player.totem(Searing Totem)"
			}
		},
		-- Healing Stream Totem
		{ "Healing Stream Totem", 
			{	"modifier.cooldowns",
				"!player.moving",
				"lowest.health < 95",
				"!totem(Healing Stream Totem)" 
			}
		},
		-- Grounding Totem
		{ "Grounding Totem", 
			{	"modifier.cooldowns",
				"!player.moving",
				"!totem(Grounding Totem)" 
			}
		},
	
		{ "!/targetenemy","!target.alive"}, 
		{ "!/targetenemy","!target.enemy"}, 
		{ "!/targetenemy","!target.exists"}, 
--DPS WILL NOT FIRE IF TARGET CAN'T BE HURT		
    {	--[immune check] 
		{	--[immune Rotation] 

	--**Rotation Begin**
		-- Unleash Elements[73680 lvl 81 Ins 40y 15s] w/ Unleashed Fury [117012 lvl 90 Talent]
		{"!73680","player.spell(117012).exists"},
		-- Elemental Blast [117014 lvl 90 Talent 2sec 40yd 12s]
		{"117014"},
		{ "!117014", 
			{	"@NElib.t15_2pc",
				"player.buff(53817).count >= 4",
			}
		},		
		{ "!117014","player.buff(53817).count = 5"},
		-- Feral Spirit [51533 lvl 60 Ins 30y 2min]
		{"51533"},
		-- Fire Nova [1535 lvl 44 ins 100y 4sec] 2+ enemies & flameshock on target
		{"1535",
			{	"modifier.enemies >= 2",
				"target.debuff(8050)"
			}
		},
		-- Chain Lighning[421 lvl 28] when enemies >=3 + LB rules
		{ "421", 
			{	"modifier.enemies >= 3",
				"@NElib.t15_2pc",
				"player.buff(53817).count >= 4",
				"modifier.multitarget"
			}
		},
		{ "421", 
			{	"modifier.enemies >= 3",
				"player.buff(53817).count = 5",
				"modifier.multitarget"
			}
		},
		
		-- lightning_bolt, if= (set_bonus tier15_2pc & buff maelstrom >=4) or Maelstrom = 5		
		{ "403", 
			{	"@NElib.t15_2pc",
				"player.buff(53817).count >= 4",
			}
		},		
		{ "403","player.buff(53817).count = 5"},
		-- Stormstrike [17364 lvl 26 Ins 5y 8s]
		{"17364"},
		{"!17364",
			{	"target.spell(17364).range",
				"player.casting(403)",
				"player.casting.delta > 1"
			}
		},
		--Flame Shock[8050 lvl 12] if Unleash Flame [73683] or (!debuff & Unleash Elements[73680 lvl 81] cooldown > 5) or (!debuff & lvl <=80)
		{"8050","player.buff(73683)"},
		{"8050",
			{	"!target.debuff(8050)",
				"player.spell(73680).cooldown > 5"
			}
		},
		{"8050",
			{	"!target.debuff(8050)",
				"player.level <= 80"
			}
		},
		{"!8050",
			{	"!target.debuff(8050)",
				"player.level <= 80",
				"player.casting(403)",
				"player.casting.delta > 1"
			}
		},
		--Lava Lash[60103 lvl 10 Ins 5y 10s]
		{"60103"},
		{"!60103",
			{	"target.spell(60103).range",
				"player.casting(403)",
				"player.casting.delta > 1"
			}
		},
		--Unleash Elements[73680 lvl 81 Ins 40y 15s]
		{"73680"},
		{"!73680",
			{	"target.spell(73680).range",
				"player.casting(403)",
				"player.casting.delta > 1"
			}
		},
		--Earth Shock[8042 lvl 6]
		{"8042"},
		--Primal Strike 73899
		{"73899"},
		{"!73899",
			{	"target.spell(73899).range",
				"player.casting(403)",
				"player.casting.delta > 1"
			}
		},
		-- Chain Lighning[421 lvl 28] when enemies >=3 + LB rules
		{ "421", 
			{	"modifier.enemies >= 3",
				"player.buff(53817).count >= 1",
				"modifier.multitarget"
			}
		},
		--Lightning Bolt with Maelstrom Weapon OR moving OR < 50 so no buff
		{"403","player.buff(53817).count >= 1"},
		{"403","player.moving"},
		{"403","player.level < 50"},
		},	--[/immune Rotation]
		{								--Don't waste mana 
			"!target.immune.all",		--Can't touch this!
			"!target.buff(122464.any)", -- Dematerialize 
			"!target.buff(122470).any", -- touch of karma
		}
	}, 	--[/Immune Check]    
		
},
 {
  -- Buffs
	--Windfury 8238 lvl 30
	{ "8238", 
		{	"player.level >= 30",
			"!player.enchant.mainhand" 
		}
	}, 
	--Flametounge on Main hand till 30
	{ "8024", 
		{	"player.level <= 29",
			"!player.enchant.mainhand" 
		}
	}, 
	--Flametounge
	{ "8024", "!player.enchant.offhand" }, 
	--Lightning Shield
	{ "324", "!player.buff(324)" }, 

		--Moving buff  
	{ "Ghost Wolf",
		{
		"toggle.gwooc",
		"player.moving",
		"!player.buff(Ghost Wolf)"
		}
	},

		--AutoAttack
	--Flame Strike
		{ "!8050",
			{	"target.spell(8050).range",
				"target.exists",
				"target.enemy",
				"toggle.AT",
				"target.debuff(8050).duration < 3",				"player.casting(403)",
				"player.casting.delta > 1"
			},"target"
		}, 
		{ "8050",
			{	"target.spell(8050).range",
				"target.exists",
				"target.enemy",
				"toggle.AT",
				"!11target.debuff(8050)"
			},"target"
		}, 
	-- LB		
		{"403", 
			{	"target.spell(403).range",
				"target.enemy",
				"toggle.AT",
				"target.exists"
			},"target"
		}, 
		{ "!/targetenemy","!target.alive"}, 
		{ "!/targetenemy","!target.enemy"}, 
		{ "!/targetenemy","!target.exists"}, 

		
}, function()
	ProbablyEngine.toggle.create('dispelmagic', 'Interface\\Icons\\spell_nature_nullifydisease', 'Auto Dispel Magic', 'Automatically dispel any magic buffs')
	ProbablyEngine.toggle.create('AT', 'Interface\\Icons\\inv_sword_04', 'Auto target', 'Automatically attack on enemy target')
	ProbablyEngine.toggle.create('gwooc', 'Interface\\Icons\\spell_nature_spiritwolf', 'Auto Ghost Wolf', 'Automatically GW when moving OOC')

	end
)
