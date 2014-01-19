-- ProbablyEngine Rotation Packager
-- Custom Enhancement Shaman Rotation
-- Created on Nov 20th 2013 6:12 pm
-- Mavmins Enhancement with Purge added
if not mavlib then mavlib = {} end

-- ** CHANGE TO TRUE IF YOU HAVE TIER 14 4PCS **
-- Think its supposed to be T9 4pc 
function mavlib.t14_4pc()
		return false
	end


if TIER16_CHECK ~= true then

	T_16 = 0
	
	local EnhanceT16 = {
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
					T_16 = T_16 + 1
				end
			end
		end
	end	
	
	TIER16_CHECK = true	
end

if TIER15_CHECK ~= true then

	T_15 = 0
	
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
					T_15 = T_15 + 1
				end
			end
		end
	end	
	
	TIER15_CHECK = true	
end

function mavlib.t16_2pc()
	if T_16 >= 2 then
		return true
	end
end

function mavlib.t16_4pc()
	if T_16 == 4 then
		return true
	end
end

function mavlib.t15_2pc()
	if T_15 >= 2 then
		return true
	end
end

function mavlib.t15_4pc()
	if T_15 == 4 then
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

function mavlib.SearingTotem()
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

ProbablyEngine.library.register("mavlib", mavlib)

ProbablyEngine.rotation.register_custom(263, "Mavmins with Purge [NEM]", 
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
	{ "8004", "player.health < 60","player"},
		
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
		
	-- Cooldowns *** START
	{{
	--stormlash_totem, if=!active & !buff.stormlash.up &(buff.bloodlust.up|time>=60)
	{ "120668", 
		{	"!player.buff(120676)",
			"player.hashero"
		}
	},		
-- Mavims Shit that I'm sure he knows better then me **START**
	--[[ elemental_mastery,if=talent.elemental_mastery.enabled&(talent.primal_elementalist.enabled&glyph.fire_elemental_totem.enabled&(cooldown.fire_elemental_totem.remains=0|cooldown.fire_elemental_totem.remains>=80))
	]]
	{ "16166", 
		{	"player.spell(117013).exists",
			"player.glyph(217)",
			"player.spell(2894).cooldown = 0"
		}
	},
	
	{ "16166", 
		{	"player.spell(117013).exists",
			"player.glyph(217)",
			"player.spell(2894).cooldown > 79"
		}
	},
	
	--[[ 
	elemental_mastery, if = talent.elemental_mastery.enabled & (talent.primal_elementalist.enabled & !glyph.fire_elemental_totem.enabled & (cooldown.fire_elemental_totem.remains=0|cooldown.fire_elemental_totem.remains >= 50))
	]]
	{ "16166", 
		{	"player.spell(117013).exists",
			"!player.glyph(217)",
			"player.spell(2894).cooldown = 0"
		}
	},
	
	{ "16166", 
		{	"player.spell(117013).exists",
			"!player.glyph(217)",
			"player.spell(2894).cooldown > 49"
		}
	},
	
	--elemental_mastery, if= talent.elemental_mastery.enabled & !talent.primal_elementalist.enabled
	{ "16166","!player.spell(117013).exists"},
	
	--gloves
	{"#gloves", 
		{	"!player.buff(96228)",
			"!player.totem(2894)",
			"target.exists"
		}
	},
-- Mavims Shit that I'm sure he knows better then me **END**
		
	--fire_elemental_totem,if=!active
	{ "2894", "!player.totem(2894)"},
	
	--ascendance,if=cooldown.strike.remains>=3
	{ "114049", 
		{	"!player.buff(114051)",
			"player.spell(17364).cooldown > 2"
		}
	},
	
	{ "114049", 
		{	"player.totem(2894)",
			"!player.buff(114051)"
		}
	},
		
	}, "modifier.cooldowns"},
-- COOLDOWNS ** END

	-- AoE Rotation
	{
		{
			--fire_nova,if=active_flame_shock>=4
			{ "1535", 
				{	"modifier.enemies >= 4",
					"target.debuff(8050)"
				}
			},
			
			--magma_totem,if=active_enemies>5&!totem.fire.active
			{ "8190", "modifier.enemies > 5",},
		
			--searing_totem,if=active_enemies<=5&!totem.fire.active
			{ "3599", 
				{	"modifier.enemies < 5",
					"!player.totem(3599)", -- Searing
					"!player.totem(8190)", -- Magma
					"!player.totem(2894)", -- Fire Elem
				}
			},
	
			--flame_shock,cycle_targets=1,if=!ticking
			{ "8050", "!target.debuff(8050)"}, 
	
			--lava_lash,if=dot.flame_shock.ticking
			{ "60103", "target.debuff(8050)" }, 
	
			--elemental_blast,if=talent.elemental_blast.enabled&buff.maelstrom_weapon.react>=1
			{ "117014", 
				{ 	"!player.moving",
					"player.buff(53817).count >= 1"
				}
			}, 
			
			-- elemental blast Moving Spiritwalkers Grace	
			{ "117014", 
				{ 	"player.moving",
					"player.buff(79206)",
					"player.buff(53817).count >= 1"
				}
			}, 
		
			--elemental blast MOVING 5 Maelstrom so instant cast		
			{ "117014", 
				{ 	"player.moving",
					"player.buff(53817).count = 5"
				}
			},
	
			--chain_lightning,if=active_enemies>=2&buff.maelstrom_weapon.react>=3
			{ "421", 
				{	"!player.moving",
					"player.buff(53817).count >= 3"
				}
			},
		
			{ "421", 
				{	"player.moving",
					"player.buff(79206)",
					"player.buff(53817).count >= 3"
				}
			},
		
			{ "421", 
				{ 	"player.moving",
					"player.buff(53817).count = 5"
				}
			},
		
			--unleash_elements
			{ "73680"},
	
			--stormblast
			{ "115356","player.buff(114049)"}, 
	
			--chain_lightning,if=active_enemies>=2&buff.maelstrom_weapon.react>=1
			{ "421","player.buff(53817).count >= 1"},
	
			{ "421", 
				{	"!player.moving",
					"player.buff(53817).count >= 1"
				}
			},
		
			{ "421", 
				{	"player.moving",
					"player.buff(79206)",
					"player.buff(53817).count >= 1"
				}
			},
		
			--stormstrike
			{ "17364"}, 
	
			--earth_shock,if=active_enemies<4
			{ "8042","modifier.enemies < 4"},
			
			--feral_spirit
			{ "51533","target.spell(73899).range"}, 
	
			--earth_elemental_totem, if=!active & cooldown.fire_elemental_totem.remains>=50
			{ "2062", 
				{	"target.range <= 25",
					"!player.totem(2062)",
					"!player.totem(2894)",
					"player.spell(2894).cooldown >= 60"
				}
			}, 
		
			--spiritwalkers_grace,moving=1
			{ "79206","player.moving"}, 
	
		}, 
		{
			"modifier.enemies > 2",
			"modifier.multitarget"
		}
	},
	

    -- Rotation
		--spirit walk target > 15 yds
		{ "58875", "target.range >= 15"}, 
		
		--searing totem
		{ "3599","@mavlib.SearingTotem"},
		
		--unleash_elements, if=(talent.unleashed_fury.enabled | set_bonus.tier16_2pc_melee=1)
		{ "73680", 
			{	"target.spell(73680).range",
				"player.spell(117012).exists"
			}
		},
			
		{ "73680","@mavlib.t16_2pc"},		
		-- elemental_blast, if=talent.elemental_blast.enabled & buff.maelstrom_weapon.react>=1 - NOT MOVING
		{ "117014", 
			{ 	"!player.moving",
				"player.buff(53817).count >= 1"
			}
		}, 
			
		 --elemental blast Moving Spiritwalkers Grace	
		{ "117014", 
			{	"player.moving",
				"player.buff(79206)",
				"player.buff(53817).count >= 1"
			}
		}, 
		
		--elemental blast MOVING 5 Maelstrom so instant cast		
		{ "117014", 
			{	"player.moving",
				"player.buff(53817).count = 5"
			}
		}, 
		
		--lightning_bolt,if=buff.maelstrom_weapon.react=5		
		{ "403", "player.buff(53817).count = 5"}, 
			
		--feral_spirit,if=set_bonus.tier15_4pc_melee=1	
		{ "51533", 
			{	"target.spell(73899).range",
				"@mavlib.t15_4pc"
			}
		}, 
			
		--Stormblast (stormstrike during ascendence)	
		{ "115356","player.buff(114049)"}, 
					
		--Stormstrike	
		{ "17364"}, 
		
		--flame_shock, if=buff.unleash_flame.up & !ticking		
		{ "8050",
			{	"player.buff(73683)", 
				"!target.debuff(8050)"
			}
		},
			
		--Lavalash		
		{ "60103"}, 
			
		-- lightning_bolt, if= set_bonus.tier15_2pc_melee=1 & buff.maelstrom_weapon.react>=4 & !buff.ascendance.up		
		{ "403", 
			{	"@mavlib.t15_2pc",
				"player.buff(53817).count >= 4",
				"!player.buff(114049)"
			}
		},		
		
		--flame_shock, if= (buff.unleash_flame.up & (dot.flame_shock.remains<10 | set_bonus.tier16_2pc_melee=0)) | !ticking
		{ "8050",
			{	"player.buff(73683)", 
				"target.debuff(8050).duration < 10"  
			}
		}, 
			
		{ "8050",
			{	"player.buff(73683)", 
				"!@mavlib.t16_2pc"  
			}
		}, 
			
		{ "8050","target.debuff(8050).duration < 3"}, 
			
		--unleash_elements 73680 lvl 81
		{ "73680"},
		
		--frost_shock, if=glyph.frost_shock.enabled & set_bonus.tier14_4pc_melee=0
		{ "8056", 
			{	"player.glyph(55443)",
				"!@mavlib.t14_4pc"
			}
		},
		
		--lightning_bolt, if=buff.maelstrom_weapon.react>=3 &!buff.ascendance.up
		{ "403", 
			{	"player.buff(53817).count >= 3",
				"!player.buff(114049)"
			}
		},
			
		--ancestral_swiftness, if=talent.ancestral_swiftness.enabled & buff.maelstrom_weapon.react<2
		{ "16188","player.buff(53817).count < 2"},
			
		--lightning_bolt,if=buff.ancestral_swiftness.up
		{ "403","player.buff(16188)" },
		
		--earth_shock,if=(!glyph.frost_shock.enabled|set_bonus.tier14_4pc_melee=1)
		--NEM didn't use the other 2 and think its supposed to be T9_4pc
		{ "8042"},
		
		--feral_spirit Primal Strike range check
		{ "51533", "target.spell(73899).range"}, 
			
		--earth_elemental_totem,if=!active
		{ "2062", 
			{	"target.range <= 25",
				"!player.totem(2062)",
				"!player.totem(2894)",
				"player.spell(2894).cooldown > 60"
			}
		}, 
		
		--spiritwalkers_grace,moving=1
		{ "79206", "player.moving"}, 
		
		--lightning_bolt,if=buff.maelstrom_weapon.react>1&!buff.ascendance.up
		{ "403", 
			{	"player.buff(53817).count > 1",
				"!player.spell(403).casting",
				"!player.spell(117014).casting",
				"player.spell(73680).cooldown >= 1.5",
				"player.spell(17364).cooldown >= 1.5",
				"player.spell(8050).cooldown >= 1.5",
				"player.spell(60103).cooldown >= 1.5",
				"!player.buff(114049)"
			}
		},
		
		--Primal Strike 73899 lvl 3
		{"73899"},
			
		--Lightning Bolt moving
		{"403"},	

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
  --AutoAttack
	--Flame Strike
		{ "8050",
			{	"target.spell(8050).range",
				"target.exists",
				"target.enemy",
				"toggle.AT",
				"target.debuff(8050).duration < 3"
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
		{{
		{ "!/targetenemy","!target.alive"}, 
		{ "!/targetenemy","!target.enemy"}, 
		{ "!/targetenemy","!target.exists"}, 
		},{
		"toggle.AT"}
		},
}, function()
	ProbablyEngine.toggle.create('dispelmagic', 'Interface\\Icons\\spell_nature_nullifydisease', 'Auto Dispel Magic', 'Automatically dispel any magic buffs')
	ProbablyEngine.toggle.create('AT', 'Interface\\Icons\\inv_sword_04', 'Auto target', 'Automatically attack on enemy target')
	end
)
