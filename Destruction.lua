-- ProbablyEngine Rotation Packager
-- Custom Destruction Warlock Rotation
-- Created on Nov 25th 2013 9:32 pm
-- Based off Included
-- Some code "borrowed" from Charus https://probablyengine.com/forum/viewtopic.php?id=841
--  and Chunky https://probablyengine.com/forum/viewtopic.php?id=718
-- NO auto target, autofear, or auto RoF

ProbablyEngine.rotation.register_custom(267, "NEM Group", 
{
-- Buff
	{-- Dark Intent Charus
	"109773", 										
		{ 	"!player.buff(109773)",
			"!@nemcommon.tenSpellpower"					--10% spell power any
		}
	},
-- Curses  foiled again	
	-- Curse of Elements Charus
	{ "1490",  											
		{	"!modifier.last(1490)",							--Antispam
			"!target.debuff(1490)",						 	--CoE from anyone
			"!@nemcommon.fiveMagicdam"					 	--5% magic dam
		}
	},
	-- Curse of Enfeeblement
	{"109466",											
		{	"!target.debuff(1490)",
			"!target.debuff(109466)"
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
	-- Felhunter: Spell Lock
	{"103135",											
		{	"target.spell(103135).range",
			"modifier.interrupts" 
		}
	},
	-- Howl of Terror
	{"5484",											
		{	"target.range <= 10",
			"!target.immune.fear",
			"toggle.fears",
			--"modifier.interrupts" 
		}
	},
	-- Mortal Coil
	{"6789",											
		{	"target.spell(6789).range",
			"!target.immune.fear",
			"toggle.fears",
			"modifier.interrupts" 
		}
	},

--Heals
	-- Healthstone
	{"#5512", "player.health < 45"},					
	-- Mortal Coil
	{"6789",											
		{	"player.health <38",
			"toggle.fears",
			"target.spell(6789).range"
		}
	},
	-- Ember Tap 2 or more Embers
	{"114635",											
		{	"player.embers >= 20",
			"player.health < 60"
		}
	},
	-- Drain Life
	{"689","player.health < 60"},
	
		-- Heal pet if glyphed Health Funnel
	{"114189", "pet.health <= 80"}, 
	
	-- Lifeblood on cd for heal/haste
	{"Lifeblood","!modifier.last"},
	
	-- Fear Right Shift
	{"5782",											
		{	"target.range <= 7",
			"!target.debuff(fear)",
			"!modifier.last",
			"modifier.rshift",
			"!target.immune.fear"
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
	--Immolate
	{ "348", 											
		{	"target.debuff(348).duration <= 4",
			"!modifier.last"
		}
	},	
	--Rain of Fire Left Shift
	{ "5740", "modifier.lshift", "ground" },
	
	-- Single Target DPS
	-- ShadowBurn from Chunky
	{	
		{ 												
			{ "!17877", "player.buff(80240).count >= 1" }, 	-- Havoc
			{ "!17877", "@nemcommon.tempBuffs" }, 			-- BUFFS 
			{ "!17877", "player.embers >= 35" }, 			-- Capped
			{ "!17877", "target.deathin < 20" }, 			-- TTD < 30
		},
		{ "target.health < 20" }
	},
		
	--Incinerate with Proc
	{ "29722", "player.buff(108563)" },					
	--Incinerate with Proc when moving
	{ "!29722", 										
		{	"player.moving",
			"player.buff(108563)" 
		}
	},					
	-- Conflagrate 2 charges
		{ "17962",
			{	"spell.charges(17962) =2",
				"target.debuff(348)"
			}
		},				
	-- Chaos Bolt (Target Health >20%) Chunky
	{
		{ 												
			{ "116858",  									--Don't cap
				{	"!modifier.last", 
					"player.embers >= 35" 
				}
			}, 
			{ "!116858", "@nemcommon.tempBuffs" }, 			-- Blood of Y'Shaarj
		},
		{ 	"target.health > 20",  
			"!player.moving" 
		}
	},
	--Conflagrate
	{ "17962","target.debuff(348)" },										
	--Incinerate (filler)
	{ "29722"},											
	--Fel Flame
	{ "!77799", "player.moving" },						

},
{
--OOC
--summon pet, buffs
	--Buffs
	-- Dark Intent Charus
	{ "109773",  										
		{ 	"!player.buff(109773)",
			"!@nemcommon.tenSpellpower"					--10% spell power any
		}
	},					
	
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
		"!player.moving",
		"player.level >= 29"
		}
	},
	--  Succubus till Fel Hunter
	{"712",
		{	"!pet.exists",
			"!modifier.last",
			"!player.moving",
			"player.level >= 20",
			"player.level <= 28"
		}
	},

	-- imp till Succubus
	{"688",
		{	"!pet.exists",
			"!modifier.last",
			"!player.moving",
			"player.level <=19"
		}
	},

-- Focus Macro
	{ "!/focus [target=mouseover]", "modifier.lcontrol" },

	-- Havoc on Focus
	{ "80240", 											
		{	"focus.alive",
			"focus.enemy",
			"focus.spell(80240).range",
			"@nemcommon.targNotfocus"	
		}, "focus" 
	},	

	-- Immolate	
	{ "348",											
		{	"player.spell(348).exists",
			"target.spell(348).range",
			"target.exists",
			"target.enemy",
		},"target"
	},
}, function()
ProbablyEngine.toggle.create('fears', 'Interface\\Icons\\spell_shadow_possession', 'Fear4Interupts', 'Automatically use fear powers to stop casters')end
)
