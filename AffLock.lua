-- ProbablyEngine Rotation Packager
-- Custom Affliction Warlock Rotation by NEM
-- Created on Dec 20th 2013 12:12 am
-- **Based off Apoc Affliction PVP**


ProbablyEngine.rotation.register_custom(265, "NEM Solo-PVP", 
{ 
--InCombat

--Buffs 

	{"Dark Intent","!player.buff(Dark Intent)"},
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
	{"Lifeblood","player.health <= 90"},
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
			{"Agony", 
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
})
