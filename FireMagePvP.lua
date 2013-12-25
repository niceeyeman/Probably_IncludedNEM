-- ProbablyEngine Rotation Packager
-- Custom Fire Mage Rotation
-- Created on Dec 14th 2013 6:18 am
-- Mackdaddy2887's rotation Modded by NEM
-- Source: https://probablyengine.com/forum/viewtopic.php?id=800


ProbablyEngine.rotation.register_custom(63, "NEM Fire PvP", 
{
	-- Auto Target Enemy /targetenemyplayer
	
	{ "!/targetenemy [noharm]", 
		{	"!target.alive", 
			"!target.enemy",
			"!target.exists",
		--	"!target.creatureType(Humanoid)",
		--	"!@nemcommon.targNotfocus", -- ignore focus	
		}
	},
	
	-- Pause for Invis
	{ "pause", "player.buff(66)" }, 						-- Pause Casting While Invisibile
	{ "pause", "player.buff(32612)" }, 					-- Pause Casting While Invisibile
	{ "pause", "player.buff(110959)" }, 					-- Pause Casting While Invisibile
	{ "pause", "player.buff(110960)" }, 					-- Pause Casting While Invisibile
 
	-- Support
	{ "Evocation", "!player.buff(Invoker's Energy)" },	-- Evo for the buff

	-- Survival
	-- Ice Block
	{ "Ice Block", "player.health <= 25"},				-- OhShitHopeSomeoneKillsThat!
	-- Temporal Shield on CD
	{"115610"},	
	-- Healthstone
	{"!#5512", "player.health < 45" },
	-- Lifeblood each upgrade has own spellid ?? =p
	{"Lifeblood", "player.health < 75"},
	
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
	
-- PVP Undead Racial
	-- Will of the Forsaken
	{"7744", "player.state.charm"},						
	{"7744", "player.state.fear"},						
	{"7744", "player.state.sleep"},						

-- OTHER Racials
	-- Blood Elf Arcane Torrent by name each class has own spellID
	{"Arcane Torrent","target.range <= 8"}, --untested
	-- Troll Berserking on CD
	{"26297"}, 
	-- Orc Blood Fury onCD by name multiple spellIDs
	{"Blood Fury"},
	-- Draenei Gift of the Naaru **included for copy/paste**
	{"Gift of the Naaru","player.health <= 80"},
	-- Pandaren Quaking Palm SAP **included for copy/paste**
	{"107079","modifier.interrupts"},
	-- Goblin Rocket Barrage **included for copy/paste**
	-- {"69041"},
	-- Goblin Rocket Jump **included for copy/paste**
	-- {"69070"},
	-- Night Elf Shadowmeld **included for copy/paste**
	-- {"58984"},
	-- Tauren War Stomp **included for copy/paste**
	{"20549","target.range <= 8"}, --untested
-- Racials end	

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
		-- Pyro with Buff
		{ "!Pyroblast","player.buff(Pyroblast!)","target"}, 
		-- Inferno Blast
		{ "!Inferno Blast", "player.buff(Heating Up)" },
		-- Fire Blast
		{"!2136", "target.spell(2136).range","target" }, 		--add moving later
		-- Scorch
		{ "Scorch", "player.moving" },
		-- Frostfire bolt for snare 44614 lvl 1
		{"44614", "!target.debuff(44614)","target"}, 
		-- Fireball 133 lvl 12
		{ "133", "target.spell(133).range","target" },		
		-- Frostfire bolt for snare 44614 lvl 1 makes usable 10-12
		{"44614","!player.spell(133).exists"},
},
{
-- OOC ------------------------------------------------------
	-- focus with right control
	{ "!/focus [target=mouseover]", "modifier.rcontrol" },
	
	-- Buffs
		--{ "Arcane Brilliance", "!player.buff" },
		{"1459","!player.buff"},
		--{ "Molten Armor", "!player.buff(Molten Armor)" },
		{"30482","!player.buff(30482)"},


	-- Auto Target Enemy
	{ "!/targetenemy [noharm]", 
		{	"!target.alive", 
			"!target.enemy",
			"!target.exists",
			"player.buff(30482)",
			"player.buff(1459)",
		}
	},
	
	-- Autoattacks
			{ -- Evo > PoM > Pyro
				{
					-- Evocation for buff
					{ "Evocation","!player.buff(Invoker's Energy)"},
					-- Mirror Image
					{ "Mirror Image", "modifier.cooldowns" },				-- MiniMes
					-- Presence of Mind for insta Pyro
					{ "12043"},	
					-- Pyro
					{ "11366",									
						{	"player.buff(12043)", 						-- Presence of Mind		
							"target.spell(11366).range",
						},"target"
					},
				},
				{	"player.spell(114003).exists",				--Evocation
					"player.spell(12043).exists",
					"!player.spell.cooldown(12043)",			-- Pres of Mind ready
					"target.exists",
					"target.alive", 
					"target.enemy",
					}, 
			}, -- /Evo > PoM > Pyro 
			-- Or just Snare it	
			-- Frostfire Bolt for snare
			{"44614", 
				{ 	"target.spell(44614).range",
					"!modified.last"
				},"target"
			},
	
}
)