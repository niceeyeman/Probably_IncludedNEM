-- ProbablyEngine Rotation Packager
-- Custom Fire Mage Rotation
-- Created on Dec 14th 2013 6:18 am
-- Mackdaddy2887's rotation Modded by NEM
-- Source: https://probablyengine.com/forum/viewtopic.php?id=800


ProbablyEngine.rotation.register_custom(63, "NEM Group", 
{
-- Pause for Invis
	{ "pause", "player.buff(66)" }, 						-- Pause Casting While Invisibile
	{ "pause", "player.buff(32612)" }, 					-- Pause Casting While Invisibile
	{ "pause", "player.buff(110959)" }, 					-- Pause Casting While Invisibile
	{ "pause", "player.buff(110960)" }, 					-- Pause Casting While Invisibile
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

 
-- Support
	{ "Evocation", "!player.buff(Invoker's Energy)" },	-- Evo for the buff

  
	-- Survival
	-- Ice Block
	{ "Ice Block", "player.health <= 25"},				-- OhShitHopeSomeoneKillsThat!
	-- Temporal Shield on CD
	{"115610"},	
	-- Healthstone
	{"!#5512", "player.health < 45" },
	
-- Cooldowns
  { "Mirror Image", "modifier.cooldowns" },				-- MiniMes
  
	-- Interrupts
	{ "2139",
		{	"target.spell(2139).range",
			"!modifier.last(2139)",
			"modifier.interrupts" 
		}, "target" 
	},
	-- Frostjaw 102051			
	{"102051", 
		{	"target.spell(102051).range",
			"modifier.interrupts" 
		}, "target" 
	},

	-- Polymorph Sheep on Focus
	{ "118", 										
		{	"focus.alive",
			"focus.enemy",
			"!focus.debuff(118)",
			"focus.spell(118).range",
			"!modified.last",
			"@nemcommon.targNotfocus"	
		}, "focus" 
	},	
 
-- Alter Time Burst
	{ "12043", 											-- Presence of Mind
        {   "player.spell(12043).exists", 				-- PoM
            "player.buff(Heating Up)", 					-- Heating Up
            "player.buff(Pyroblast!)"  					-- Pyroblast
		}, 
	},
	{ "108978", 											-- Alter Time Spell
        {   "!player.buff(110909)", 						-- Alter Time Buff               
            "player.buff(12043)", 							-- Presence of Mind
        }, 
	},
 
	{ "!Alter Time", -- Alter Time Spell
        {   "player.buff(110909)", -- Alter Time Buff
            "!player.buff(12043)", -- Presence of Mind
        }, 
	}, 
  

--Burst andor During PoM 
    { "!Pyroblast", "player.buff(12043)" },

-- AoE
	{ "Flamestrike", "modifier.lshift", "ground" },
	{ "Ring of Frost", "modifier.lalt", "ground" },
   -- More to come
	
 -- Mage Bombs
	{ "Nether Tempest", "!target.debuff(Nether Tempest)", "target" }, 
	{ "Nether Tempest", "target.debuff(Nether Tempest).duration <= 2", "target" },
	{ "Living Bomb", "!target.debuff(Living Bomb)", "target" },
	{ "Frost Bomb", "player.spell(Frost Bomb).cooldown = 0", "target" },
	{ "!Living Bomb", "@nemcommon.tempBuffs", "target" },
-- Rotation
	{ "!Combustion",  "modifier.lcontrol"},
		-- Presence of Mind
	{"12043"},
 	-- Pyro
	{ "11366",									
		{	"player.buff(12043)", 						-- Presence of Mind		
			"target.spell(11366).range",
		},"target"
	},
  
-- Dont wanna lose our Buff

	{ "!Pyroblast", 
        {   "player.buff(Pyroblast!).duration <= 4", 
            "player.buff(Pyroblast!).duration > 0",
        }, 
	}, 
 
--Otherwise we wait until we have both Heatingup and Pyro
	{ "Pyroblast", 
        {   "player.buff(Heating Up)", -- Heating Up
            "player.buff(Pyroblast!)", -- Pyroblast!p
        }, 
	}, 
	-- Inferno Blast
	{ "!Inferno Blast", "player.buff(Heating Up)" },
	-- Fire Blast
		{"2136", "target.spell(2136).range","target"}, --add moving later
	-- Scorch
	{ "Scorch", "player.moving" },
	-- Frostfire for snare
	{"44614", "!target.debuff(44614)","target"},			
	-- Fireball
	{ "133", "target.spell(133).range","target" },		
	-- Frostfire bolt for snare 44614 lvl 1 makes usable 10-12
	{"44614","!player.spell(133).exists"},
  },
{
-- OOC
	-- focus with right control
	{ "!/focus [target=mouseover]", "modifier.rcontrol" },

-- Buffs
		{ "Arcane Brilliance", "!player.buff" },
		{ "Molten Armor", "!player.buff(Molten Armor)" },
}
)