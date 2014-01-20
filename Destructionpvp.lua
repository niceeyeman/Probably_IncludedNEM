-- ProbablyEngine Rotation Packager
-- Custom Destruction Warlock Rotation
-- Created on Nov 25th 2013 9:32 pm
-- Based off Included
-- Some code "borrowed" from Charus https://probablyengine.com/forum/viewtopic.php?id=841
--  and Chunky https://probablyengine.com/forum/viewtopic.php?id=718

ProbablyEngine.rotation.register_custom(267, "NEM Solo-PvP", 
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
	
	-- Auto Target Enemy 
	{ "/targetenemy","!target.alive"}, 
	{ "/targetenemy","!target.enemy"}, 
	{ "/targetenemy","!target.exists"}, 
	
-- Buff
	-- Dark Intent Charus
	{ "109773","@nemcommon.tenSpellpower"},					--10% spell power any
	-- Blood Horror 111397
	{"111397","!player.buff(111397)"},
	-- Twilight Ward
	{"6229", 
		{	"target.player",
			"target.enemy"
		}
	},
	
-- Curses  foiled again	
	-- Curse of Elements Charus
	{ "1490",  										
		{	"!modifier.last(1490)",							 	--Antispam
			"@nemcommon.fiveMagicdam"					 		--5% magic dam
		}
	},
	-- Curse of Enfeeblement
	{"109466",											
		{	"!target.debuff(1490)",
			"!target.debuff(109466)",
			"!modifier.last(1490)"
		}
	}, 
		
  -- Cooldowns
	--Dark Soul: Instability
	{ "113858", "modifier.cooldowns" },					
	--Summon Doomguard
	{ "18540", 										
		{	"modifier.cooldowns",
			"modifier.rcontrol"
		}
	},
	
-- Interupt
	-- Felhunter: Spell Lock 2 sec or < 50%
	{"103135",											
		{	"target.spell(103135).range",
			"target.casting.time <= 2",
			"target.interruptAt(50)"
		}
	},
	-- Felhunter: Spell Lock > 2 sec 15%
	{"103135",											
		{	"target.spell(103135).range",
			"target.casting.time > 2",
			"target.interruptAt(15)"
		}
	},
	-- Howl of Terror
	{"5484",											
		{	"target.range <= 10",
			"!target.immune.fear",
			"modifier.interrupts" 
		}
	},
	-- Mortal Coil 2 sec or less 50%
	{"6789",											
		{	"target.spell(6789).range",
			"!target.immune.fear",
			"target.casting.time <= 2",
			"target.interruptsAt(50)"
		}
	},
	-- Mortal Coil > 2 sec 15%
	{"6789",											
		{	"target.spell(6789).range",
			"!target.immune.fear",
			"target.casting.time > 2",
			"target.interruptsAt(15)"
		}
	},
	
-- Healing
	-- Healthstone
	{"#5512", "player.health < 65"},					
	-- Mortal Coil
	{"6789",											
		{	"player.health < 88",
			"target.spell(6789).range"
		}
	},
	-- Lifeblood 121279, 74497, 55503, 55502, 55501, 55500, 55480, 55428, 81708 
	{"121279",
		{	"!modifier.last",
			"player.health < 70",
			"!player.buff(121279)"
		}
	},
	{"74497",
		{	"!modifier.last",
			"player.health < 70",
			"!player.buff(74497)"
		}
	},
	{"55503",
		{	"!modifier.last",
			"player.health < 70",
			"!player.buff(55503)"
		}
	},
	{"55502",
		{	"!modifier.last",
			"player.health < 70",
			"!player.buff(55502)"
		}
	},
	{"55501",
		{	"!modifier.last",
			"player.health < 70",
			"!player.buff(55501)"
		}
	},
	{"55500",
		{	"!modifier.last",
			"player.health < 70",
			"!player.buff(55500)"
		}
	},
	{"55480",
		{	"!modifier.last",
			"player.health < 70",
			"!player.buff(55480)"
		}
	},
	{"55428",
		{	"!modifier.last",
			"player.health < 70",
			"!player.buff(55428)"
		}
	},
	{"81708",
		{	"!modifier.last",
			"player.health < 70",
			"!player.buff(81708)"
		}
	},
	-- Lifeblood end
	
	-- Ember Tap 2 or more Embers	
	{"114635",											
		{	"player.embers >= 10",
			"player.health < 60"
		}
	},	
	-- Drain Life
	{"689",
		{	"target.spell(689).range",
			"!player.casting",
			"!player.moving",
			"player.health < 60"
		}
	},
	-- Heal pet if glyphed Health Funnel
	{"114189", "pet.health <= 80"}, 

	-- Lifeblood on cd for haste 15 sec fight
	-- Lifeblood 121279, 74497, 55503, 55502, 55501, 55500, 55480, 55428, 81708 
	{"/run CastSpellByID(121279)", "player.spell(121279).cooldown = 0"},
	{"/run CastSpellByID(74497)", "player.spell(74497).cooldown = 0"},
	{"/run CastSpellByID(121279)", "player.spell(121279).cooldown = 0"},
	
	{"121279",
		{	"!modifier.last",
			"target.ttd > 14",
			"!player.buff(121279)"
		}
	},
	{"74497",
		{	"!modifier.last",
			"target.ttd > 14",
			"!player.buff(74497)"
		}
	},
	{"55503",
		{	"!modifier.last",
			"target.ttd > 14",
			"!player.buff(55503)"
		}
	},
	{"55502",
		{	"!modifier.last",
			"target.ttd > 14",
			"!player.buff(55502)"
		}
	},
	{"55501",
		{	"!modifier.last",
			"target.ttd > 14",
			"!player.buff(55501)"
		}
	},
	{"55500",
		{	"!modifier.last",
			"target.ttd > 14",
			"!player.buff(55500)"
		}
	},
	{"55480",
		{	"!modifier.last",
			"target.ttd > 14",
			"!player.buff(55480)"
		}
	},
	{"55428",
		{	"!modifier.last",
			"target.ttd > 14",
			"!player.buff(55428)"
		}
	},
	{"81708",
		{	"!modifier.last",
			"target.ttd > 14",
			"!player.buff(81708)"
		}
	},
	-- Lifeblood end
	
	-- Fear auto fire
	{"5782",											
		{	"!target.debuff(fear)",
			"target.spell(5782).range",
			"!target.immune.fear",
			"!modifier.last",
			"toggle.fears",
		}
	},

	-- Havoc on Focus
	{ "80240", 										
		{	"focus.alive",
			"focus.enemy",
			"focus.spell(80240).range",
			"@nemcommon.targNotfocus"	
		}, "focus" 
	},

  -- Rotation
	--DoT
		-- Immolate
		{ "348", 											
			{	"target.debuff(348).duration <= 4",
				"!modifier.last"
			}
		},	
		--Rain of Fire
		{ "5740", 
			{	"modifier.multitarget",
				"!modifier.last"
			}, 	"ground" 
		},	
	-- Single Target DPS
		-- ShadowBurn from Chunky
		{ "!17877", 
			{	"player.buff(80240).count >= 1",		-- Havoc
				"target.health < 20"
			}
		},
		{ "!17877", 
			{	"@nemcommon.tempBuffs", 				-- BUFFS 
				"target.health < 20"
			}
		},
		{ "!17877", 
			{	"player.embers >= 35", 					-- Capped
				"target.health < 20"
			}
		},
		{ "!17877", 
			{	"target.deathin < 20", 					-- TTD < 30
				"target.health < 20"
			}
		},
		
		--Incinerate with Proc
		{ "29722", "player.buff(108563)" },		
		
		--[[ Incinerate with Proc when moving
		{ "!29722", 										
			{	"player.moving",
				"player.buff(108563)" 
			}
		}, ]]	
		
		-- Conflagrate 2 charges
		{ "17962",
			{	"spell.charges(17962) = 2",
				"target.debuff(348)"
			}
		},				
		-- Chaos Bolt (Target Health >20%) Chunky
		{ "116858",  										--Don't cap
			{	"!modifier.last", 
				"player.embers >= 35",
				"target.health > 20",  
				"!player.moving" 						
			}
		}, 
		{ "116858", 
			{	"@nemcommon.tempBuffs", 			-- Blood of Y'Shaarj
			 	"target.health > 20",  
				"!player.moving" 
			}
		},
		--Conflagrate 17962
		{ "17962","target.debuff(348)"},										
		--Incinerate (filler)
		{ "29722"},			
		--Fel Flame when Moving
		{ "!77799", "player.moving" },						
		
}, 
{
--OOC
--summon pet, buffs
	--Buffs
	-- Dark Intent 109773 lvl 82
	{ "109773","@nemcommon.tenSpellpower"},					--10% spell power any
	
	-- Unending Breath if swimming
	{"5697",
		{	"!player.buff(5697)",
			"player.swimming"
		}
	},
	
	-- Soulstone 20707 
	{"20707",
		{	"modifier.members == 0",
			"!player.buff(20707)"
		}
	},
	
	-- Blood Horror 111397
	{"111397","!player.buff(111397)"},

	-- Summon Healthstone if < 3
	{ "6201",
		{ 	"@nemcommon.Healthstone",
			"!modifier.last" 
		}
	}, 
		  	
	--  Fel Hunter
	{"691",
		{	"!pet.exists",
			"!modifier.last",
			"player.level >= 29"
		}
	},
	--  Succubus till Fel Hunter
	{"712",
		{	"!pet.exists",
			"!modifier.last",
			"player.level >= 20",
			"player.level <= 28"
		}
	},

	-- imp till Succubus
	{"688",
		{	"!pet.exists",
			"!modifier.last",
			"player.level <= 19"
		}
	},

-- Focus Macro
	{ "!/focus [target=mouseover]", "modifier.lcontrol" },

	-- Havoc on Focus-- Havoc on Focus
	{ "80240", 										
		{	"focus.alive",
			"focus.enemy",
			"focus.spell(80240).range",
			"@nemcommon.targNotfocus"	
		}, "focus" 
	},	
	
	-- Immolate
	{ "348",
		{	"target.spell(348).range",
			"target.exists",
			"target.enemy",
		},"target"
	},			
  
	-- Auto Target Enemy 
	{ "/targetenemy","!target.alive"}, 
	{ "/targetenemy","!target.enemy"}, 
	{ "/targetenemy","!target.exists"}, 

},function()
ProbablyEngine.toggle.create('fears', 'Interface\\Icons\\spell_shadow_possession', 'Autofear', 'Automatically use fear')
end)
