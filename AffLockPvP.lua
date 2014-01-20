-- ProbablyEngine Rotation Packager
-- Custom Affliction Warlock Rotation by NEM
-- Created on Dec 20th 2013 12:12 am
-- **Based off Apoc Affliction PVP**


ProbablyEngine.rotation.register_custom(265, "NEM Solo-PVP", 
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

--Buffs 

	{-- Dark Intent Charus
	"109773", 										
		{ 	"!player.buff(109773)",
			"!@nemcommon.tenSpellpower"					--10% spell power any
		}
	},
	{"Blood Horror","!player.buff(Blood Horror)"},
	{"Dark Soul: Misery","!player.buff(Dark Soul: Misery)"},
	{"Twilight Ward",
		{	"target.class(Priest)",
			"!player.buff(Twilight Ward)"
		}
	},
	{"Twilight Ward",
		{	"target.class(Paladin)",
			"!player.buff(Twilight Ward)"
		}
	},
	{"Twilight Ward",
		{	"target.class(Warlock)",
			"!player.buff(Twilight Ward)"
		}
	},

 --Mana

	{"Life Tap",
		{ 	"player.health >= 85",
			"player.mana <= 40"
		},
	}, 

 --Pet
	{"112868",
		{	"!pet.exists",
			"!modifier.last"
		},
	},
   
 --OHHSHITZ
	{"!#5512", "player.health <= 60"},
	{"Unending Resolve","player.health <= 50"},
	{"Demonic Circle: Teleport","!player.health <= 30"},
	{"Fear",
		{	"!target.immune.fear",
			"!target.debuff(fear)",
			"!modifier.last",
			"target.spell(Fear).range"
		}
	},
	{"Sacrificial Pact","player.health <= 40"}, 
	{"Howl of Terror",
		{	"modifier.cooldown",
			"!target.immune.fear",
			"target.range <= 10"
		}
	},  
	{"Demonic Circle: Summon","modifier.lshift"}, 
	{"Demonic Gateway","modifier.lcontrol"}, 
	{"Drain Life","player.health <= 40"},
	-- Heal pet if glyphed Health Funnel
	{"114189", "pet.health <= 80"}, 

 --Interupts

	{"Fear",
		{	"target.casting",
			"!target.immune.fear",
			"target.spell(Fear).range"
		}
	},
	{"Mortal Coil",
		{	"target.casting",
			"!target.immune.fear",
			"target.spell(Mortal Coil).range"
		}
	},

-- Curses  foiled again	
	{ "1490",  										-- Curse of Elements Charus
		{	"!modifier.last(1490)",							 	--Antispam
			"!target.debuff(1490)",						 		--CoE from anyone
			"!@nemcommon.fiveMagicdam"					 	--5% magic dam
		}
	},
	{"18223",											-- Curse of Exhaustion
		{	"!target.debuff(18223).any",						-- Will over write Enfeeblement
			"!target.debuff(1490)",								-- but not Elements
			"!target.immune.snare",
			"!target.state.snare",
			"target.moving"
		}
	},
		
	{"109466",											-- Curse of Enfeeblement
		{	"!target.debuff(1490)",
			"!target.debuff(18233)",
			"!target.debuff(109466)"
		}
	},
		
-- DPS PVP immune checked
	{
		{	
			{"Fel Flame","player.moving"},
			{"!Agony", 
				{	"!modifier.last",
					"!target.debuff(Agony)"
				}
			},
				{ "172",											-- Corruption
					{	"!modifier.last",
						"player.spell(172).exists",
						"target.spell(172).range",
						"target.exists",
						"target.enemy",
						"!target.debuff(172)"
					},"target"
			}, 

			{"Unstable Affliction",
				{	"!modifier.last",
					"target.debuff(Unstable Affliction).duration <= 3"
				}
			},
			{"Seed of Corruption",
				{	"target.debuff(Seed of Corruption).duration <= 3",
					"!modifier.last"
				}
			},
			{"Haunt","!target.debuff(Haunt)"},
			{"Drain Soul","target.health <= 20"},
			{"Drain Life","player.health <= 40"},
			{"Malefic Grasp"},
			{"shadow bolt"},
		},
		{	"!target.immune.all",		--Can't touch this!
			"!target.buff(122464.any)", -- Dematerialize 
			"!target.buff(122470).any", -- touch of karma
		}
	},
 --Healing
   ---HEALING?!?! Theres no crying in Baseball!!!
},
{ -- OOC
 --Buffs 

  {"Dark Intent",
    "!player.buff(Dark Intent)"},
  {"Blood Horror",
    "!player.buff(Blood Horror)"},
	{"Create Healthstone",
		{	"@nemcommon.Healthstone",
			"!modifier.last"
		}
	},
  {"Life Tap",{
    "player.health >= 95",
    "player.mana <= 40"},
    "player"}, 
  {"Demonic Circle: Summon",
     "modifier.lshift"}, 
  {"Demonic Gateway",
     "modifier.lcontrol"}, 
  {"112868","!pet.exists"},

  --{"!#5512", 
  --  "player.health <= 40",
  --  "player"},
--Autoattack
	{ "Agony",
		{	"player.spell(Agony).exists",
			"target.spell(Agony).range",
			"target.exists",
			"target.enemy",
			"!target.debuff(Agony)"
		},"target"
	}, 
	{ "172",											-- Corruption
		{	"player.spell(172).exists",
			"target.spell(172).range",
			"target.exists",
			"target.enemy",
			"!target.debuff(172)"
		},"target"
	},
	-- Auto Target Enemy player
--	{ "!/targetenemyplayer [noharm]","!target.alive"}, 
--	{ "!/targetenemyplayer [noharm]","!target.enemy"}, 
--	{ "!/targetenemyplayer [noharm]","!target.exists"}, 

	{ "!/targetenemy","!target.alive"}, 
	{ "!/targetenemy","!target.enemy"}, 
	{ "!/targetenemy","!target.exists"}, 
	
})
