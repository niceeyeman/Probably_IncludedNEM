-- ProbablyEngine Rotation Packager
-- Custom Destruction Warlock Rotation
-- Created on Nov 25th 2013 9:32 pm
-- Based off Included
-- Some code "borrowed" from Charus https://probablyengine.com/forum/viewtopic.php?id=841
--  and Chunky https://probablyengine.com/forum/viewtopic.php?id=718

ProbablyEngine.rotation.register_custom(267, "Included[NEM]", 
{
-- Buff
	{ "109773", 										-- Dark Intent Charus
		{ 	"!player.buff(109773)",
			"!@nemcommon.tenSpellpower"					--10% spell power any
		}
	},
-- Curses  foiled again	
	{ "1490",  											-- Curse of Elements Charus
		{	"!modifier.last(1490)",							--Antispam
			"!target.debuff(1490)",						 	--CoE from anyone
			"!@nemcommon.fiveMagicdam"					 	--5% magic dam
		}
	},
	{"109466",											-- Curse of Enfeeblement
		{	"!target.debuff(1490)",
			"!target.debuff(109466)"
		}
	},
		
  -- Cooldowns
	{ "113858", "modifier.cooldowns" },					--Dark Soul: Instability
	{ "18540", 											--Summon Doomguard
		{	"modifier.cooldowns",
			"modifier.rcontrol"
		}
	},					
-- Interupt
	{"103135",											-- Felhunter: Spell Lock
		{	"target.spell(103135).range",
			"modifier.interrupts" 
		}
	},
	{"5484",											-- Howl of Terror
		{	"target.spell(5484).range",
			"!target.immune.fear",
			"modifier.interrupts" 
		}
	},
	{"6789",											-- Mortal Coil
		{	"target.spell(6789).range",
			"!target.immune.fear",
			"modifier.interrupts" 
		}
	},

--Heals
	{"#5512", "player.health < 45"},					-- Healthstone
	{"6789",											-- Mortal Coil
		{	"player.health <88",
			"target.spell(6789).range"
		}
	},
	{"114635",											-- Ember Tap
		{	"player.embers >= 20",
			"player.health < 60"
		}
	},
	{"Lifeblood"},
	{"5782",											-- Fear
		{	"target.range <= 7",
			"!target.debuff(fear)",
			"!modifier.last",
			"modifier.rshift",
			"!target.immune.fear"
		}
	},
	
	{ "80240", 											-- Havoc on Focus
		{	"focus.alive",
			"focus.enemy",
			"focus.spell(80240).range",
			"@nemcommon.targNotfocus"	
		}, "focus" 
	},
		
-- Rotation
	--DoT
	{ "348", 											--Immolate
		{	"target.debuff(348).duration <= 4",
			"!modifier.last"
		}
	},	
		
	{	
		{ 												-- ShadowBurn from Chunky
			{ "!17877", "player.buff(80240).count >= 1" }, 	-- Havoc
			{ "!17877", "@nemcommon.tempBuffs" }, 			-- BUFFS 
			{ "!17877", "player.embers >= 35" }, 			-- Capped
			{ "!17877", "target.deathin < 20" }, 			-- TTD < 30
		},
		{ "target.health < 20" }
	},
		
	{ "29722", "player.buff(108563)" },					--Incinerate with Proc
	{ "!29722", 										--Incinerate with Proc when moving
		{	"player.moving",
			"player.buff(108563)" 
		}
	},					
	{ "17962","spell.charges(17962) = 2"},				-- Conflagrate 2 charges
	{ "5740", "modifier.lshift", "ground" },			--Rain of Fire
	{
		{ 												-- Chaos Bolt (Target Health >20%) Chunky
			{ "116858",  									--Don't cap
				{	"!modifier.last", 
					"player.embers >= 35" 
				}
			}, 
			{ "116858", "@nemcommon.tempBuffs" }, 			-- Blood of Y'Shaarj
		},
		{ 	"target.health > 20",  
			"!player.moving" 
		}
	},
	{ "17962" },										--Conflagrate
	{ "29722"},											--Incinerate (filler)
	{ "!77799", "player.moving" },						--Fel Flame

},
{
--OOC
--summon pet, buffs
-- Focus Macro
	{ "!/focus [target=mouseover]", "modifier.lcontrol" },

	{ "80240", 											-- Havoc on Focus
		{	"focus.alive",
			"focus.enemy",
			"focus.spell(80240).range",
			"@nemcommon.targNotfocus"	
		}, "focus" 
	},	

	{ "348",											-- Immolate	
		{	"player.spell(348).exists",
			"target.spell(348).range",
			"target.exists",
			"target.enemy",
			"!target.debuff(348)"
		},"target"
	},
  -- Create Healthstone
	{ "6201", 
		{ 	"@nemcommon.Healthstone",
			"!modifier.last" 
		}
	},
	  
	{ "109773",  										-- Dark Intent Charus
		{ 	"!player.buff(109773)",
			"!@nemcommon.tenSpellpower"					--10% spell power any
		}
	},					
	
	{"691","!pet.exists"},
})
