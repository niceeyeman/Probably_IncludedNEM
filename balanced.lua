-- Custom Balance Druid Rotation v0.1
-- Updated on Nov 29th
-- Boomkin's modded by NEM

ProbablyEngine.rotation.register_custom(102, "NEM Group", {

-- Force Moonkin Form - In Combat
{ "!/cancelform", 
	{	"toggle.moonkin",
		"player.seal = 1"
	}
},

{ "!/cancelform", 
	{	"toggle.moonkin",
		"player.seal = 3"
	}
},

{ "24858", 
	{	"toggle.moonkin",
		"!player.seal = 5"
	}
},

-- Pause Rotation
{ "pause", "modifier.lalt" },

-- Pause Rotation - Bear Form
{ "pause", "player.seal = 1" },

-- Pause Rotation - Cat Form
{ "pause", "player.seal = 3" },

-- Focus Macro
{ "!/focus [target=mouseover]", "modifier.lcontrol" },

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
	-- {"Arcane Torrent","target.range <= 8"}, --untested
	{"28730","target.range <= 8"}, --Default untested
	{"50613","target.range <= 8"}, --DK untested
	{"80483","target.range <= 8"}, --Hunter untested
	{"129597","target.range <= 8"}, --Monk untested
	{"25046","target.range <= 8"}, --Rogue untested
	{"69179","target.range <= 8"}, --Warrior untested
	
	--[[ Troll Berserking on CD included in cooldowns
	{"26297",
		{	"!modifier.last",
			"target.ttd > 14",
			"!player.buff(26297)"
		}
	}, ]]
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
	-- Night Elf Shadowmeld **included for copy/paste**
	-- {"58984"},
	-- Tauren War Stomp **included for copy/paste**
	{"20549",
		{	"target.range <= 8",
			"!modifier.last"
		}
	}, --untested
-- Racials end	

-- Barkskin
{ "22812", "player.health < 95" },

-- Heart of the Wild + Tranq Modifier (Keep this held till Tranquility casts)
{{
	{ "108288"},
	{ "740" },
	},"player.spell(108288).exists" ,"modifier.rshift" },

-- Renewal 108238 lvl 30 talent
{ "108238", "player.health <= 30"},

-- Rejuvenation 
{ "774", {
	"toggle.rejuve",
	"!player.buff(774)",
	"player.health <= 90"}},

-- Lifeblood 
{"Lifeblood","player.health <=95"},
	
-- Cenarion Ward
{ "102351","!player.buff(102351)"},

-- Healthstone
{"#5512", "player.health <= 65"},

-- Hurricane At Mouseover Modifier
{ "16914", "modifier.lshift", "ground" },

-- Solar Beam 78675  Stopcasting interrupt at 15%
{"78675","target.interruptsAt(15)"},

-- Starfall
{ "48505","!player.buff(48505)"},

-- Cooldowns
{	
	{
		{ "106731", "player.spell(106731).exists" }, -- Incarnation
		{ "112071" }, -- Celestial Alignment
		{ "26297"}, -- Berserking
		{ "110621"}, -- Mirror Images
		{ "106737", 
			{	"player.spell(106737).exists",
				"player.buff(16886)",
				"player.buff(137590)",
				"player.spell(106737).charges >= 1"
			}
		}, -- Treants
	}, "modifier.cooldowns" 
},
  
-- Moonfire Redot Celestial End
{ "8921", {
	"player.buff(112071)",
	"player.buff(112071).duration < 2",
	"@nemcommon.garroshMC(target)"
}},

-- Starsurge
{ "78674" },

-- Dots Moonfire/Sunfire
{ "8921", { 
	"target.debuff(8921).duration < 2",
	"@nemcommon.garroshMC(target)"
}},
{ "93402", { 
	"target.debuff(93402).duration < 2",
	"@nemcommon.garroshMC(target)"
}},
{ "8921", { 
	"mouseover.debuff(8921).duration < 2",
	"@nemcommon.garroshMC",
	"modifier.multitarget"
}, "mouseover" },
{ "93402", { 
	"mouseover.debuff(93402).duration < 2",
	"@nemcommon.garroshMC",
	"modifier.multitarget"
}, "mouseover" },
{ "8921", { 
	"focus.debuff(8921).duration < 2",
	"@nemcommon.garroshMC"
}, "focus" },
{ "93402", { 
	"focus.debuff(93402).duration < 2",
	"@nemcommon.garroshMC"
}, "focus" },

-- Force of Nature - Trash
{ "106737", {
	"player.spell(106737).exists",
	"player.buff(16886)",
	"player.spell(106737).charges >= 2",
	"!modifier.cooldowns"
}},

-- Dots Moonfire/Sunfire and Starsurge Movement
{ "78674", "player.moving" },
{ "8921", {
	"player.balance.moon",
	"player.moving",
	"@nemcommon.garroshMC(target)"
}},
{ "93402", {
	"player.balance.sun",
	"player.moving",
	"@nemcommon.garroshMC(target)"
}},

 -- Starfire/Wrath
{ "2912", {
	"player.buff(112071)",
	"@nemcommon.interruptEvents(target)"
}},
{ "2912", {
	"player.balance.sun",
	"@nemcommon.interruptEvents(target)"
}},
{ "5176", {
	"player.balance.moon",
	"!player.buff(112071)",
	"@nemcommon.interruptEvents(target)"
}},

}, {

-- Aquatic Form swimming
	{ 
		{	
			{"/cancelform","!player.form = 0"},
			{"1066"},
		},	
		{	"!player.form = 2",
			"player.spell(1066).exists",
			"player.swimming"
		},
	},

-- Focus Macro - Out of Combat
{ "!/focus [target=mouseover]", "modifier.lcontrol" },
-- Cenarion Ward
{ "102351",
	{	"!player.buff(102351)"
		"target.exists",
		"target.enemy"
	}
},

--Autoattack

-- Dots Moonfire/Sunfire
{ "8921",
	{ 	"player.spell(8921).exists",
		"target.debuff(8921).duration < 2",
		"@nemcommon.garroshMC(target)",
		"target.spell(8921).range",
		"target.exists",
		"target.enemy"
	},"target"
},
{ "93402", 
	{	"target.debuff(93402).duration < 2",
		"@nemcommon.garroshMC(target)",
		"target.spell(93402).range",
		"target.exists",
		"target.enemy"
	},"target"
},

}, function()
ProbablyEngine.toggle.create('rejuve', 'Interface\\Icons\\spell_nature_rejuvenation', 'Rejuvenation', 'Toggle Rejuvenation')
ProbablyEngine.toggle.create('moonkin', 'Interface\\Icons\\spell_nature_forceofnature', 'Moonkin Form - Combat', 'Toggle To Force Moonkin Form - In Combat Only')

end)