
-- ProbablyEngine Rotation Packager
-- Custom Brewmaster Monk Rotation
-- Created on Nov 18th 2013 10:23 am
-- Based on Koha's
ProbablyEngine.rotation.register_custom(269, "NEM Solo-PvP", 
{
-- Flying Serpent Kick  to Landing
	{"101545",
		{	"target.spell(116705).range", 		-- Spear Hand Strike for range check
			"@nemcommon.flySerpentT",			-- FSK flying?
			"toggle.fly",
			--"@nemcommon.debug('Kick Land')"
		}
	}, 
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
	
	{ 	"Touch of Death", 
		{	"!target.isPlayer",
			"player.buff(Death Note)" 
		}
	},
	
--Buff
	-- Legacy of the Emperor 115921 lvl 22
	{ "Legacy of the Emperor", 
		{	"!player.buff(115921)",
			"!player.buff(117666)",
			"!modifier.last",
			"@nemcommon.fiveMainstats()"
		}
	},
	-- Legacy of the White Tiger 116781 lvl 81
	{ "Legacy of the White Tiger",
		{	"!player.buff(116781)",
			"!modifier.last",
			"@nemcommon.fiveCrit()"
		}
	},

	-- Auto Target Enemy 
	{ "!/targetenemy","!target.alive",}, 
	{ "!/targetenemy","!target.enemy"}, 
	{ "!/targetenemy","!target.exists"}, 


--Interupts
	{
		{
			{ "Spear Hand Strike" },
			{ "Leg Sweep" },
			{ "Charging Ox Wave" },
			{ "Ring of Peace",true,"player"},
		},
		{	"target.casting.time <= 2",
			"target.interruptsAt(50)"
		}
	},
	{
		{
			{ "Spear Hand Strike" },
			{ "Leg Sweep" },
			{ "Charging Ox Wave" },
			{ "Ring of Peace",true, "player" },
		},
		{	"target.casting.time > 2",
			"target.interruptsAt(20)"
		}
	},

{ "!/cast [@mouseover,harm,exists][] storm, earth, and fire", "modifier.control" },
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
	{"26297",
		{	"!modifier.last",
			"target.ttd > 14",
			"!player.buff(26297)"
		}
	}, 
	-- Orc Blood Fury onCD by name multiple spellIDs
	{"Blood Fury",
		{	"!modifier.last",
			"target.ttd > 14",
			"!player.buff(Blood Fury)"
		}
	},
	-- Draenei Gift of the Naaru **included for copy/paste**
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

--Self Healing T2
	{ "Zen Sphere", "!player.buff(Zen Sphere)", "player" },
	{ "Chi Burst" },
	{ "Chi Wave" },
	{ "#trinket1" },
	{ "#trinket2" },
	{ "#gloves"},
	-- Healthstone
	{"#5512", "player.health < 65"},					

--Shared Rotations
	{ "Expel Harm", "player.health < 80" },
	{ "Tigereye Brew", "player.buff(Tigereye Brew).count >= 10" },
	{ "Energizing Brew", { "player.energy < 20", "player.spell(Fists of Fury).cooldown" }},
	{ "Touch of Karma", "player.health < 90" },
	{ "Grapple Weapon", "modifier.alt" },
	{ "Grapple Weapon", "target.isPlayer" },

--Rotation Single Target/multi target
	{ "Tiger Palm", "player.buff(Tiger Power).duration < 3" },
	{ "Spinning Crane Kick", 
		{ 	"modifier.multitarget", 
			"!player.buff(Rushing Jade Wind)" 
		}
	},
	{ "Rising Sun Kick" },
	{ "Tiger Palm", "player.buff(Combo Breaker: Tiger Palm)" },
	{ "Fists of Fury", 
		{ 	"player.energy <= 40", 
			"player.buff(Tiger Power).duration > 5", 
			"!player.moving", 
			"!player.buff(Energizing Brew)" 
		}
	},
	{ "Blackout Kick", "player.buff(Combo Breaker: Blackout Kick)" },
	{ "Blackout Kick", "player.chi >= 3" },
	{ "Jab" },


-- Out Of Combat
},
{
-- Flying Serpent Kick  to Landing
	{"101545",
		{	"target.spell(116705).range", 		-- Spear Hand Strike for range check
			"@nemcommon.flySerpentT",			-- FSK flying?
			"toggle.fly",
			--"@nemcommon.debug('Kick Land')"
		}
	}, 

	-- Legacy of the Emperor 115921 lvl 22
	{ "Legacy of the Emperor", 
		{	"!player.buff(115921)",
			"!player.buff(117666)",
			"!modifier.last",
			"@nemcommon.fiveMainstats"
		}
	},
	-- Legacy of the White Tiger 116781 lvl 81
	{ "Legacy of the White Tiger",
		{	"!player.buff(116781)",
			"!modifier.last",
			"@nemcommon.fiveCrit"
		}
	},
	
	-- Kick em in the face
	-- Flying Serpernt kick
	{"101545",
		{	"target.spell(117952).range", 	-- Crackling Jade Lightning for range check
			"!target.spell(116705).range",	-- Spear Hand Strike for Min Range
			"target.exists",
			"target.enemy",
			"!modifier.last(101545)",
			"toggle.fly",
			--"@nemcommon.debug('Kick Launch')"
		},
	},			
  
	-- Auto Target Enemy 
	{ "!/targetenemy","!target.alive",}, 
	{ "!/targetenemy","!target.enemy"}, 
	{ "!/targetenemy","!target.exists"}, 

  
},function()
ProbablyEngine.toggle.create('fly', 'Interface\\Icons\\ability_monk_flyingdragonkick', 'FSK', 'Automatically FSK when in melee range')end

)