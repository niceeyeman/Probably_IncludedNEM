-- ProbablyEngine Rotation Packager
-- Custom Retribution Paladin Rotation
-- Up to lvl 84 
-- Included Rotation Modded by niceeyeman [NEM]
-- Created on Dec 8th 2013 6:01 am

ProbablyEngine.rotation.register_custom(70, "NEM UpTo84 Group", {

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

