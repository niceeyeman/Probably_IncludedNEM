-- ProbablyEngine Rotation Packager
-- Custom Frost Death Knight Rotation
-- Created on Dec 10th 2013 10:05 pm
-- SPEC ID 251
ProbablyEngine.rotation.register_custom(251, "NEM solo-PvP", {
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

    -- Survival
    -- Death Pact Macro
    { "!/cast Raise Dead\n/cast Death Pact", {
      "player.health < 35",
      "player.spell(Death Pact).cooldown",
      "player.spell(Raise Dead).cooldown",
      "player.spell.usable(Death Pact)"
    }},
--Interupts
	{ "MindFreeze", "modifier.interrupts" },  --MindFreeze
	{ "Asphyxiate", { "player.spell(Asphyxiate).exists", "modifier.interrupts" }}, --Asphyxiate


    -- Keep up dots
	{ "Unholy Blight", { --Unh0lyBlight1
	"player.spell(Unholy Blight).exists",
	"modifier.multitarget",
	"target.range <= 8",
	}},
    { "Outbreak", "!target.debuff(Blood Plague)" },
    { "Outbreak", "!target.debuff(Frost Fever)" },
    { "Soul Reaper", "target.health < 30" },
    { "Plague Strike", "!target.debuff(Blood Plague)" },
	{"Howling Blast", "!target.debuff(Frost Fever)"},
	{ "Obliterate", "player.buff(Freezing Fog)" },
    { "Howling Blast", "player.buff(Rime)" },
    { "Obliterate", "player.buff(Killing Machine)" },
    { "Frost Strike"},
    { "Obliterate" },
    { "Howling Blast", "player.runes(frost) = 2" },
    { "Horn of Winter" },

  }
)