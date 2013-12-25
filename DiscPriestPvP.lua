-- ProbablyEngine Rotation Packager
-- Custom Discipline Priest Rotation
-- niceeyeman [NEM]
-- Based off Apoc_DiscPVP https://probablyengine.com/forum/viewtopic.php?pid=2194#p2194
-- Created on Dec 7th 2013 10:25 am

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


ProbablyEngine.rotation.register_custom(256, "NEM SoloPvP", {

--In Combat Buffs
	--Inner Fire 588 lvl 9
	{"Inner Fire", "!player.buff(Inner Fire)"},        			
	--Inner Focus 89485 lvl 36
	{"Inner Focus"},  									
	--Archangel 81700 lvl 50
	{"Archangel", "player.buff(Evangelism).count=5"},	
	--Power Word: Fortitude 21562 lvl 22
	{"Power Word: Fortitude", "!player.buff(Power Word: Fortitude)"}, 				
	--Power Word: Shield 17/Weakened Soul 6788 lvl 5
	{"Power Word: Shield", "!player.debuff(Weakened Soul)"}, 					
	--Fear Ward 6346 lvl 54
	{"Fear Ward", "!player.buff(Fear Ward)"}, 					
	--Renew 139 lvl 26 if NO PW:S but Debuff up
	{"Renew",											
		"!player.buff(Power Word: Shield)",
		"player.debuff(Weakened Soul)"},
		
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
	{"26297"}, 
	-- Orc Blood Fury onCD by name multiple spellIDs
	{"Blood Fury"},
	-- Draenei Gift of the Naaru **included for copy/paste**
	{"Gift of the Naaru","player.health <= 80"},
	-- Pandaren Quaking Palm SAP **included for copy/paste**
	{"107079","modifier.interrupts"},
	-- Goblin Rocket Barrage **included for copy/paste**
	-- {"69041"},
	-- Goblin Rocket Jump **included for copy/paste**
	-- {"69070"},
	-- Night Elf Shadowmeld **included for copy/paste**
	-- {"58984"},
	-- Tauren War Stomp **included for copy/paste**
	{"20549","target.range <= 8"}, --untested
-- Racials end	
	
--Survival
	--Pain Suppression 33206 lvl 58
	{"Pain Suppression", {
		"!player.buff(Pain Suppression)",
		"player.health <= 80"}},  						
	--Prayer of Mending 33076 lvl 68
	{"Prayer of Mending", "!player.buff(Prayer of Mending)"}, 				
	--Renew 139 lvl 26  
	{"Renew", {
		"!player.buff(Renew)",
		"player.health <= 80"}},						
	--Flash Heal 2061 lvl 7        
	{"Flash Heal", "player.health <= 70"}, 
	--Purify Self
	{"Purify", "player.dispellable(purify)"},

--Pop Their Bubble
    --Dispel Magic 528 lvl 26 if target has PW:S
	{ "Dispel Magic", "target.buff(Power Word: Shield)", "target" },
	
--Dispel Any Magic Buff if Button ON
    --Dispel Magic 528
	{ "Dispel Magic", {
	"target.dispellable(Dispel Magic)",
	"toggle.dispelmagic"},
	"target" },


--Mana
	--Mindbender 123040 lvl 45 Talent ON MOUSE
	{"Mindbender",{
		"player.mana <= 85",
		"target.range <= 40"},
		"ground"}, 
	--Shadowfiend 34433 lvl 42 ON MOUSE
	{"Shadowfiend",{
		"player.mana <= 85",
		"target.range <= 40"},
		"ground"},
    
--Survival Aoe's
	--Psychic Scream 8122
	{"Psychic Scream",
		"modifier.lshift"}, 
    --Psyfiend 108921   
	{"Psyfiend",
     "modifier.cooldown",
     "ground"}, 
         
--Dps Rotation
	--Shadow Word: Death 32379 lvl 46
	{"32379","target.health <= 20"}, 
    --Shadow Word: Pain 589 lvl 3
	{"589", "!target.debuff(589)"}, 
    --Cascade 121135   
	{"Cascade"}, 
     --Power Infusion 10060 
	{"Power Infusion"}, 
    --Holy Fire 14914
	{"Holy Fire"}, 
    --Penance 47540
	{"Penance"}, 
    --Smite 585  
	{"Smite"}, 
      
},{

--Out of Combat 
 {"!/click SmartBuff_KeyButton"},

	--[[Buffs
		--Inner Fire 588 lvl 9
		{"Inner Fire", "!player.buff(Inner Fire)"},        			
		--Inner Focus 89485 lvl 36
		{"Inner Focus"},  									
		--Archangel 81700 lvl 50
		{"Archangel", "player.buff(Evangelism).count=5"},	
		--Power Word: Fortitude 21562 lvl 22
		{"Power Word: Fortitude", "!player.buff(Power Word: Fortitude)"}, 				
 
	--Healing Rotation
		--Power Word: Shield 17/Weakened Soul 6788 lvl 5
		{"Power Word: Shield", {
			"!lowest.debuff(Weakened Soul)", 					
			"lowest.health <= 90",
			"lowest.range <= 40"
			}, "lowest" },
		{"Renew", {
			"!lowest.buff(Renew)", 
			"lowest.health <= 90",
			"lowest.range <= 40"}, 
			"lowest"},
		{"Flash Heal", {
			"lowest.range <= 40",
			"lowest.health <= 20"}, 
			"lowest" },
		{"Binding Heal", {
			"lowest.range <= 40",
			"lowest.health <= 40"}, 
			"lowest"},

	--Mana
		--Hymn of Hope 64901 
		{"Hymn of Hope","player.mana <= 50"}, 
       
]]
}, function()
ProbablyEngine.toggle.create('dispelmagic', 'Interface\\Icons\\spell_nature_nullifydisease', 'Auto Dispel Magic', 'Automatically dispel any magic buffs')
end)

