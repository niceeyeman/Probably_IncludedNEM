-- ProbablyEngine Rotation Packager
-- Custom Destruction Warlock Rotation
-- Created on Nov 25th 2013 9:32 pm
-- Based off Included
-- Some code "borrowed" from Charus https://probablyengine.com/forum/viewtopic.php?id=841
--  and Chunky https://probablyengine.com/forum/viewtopic.php?id=718
-- ******
-- NEED nemcommonlib github https://github.com/niceeyeman/Probably_nemcommonlib
-- ******

ProbablyEngine.rotation.register_custom(267, "Included[NEM] pvp", 
{
	-- Auto Target Enemy player
	{ "!targetenemyplayer [noharm]",  
		{	"!target.alive", 
			"!target.enemy",
			"!target.exists",
		}
	},
	-- Auto Target Enemy 
	{ "!targetenemy [noharm]",  
		{	"!target.alive", 
			"!target.enemy",
			"!target.exists",
		}
	},
	
-- Buff
	-- Dark Intent Charus
	{ "109773", 										
		{ 	"!player.buff(109773)",
			 "!@nemcommon.tenSpellpower"					--10% spell power any
		}
	},
	
-- Curses  foiled again	
	-- Curse of Elements Charus
	{ "1490",  										
		{	"!modifier.last(1490)",							 	--Antispam
			"!target.debuff(1490)",						 		--CoE from anyone
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
		{	"target.spell(5484).range",
			"!target.immune.fear",
			"modifier.interrupts" 
		}
	},
	-- Mortal Coil
	{"6789",											
		{	"target.spell(6789).range",
			"!target.immune.fear",
			"modifier.interrupts" 
		}
	},
	
-- PVP Trink Insignia of the Alliance
	{"#29593", "player.state.fear"},					-- Insignia of the Alliance
	{"#29593", "player.state.incapacitate"},
	{"#29593", "player.state.disorient"},

-- PVP Human Racial
	{"59752", "player.state.fear"},						-- Every Man for Himself
	{"59752", "player.state.incapacitate"},
	{"59752", "player.state.disorient"},
	
-- Healing
	-- Healthstone
	{"#5512", "player.health < 65"},					
	-- Mortal Coil
	{"6789",											
		{	"player.health < 88",
			"target.spell(6789).range"
		}
	},
	-- Ember Tap 2 or more Embers	
	{"114635",											
		{	"player.embers >= 20",
			"player.health < 60"
		}
	},

	-- Lifeblood on cd for heal/haste
	{"Lifeblood","!modifier.last"},
	
	-- Fear auto fire
	{"5782",											
		{	"target.range <= 7",
			"!target.debuff(fear)",
			"!modifier.last",
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
		-- Immolate
		{ "348", 											
			{	"target.debuff(348).duration <= 4",
				"!modifier.last"
			}
		},	
		--Rain of Fire
		{ "5740", "!modifier.last", "ground" },	
	-- Single Target DPS
		-- ShadowBurn from Chunky
		{ 													
			{
				{ "!17877", "player.buff(80240).count >= 1" }, 		-- Havoc
				{ "!17877", "@nemcommon.tempBuffs" }, 				-- BUFFS 
				{ "!17877", "player.embers >= 35" }, 				-- Capped
				{ "!17877", "target.deathin < 20" }, 				-- TTD < 30
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
		{ "17962","spell.charges(17962) =2"},				
		-- Chaos Bolt (Target Health >20%) Chunky
		{													
			{ 
				{ "116858",  										--Don't cap
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
		--Conflagrate
		{ "17962" },										
		--Incinerate (filler)
		{ "29722"},											
		--Fel Flame when Moving
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
	  	
	--  fel hunter
	{"691","!pet.exists"},								

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
		{	"player.spell(348).exists",
			"target.spell(348).range",
			"target.exists",
			"target.enemy",
		},"target"
	},			
  
	-- Auto Target Enemy player
	{ "!targetenemyplayer [noharm]",  
		{	"!target.alive", 
			"!target.enemy",
			"!target.exists",
		}
	},

	-- Auto Target Enemy 
	{ "!targetenemy [noharm]",  
		{	"!target.alive", 
			"!target.enemy",
			"!target.exists",
		}
	},

})
