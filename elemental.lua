-- ProbablyEngine Rotation Packager
-- Custom Elemental Shaman Rotation
-- niceeyeman [NEM]
-- Based off Included Elem rotation 14Dec2013
-- Created on 14Dec2013

-- Healing
ProbablyEngine.library.register('coreHealing', { 
		needsHealing = function(percent, count) 
		return ProbablyEngine.raid.needsHealing(tonumber(percent)) >= count 
		end, 
	needsDispelled = function(spell) 
		for unit,_ in pairs(ProbablyEngine.raid.roster) do 
			if UnitDebuff(unit, spell) then 
			ProbablyEngine.dsl.parsedTarget = unit 
			return true 
			end 
		end 
	end, 
	})


ProbablyEngine.rotation.register_custom(262, "SoloPvP_NEM", {

--In Combat Buffs
    { "Flametongue Weapon", "!player.enchant.mainhand" },
    { "Lightning Shield", "!player.buff(Lightning Shield)" },
	
-- PVP Trink
	{"#29593", "player.state.fear"},
	{"#29593", "player.state.incapacitate"},
	{"#29593", "player.state.disorient"},

	-- interrupt
	--Wind Shear 57994 lvl 16
	{ "Wind Shear", {
		"player.spell(57994).exists",
		"modifier.interrupts" }},
	{ "Wind Shear", {
		"player.spell(57994).exists",
		"modifier.interrupts", "focus" }},
	
--Survival
	--Healthstone 5512
	{"#5512", "player.health < 45"},
	
	--Draenei: Gift of the Naaru
	{ "59544", {
		"player.spell(59544).exists",
			"!player.buff(59544)",
			"player.health < 71"}},
			
	--Healing Surge 8004 lvl 7    
	{"Healing Surge", 
		{"player.health <= 50",
		"!modifier.last"}},
		
	--Astral Shift 108271 lvl 15 talent
	{"Astral Shift", {
		"player.spell(108271).exists",
		"player.health <= 90"}},
		
	--Cleanse Spirit Self 51886 lvl 18
	{"Cleanse Spirit", {
		"player.spell(51886).exists",
		"player.dispellable(Cleanse Spirit)"}},

--Pop Their Bubble
    --Purge 370 lvl 12 if target has PW:S
	{ "Purge", {
		"player.spell(370).exists",
		"target.buff(Power Word: Shield)", "target" }},
	
--Dispel Any Magic Buff if Button ON
    --Purge 370 lvl 12 
	{ "Purge", {
		"player.spell(370).exists",
		"target.dispellable(Purge)",
		"toggle.dispelmagic"},
		"target" },


--Mana
	--Thunderstorm 51490 lvl 10
	{"Thunderstorm","player.mana <= 50"},
	
--DPS WILL NOT FIRE IF TARGET CAN'T BE HURT	
	
    {{
    -- AoE
	--Earthquake 61882 lvl 60
    { "Earthquake", {
		"player.spell(61882).exists",
		"modifier.shift", "ground" }},

    -- Cooldowns
	--Shamanistic Rage 30823 lvl 65
    { "Shamanistic Rage", {
		"player.spell(30823).exists",
		"modifier.cooldowns" }},
	--Stormlash Totem 120668 lvl 78	
    { "Stormlash Totem", {
		"player.spell(120668).exists",
		"modifier.cooldowns" }},
	--Fire Elemental	
    { "Fire Elemental Totem", "modifier.cooldowns" },
    { "Ascendance", {
      "modifier.cooldowns",
      "!player.buff(Ascendance)"
    }},

    -- Totems
    { "Searing Totem", {
		"!player.moving",	
		"!player.totem(Fire Elemental Totem)",
		"!player.totem(Searing Totem)"}},
    { "Healing Stream Totem", {
		"modifier.cooldowns",
		"!player.moving",
		"lowest.health < 95",
		"!totem(Healing Stream Totem)" }},
    { "Grounding Totem", {
	    "modifier.cooldowns",
		"!player.moving",
		"!totem(Grounding Totem)" }},
	
    -- Rotation
    { "Flame Shock", "target.debuff(Flame Shock).duration <= 3" },
    { "!Flame Shock", {
		"target.debuff(Flame Shock).duration <= 3",
		"player.moving",}},
    { "Lava Burst", "!player.moving" },
    { "Elemental Blast",  },
    { "Earth Shock", "player.buff(Lightning Shield).count >= 6" },
    { "!Earth Shock", {
		"player.buff(Lightning Shield).count >= 6",
		"player.moving"}},
	{ "!Frost Shock", {
		"!target.debuff(Frost Shock).any",
		"target.moving"}},
--Primal Strike 73899 lvl 3
		{"73899", {
			"player.spell(73899).exists",
			"target.spell(73899)range"}},
    -- Aoe
    { "Chain Lightning", {
		"modifier.enemies > 1",
		"modifier.multitarget",
		"!player.moving"}},

    -- Filler
    { "Lightning Bolt" },
    { "!Lightning Bolt","player.moving" },
	},{								--Don't waste mana 
		"!target.immune.all",		--Can't touch this!
    	"!target.buff(122464.any)", -- Dematerialize 
		"!target.buff(122470).any", -- touch of karma
		}},     
},
{
--Out of Combat 
	--{"!/click SmartBuff_KeyButton"},
--Autoattack
  { "8050",{
			"player.spell(8050).exists",
			"target.spell(8050).range",
			"target.exists",
			"target.enemy",
			"!target.debuff(8050)"},"target"}, 
	{"403", { 
		"target.spell(403).range",
		"target.enemy",
		"target.exists"},"target"},
--Buffs
  { "Lightning Shield", "!player.buff" },
  { "Flametongue Weapon", "!player.enchant.mainhand" },
  {"Totemic Recall",{
		"player.totem(Searing Totem).duration < 45",
		"player.totem(Searing Totem)"}},
  {"Totemic Recall",{
		"player.moving",
		"player.totem(Searing Totem)"}},
		
  	--Cleanse Spirit Self
	{"Cleanse Spirit", "player.dispellable(Cleanse Spirit)"},
		--Healing Surge 2061 lvl 7        
	{"Healing Surge", "player.health <= 75"}, 
  
--Moving buff  
	{ "Ghost Wolf",
		{
		"toggle.gwooc",
		"player.moving",
		"!player.buff(Ghost Wolf)"
		}},
		
}, function()
ProbablyEngine.toggle.create('dispelmagic', 'Interface\\Icons\\spell_nature_nullifydisease', 'Auto Purge', 'Automatically dispel any magic buffs')
ProbablyEngine.toggle.create('gwooc', 'Interface\\Icons\\spell_nature_spiritwolf', 'Auto Ghost Wolf', 'Automatically GW when moving OOC')
end)

