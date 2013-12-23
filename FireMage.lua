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
	{ "Ice Block", "player.health <= 25"},				-- OhShitHopeSomeoneKillsThat!
	{"115610"},											-- Temporal Shield on CD
	{ "!#5512", "player.health < 45" }, 				-- Healthstone

-- Cooldowns
  { "Mirror Image", "modifier.cooldowns" },				-- MiniMes
  
 -- Interrupts
	{ "2139",
		{	"player.spell(2139).usable",
			"player.spell(2139).cooldown = 0",
			"!modifier.last(2139)",
			"modifier.interrupts" 
		}, "target" 
	},
				
	{"102051", 
		{	"target.spell(102051).range",
			"modifier.interrupts" 
		}, "target" 
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
 
  { "!Inferno Blast", "player.buff(Heating Up)" },
  { "Scorch", "player.moving" },
  { "133" }												-- Fireball
  },
{
-- OOC
-- Evo > PoM > Pyro
	{
		{
			{ "Evocation", -- Evo for buff
				{	"!player.buff(Invoker's Energy)",
					"player.spell(114003).exists",
				}
			},
			{ "Mirror Image", "modifier.cooldowns" },				-- MiniMes
			{ "12043","player.spell(12043).exists"},				-- PoM for insta Pyro
			{ "11366",									-- Pyro
				{	"player.buff(12043)", 						-- Presence of Mind		
					"player.spell(11366).exists",
					"target.spell(11366).range",
				},"target"
			},
		},
		{	"target.exists",											-- Don't waste mana
			"target.enemy",
			"!player.spell.cooldown(12043)",			-- Pres of Mind ready
			"!target.immune.all",						-- Can't touch this!
			"!target.buff(122464.any)", 				-- Dematerialize 
			"!target.buff(122470).any", 				-- touch of karma
		}, 
	}, 
-- Or just Fireball it		
		{ "133",											-- Fireball
			{	"target.exists",							-- Don't waste mana 
				"target.enemy",		
				"!target.immune.all",						-- Can't touch this!
				"!target.buff(122464.any)", 				-- Dematerialize 
				"!target.buff(122470).any",  				-- touch of karma
			} 
		},
-- Buffs
		{ "Arcane Brilliance", "!player.buff" },
		{ "Molten Armor", "!player.buff(Molten Armor)" },
}
)