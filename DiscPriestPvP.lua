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


ProbablyEngine.rotation.register_custom(256, "NEM Solo-PvP", 
{
		
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
	-- {"Arcane Torrent","target.range <= 8"}, --untested
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
	--[[
	{"Gift of the Naaru",
		{	"!modifier.last"
			,"player.health <= 80"
		}
	},
	]]
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
-- Racials end
	
--In Combat Buffs
	--Inner Fire 588 lvl 9
	{"588", "!player.buff(588)"},        			
	--Inner Focus 89485 lvl 36
	{"89485"},  									
	--Archangel 81700 lvl 50
	{"81700", "player.buff(Evangelism).count=5"},	
	--Power Word: Fortitude 21562 lvl 22
	{"21562","@nemcommon.tenStam"}, 				
	--Power Word: Shield 17/Weakened Soul 6788 lvl 5
	{"17", "!player.debuff(6788).any"}, 					
	--Fear Ward 6346 lvl 54
	{"6346", "!player.buff(6346)"}, 					
	--Renew 139 lvl 26 if NO PW:S but Debuff up
	{"139",											
		{	"!player.buff(17)",
			"player.debuff(6788).any"
		}
	},
	
--Survival
	--Pain Suppression 33206 lvl 58
	{"33206", 
		{	"!player.buff(33206)",
			"player.health <= 80"
		}
	},  						
	--Prayer of Mending 33076 lvl 68
	{"33076", "!player.buff(33076)","player"}, 				
	--Renew 139 lvl 26 < 95%
	{"139", 
		{	"!player.buff(139)",
			"player.health <= 95"
		}
	},						
	--Flash Heal 2061 lvl 7 < 50%        
	{"2061", "player.health <= 50"}, 
	--Purify Self 527 lvl 22
	{"527", "player.dispellable(527)","player"},
	-- Fade 586 vs npc
	{"586", 
		{	"!target.isPlayer",
			"player.threat >= 95"
		}
	},

--Pop Their Bubble
    --Dispel Magic 528 lvl 26 if target has PW:S
	{ "Dispel Magic", "target.buff(Power Word: Shield)", "target" },
	
--Dispel Any Magic Buff if Button ON
    --Dispel Magic 528
	{ "528", 
		{	"target.dispellable(528)",
			"toggle.dispelmagic"
		},"target" 
	},

--Mana
	--Mindbender 123040 lvl 45 Talent 
	{"Mindbender"},
	--Shadowfiend 34433 lvl 42 
	{"Shadowfiend"},
	
--Survival Aoe's
	-- Psychic Scream 8122
	{ "8122", 
		{	"!target.immune.fear",
			"target.range <= 8"
		}
	},
    --Psyfiend 108921   
	{"Psyfiend","modifier.cooldown","ground"}, 
         
    { --DPS WILL NOT FIRE IF TARGET CAN'T BE HURT	
		{ -- Rotation Nesting start
			-- *** Standard Rotation ***
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
		}, -- ** End of Rotation
			{								--Don't waste mana 
				"!target.immune.all",		--Can't touch this!
				"!target.buff(122464.any)", -- Dematerialize 
				"!target.buff(122470).any", -- touch of karma
			}
	}, -- ** End of Immune checks **    
      
},{

--Out of Combat 


	-- Buffs
		--Inner Fire 588 lvl 9
		{"Inner Fire", "!player.buff(Inner Fire)"},        			
		--Inner Focus 89485 lvl 36
		{"Inner Focus"},  									
		--Archangel 81700 lvl 50
		{"Archangel", "player.buff(Evangelism).count=5"},	
		--Power Word: Fortitude 21562 lvl 22
		{"21562","@nemcommon.tenStam"}, 				
 
	--Healing Rotation
		--Power Word: Shield 17/Weakened Soul 6788 lvl 5
		{"Power Word: Shield", 
			{	"!lowest.debuff(6788).any", 					
				"lowest.health <= 90",
				"lowest.spell(17).range"
			}, "lowest" 
		},
		-- Renew 139 lvl 26
		{"Renew", 
			{	"!lowest.buff(Renew)", 
				"lowest.health <= 90",
				"lowest.spell(139).range" 
			},	"lowest"
		},
		-- Flash Heal 2061 lvl 7
		{"Flash Heal", 
			{	"lowest.range <= 40",
				"lowest.health <= 20" 
			},	"lowest" 
		},
		-- Binding Heal 32546 lvl 48
		{"Binding Heal", 
			{	"!lowest.player",
				"lowest.spell(32546).range",
				"lowest.health <= 40" 
			},	"lowest"
		},

	--Mana
		--Hymn of Hope 64901 
		{"Hymn of Hope","player.mana <= 50"}, 
		-- Auto Target Enemy 
	{ "!/targetenemy","!target.alive"}, 
	{ "!/targetenemy","!target.enemy"}, 
	{ "!/targetenemy","!target.exists"}, 
	
    --Shadow Word: Pain 589 lvl 3
	{"589", 		
		{	"target.spell(589).range",
			"target.exists",
			"target.enemy",
		},"target"
	},			
       
}, function()
ProbablyEngine.toggle.create('dispelmagic', 'Interface\\Icons\\spell_nature_nullifydisease', 'Auto Dispel Magic', 'Automatically dispel any magic buffs')
end)