--[[

ProbablyEngine.rotation.register_custom(256, "Apoc_DiscPvPHeals", {

--In Combat

   {"Inner Fire",
     "!player.buff(Inner Fire)"}, 
       --Inner Fire 588
   {"Inner Focus", 
      "!spell(Inner Focus).cooldown"},  
       --Inner Focus
   {"Archangel",
      "player.buff(Evangelism).count=5"},    
       --Archangel
   {"Power Word: Fortitude",
      "!player.buff(Power Word: Fortitude)"}, 
       --Power Word: Fortitude 21562
   {"Power Word: Shield",
     "player.buff(Weakened Soul)"}, 
       --Power Word: Shield/Weakened Soul
   {"Fear Ward",
     "player.buff(Fear Ward)"}, 
       --Fear Ward 6346

  --Survival

   {"Pain Suppression",
     "!player.buff(Pain Suppression)",
     "player.health <= 80"},  
       --Pain Suppression 33206
   {"Prayer of Mending",
     "!player.buff(Prayer of Mending).cooldown"}, 
       --Prayer of Mending
   {"Renew",
     "!player.buff(Renew)",
     "player.health <= 80"},  
       --Renew
   {"Flash Heal",
     "player.health <= 70"}, 
       --Flash Heal 2063
--Mana

   {"Mindbender",{
     "player.mana <= 85",
     "target.range <= 40"}}, 
       --Mindbender 123040
   {"Hymn of Hope",
     "player.mana <= 50"}, 
       --Hymn of Hope 64901 

  --Survival Aoe's

   {"Psychic Scream",
     "modifier.lshift",
     "ground"}, 
       --Psychic Scream 8122
   {"Psyfiend",
     "modifier.cooldown",
     "ground"}, 
       --Psyfiend 108921

--Heal Rotation
  {"Power Infusion",
       "modifier.cooldowns" },
  {"Power Word: Shield", {
	  "!lowest.debuff(Weakened Soul)",
	  "lowest.health <= 90",
	  "lowest.range <= 40"
	}, "lowest" },
  {"Renew", {
	  "!lowest.buff(Renew)", 
	  "lowest.health <= 85",
	  "lowest.range <= 40"
	}, "lowest"},
  {"Greater Healing", {
	  "lowest.health <= 60",
	  "lowest.range <= 40"
	}, "lowest"},
  {"Penance", {
	  "lowest.health <= 70",
	  "!spell(penance).cooldown",
	  "lowest.range <= 40"
	}, "lowest"},
  {"Flash Heal", {
	  "lowest.health <= 80",
	  "lowest.range <= 40" 
	}, "lowest" },
  {"Binding Heal", {
	  "lowest.health <= 60",
	  "lowest.range <= 40"
	}, "lowest"},
  {"Desperate Prayer", {
	  "spell(Desperate Prayer).cooldown",
	  "player.health <= 20" 
	}}, 
  {"Leap of Faith",{
       "lowest.health <= 20",
       "lowest.range <= 40"},
       "lowest"},

 --Attonement

   {"Shadow Word: Pain",{
      "!target.debuff(Shadow Word: Pain)",
      "target.health > 20"},
      "target"}, 
       --Shadow Word: Pain 589
   {"Holy Fire"},
   {"Smite"},	
   {"Penance"},

  --Mana

  {"Hymn of Hope",
      "player.mana <= 50"}, 
        --Hymn of Hope 64901 

},{

--Out of Combat 

  --Buffs

   {"Inner Fire",
     "!player.buff(Inner Fire)"}, 
       --Inner Fire 588
   {"Inner Focus",
      "!spell(Inner Focus).cooldown" }, 
       --Inner Focus
   {"Archangel", 
     "!player.buff(Evangelism).count = 5" },
       --Archangel/Evangelism
   {"Power Word: Fortitude",
     "!player.buff(Power Word: Fortitude)"}, 
       --Power Word: Fortitude 21562
 
   --Healing Rotation

   {"Power Word: Shield", {
	  "!lowest.debuff(Weakened Soul)",
	  "lowest.health <= 90",
	  "lowest.range <= 40"
	}, "lowest" },
  {"Renew", {
	  "!lowest.buff(Renew)", 
	  "lowest.health <= 85",
	  "lowest.range <= 40"
	}, "lowest"},
  {"Greater Healing", {
	  "lowest.health <= 60",
	  "lowest.range <= 40"
	}, "lowest"},
  {"Penance", {
	  "lowest.health <= 70",
	  "!spell(penance).cooldown",
	  "lowest.range <= 40"
	}, "lowest"},
  {"Flash Heal", {
	  "lowest.range <= 40",
	  "lowest.health <= 80" 
	}, "lowest" },
  {"Binding Heal", {
	  "lowest.range <= 40",
	  "lowest.health <= 60"
	}, "lowest"},
  {"Desperate Prayer", {
	  "!spell(Desperate Prayer).cooldown",
	  "player.health <= 20" 
	}}, 


  --Mana

   {"Hymn of Hope",
     "player.mana <= 50"}, 
       --Hymn of Hope 64901

})
]]