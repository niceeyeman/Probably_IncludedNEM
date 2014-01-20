-- ProbablyEngine Rotation Packager
-- Custom Retribution Paladin Rotation
-- Up to lvl 84 
-- Included Rotation Modded by niceeyeman [NEM]
-- Created on Dec 8th 2013 6:01 am

ProbablyEngine.rotation.register_custom(70, "NEM UpTo84 Group", {
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

	--Interrupts
	--Rebuke 96231 lvl 36
	{"Rebuke", "modifier.interrupts" },
	
	--Self Heals
	-- Healthstone
	{ "#5512", "player.health < 40" }, 
	--Word of Glory 85673 lvl 9
	{"Word of Glory", {
		"player.holypower >= 1",
		"player.health < 70"
		}},
	--Flash of Light 19750
	{"Flash of Light", {
		"player.buff(Selfless Healer).count = 3",
		"player.health < 75"
		}},
    --Cooldowns
	--Avenging Wrath 31884 lvl 72
    { "Avenging Wrath", {
        "modifier.cooldowns",
        "player.buff(Inquisition)"
    }},
	--Guardian of Ancient Kings 86698 lvl 75
    { "Guardian of Ancient Kings", {
        "modifier.cooldowns",
        "player.buff(Inquisition)"
    }},
    
    -- Inquisition 84963 lvl 81
    { "Inquisition", {
        "!player.buff(Inquisition)",
        "player.holypower >= 1"
    }},
    { "Inquisition", {
        "player.buff(Inquisition).duration <= 2",
        "player.holypower >= 3"
    }},
    
    --DPS
	--Avenging Wrath Active 31884 lvl 72
    {{	--Divine Storm 53385 lvl 34 MultiTarget ON
        { "Divine Storm", {
			"modifier.enemies >= 3",
			"player.holypower = 3",
			"modifier.multitarget",
			"target.range <= 8" 
		}},
		--Templar's Verdict 85256 lvl 10 MultiTarget OFF
		{ "Templar's Verdict", {
			"player.holypower = 3",
			"spell.cooldown(Hammer of Wrath) > 0.2"
		}},
		--Divine Purpose procs lvl 75
		{ "Divine Storm", {
			"modifier.enemies >= 3",
			"player.buff(Divine Purpose",
			"modifier.multitarget"
			}, "target.range <= 8" },
		--Templar's Verdict 85256 lvl 10 MultiTarget OFF
		{ "Templar's Verdict", {
			"player.buff(Divine Purpose",
			"spell.cooldown(Hammer of Wrath) > 0.2"}},
		--Hammer of Wrath 24275 lvl 38
		{ "Hammer of Wrath" },
		--Hammer of the Righteous 53595 lvl 20
        { "Hammer of the Righteous",{
        	"modifier.multitarget",
        	"spell.cooldown(Hammer of Wrath) > 0.2" }},
		--Exorcism 879 lvl 46
    	{ "Exorcism", "spell.cooldown(Hammer of Wrath) > 0.2" },
		--Crusader Strike 35395 lvl 1
    	{ "Crusader Strike", "spell.cooldown(Hammer of Wrath) > 0.2" },
		--Jusdgement 20271 lvl 5
    	{ "Judgement", "spell.cooldown(Hammer of Wrath) > 0.2" },
		--Divine Storm 53385 lvl 34 MultiTarget ON
    	{ "Divine Storm", {
		"modifier.enemies >= 3",
		"modifier.multitarget" 
		}},
		--Templar's Verdict 85256 lvl 10 MultiTarget OFF
		{ "Templar's Verdict", "!modifier.multitarget" },
    }, "player.buff(Avenging Wrath)"},
	
	--Divine Storm 53385 lvl 34 MultiTarget ON    
    { "Divine Storm", {
        "player.holypower >= 3",
        "modifier.multitarget",
		"target.range <= 8" 
		}},
	--Templar's Verdict 85256 lvl 10 MultiTarget OFF
    { "Templar's Verdict", "player.holypower = 3"},
	--Divine Purpose procs lvl 75
		{ "Divine Storm", {
			"player.buff(Divine Purpose",
			"modifier.enemies >= 3",
			"modifier.multitarget",
			"target.range <= 8" 
			}},
		--Templar's Verdict 85256 lvl 10 MultiTarget OFF
		{ "Templar's Verdict","player.buff(Divine Purpose"},
	--Hammer of the Righteous 53595 lvl 20
    { "Hammer of the Righteous", {
		"modifier.enemies >= 3",
		"modifier.multitarget" 
		}},
	--Exorcism 879 lvl 46
    { "Exorcism" },
    --Crusader Strike 35395 lvl 1
	{ "Crusader Strike"},
	--Jusdgement 20271 lvl 5
	{ "Judgment" },
	--Divine Storm 53385 lvl 34 MultiTarget ON
    { "Divine Storm", {
		"modifier.enemies >= 3",
		"modifier.multitarget" 
		}},
	--Templar's Verdict 85256 lvl 10 MultiTarget OFF
    { "Templar's Verdict", "!modifier.multitarget" },
  }, 
  {	-- Out of combat
	--Blessing of Might 19740 lvl 81
    { "Blessing of Might", {
		"!player.buff(Blessing of Might)",
		"toggle.BoM"
		}},
	--Blessing of Kings 20217 lvl 30
	{"Blessing of Kings", {
		"!player.buff(Blessing of Kings)",
		"!player.buff(Mark of the Wild)",
		"!player.buff(Embrace of the Shale Spider)",
		"!toggle.BoM"
		}},
	}, 
function()
ProbablyEngine.toggle.create('BoM', 'Interface\\Icons\\spell_holy_greaterblessingofkings', 'Blessing of Might OOC', 'Blessing of Might on, BoK off')
end)

