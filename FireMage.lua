-- ProbablyEngine Rotation Packager
-- Custom Fire Mage Rotation
-- Created on Dec 14th 2013 6:18 am
-- Mackdaddy2887's rotation Modded by NEM
-- Source: https://probablyengine.com/forum/viewtopic.php?id=800


ProbablyEngine.rotation.register_custom(63, "NEM Fire", 
{
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