ProbablyEngine.rotation.register_custom(258, "NEM Solo-PvP", 
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
			"!target.debuff(8122)",
			"!modifier.last"
		}
	}, --untested
		-- Lifeblood on CD for haste	
	{"/run CastSpellByName('Lifeblood')",
		{	"player.spell(lifeblood).cooldown = 0",
			"target.ttd >= 14"
		}
	},

-- Racials end	

	-- Antipurging Buffing.
	-- Inner fire lvl 9
	{"588", "!player.buff(588)"},
	-- PW fort lvl 22
	{"21562", "!player.buffs.stamina"},
	-- Fear Ward 6346
	{"6346", "!player.buff(6346)"}, 					
	-- PW Shield when no debuff 6788
	{"17", "!player.debuff(6788).any"},
	{"!17", 
		{	"!player.debuff(6788).any",
			"player.health <= 99",
			(function() 
			if UnitChannelInfo("player") ~= nil then return true end 
			end )
		}
	}, 
	
	--Renew 139 lvl 26 if NO PW:S but Debuff up
	{"139",											
		{	"!player.buff(17)",
			"player.debuff(6788).any"
		}
	},
		
	-- Defensive Abilities, just for when things go Oh-shit!
	-- Healthstone
	{"#5512", "player.health <= 40"},
	-- Vampiric Embrace lvl 78
	{"15286", "player.health <= 40", "player"},
	--Desperate Prayer Talent lvl 60
	{"19236", "player.health <= 40"},
	-- Dispersion lvl 60
	{"47585", "modifier.rshift"},
	-- Mass Dispel lvl 72
	{"32375", "modifier.ralt", "ground"},
	-- Renew 139 < 95%
	{"139",
		{	"player.health <= 95",
			"!modifier.last",
			"!player.buff(139)"
		}
	},
	-- Flash Heal < 50%
	{"2061", "player.health <= 50"},
	-- Fade 586 vs npc
	{"586", 
		{	"!target.isPlayer",
			"player.threat >= 95"
		}
	},
	
	-- Available Cooldowns
	{{
		-- Power infusion lvl 75 talent
		{"10060"},
		{"#gloves"}
	}, {"modifier.cooldowns"}},
	
	-- Shadow AoE; Mind Sear it.
	{"48045", "modifier.lshift"},
	
	-- Automated Level 90 Talent abilities can be...bad.. Toggle it!
	-- Halo lvl 90 Talent
	{"120644","modifier.lalt"},
	-- Cascade lvl 90 Talent
	{"121135", "modifier.lalt"},
	-- divine Star 
	{"110744", "modifier.lalt"},

--Pop Their Bubble
    --Dispel Magic 528 lvl 26 if target has PW:S
	{ "528", "target.buff(17)", "target" },
	
--Dispel Any Magic Buff if Button ON
    --Dispel Magic 528
	{ "528", 
		{	"target.dispellable(528)",
			"toggle.dispelmagic"
		},"target" 
	},
	-- Silence 15487 lvl 52
	{ "15487","!target.immune.silence"},
	
--Mana
	--Mindbender 123040 lvl 45 Talent 
	{"Mindbender"},
	--Shadowfiend 34433 lvl 42 
	{"Shadowfiend"},

	-- Psychic Scream 8122 when not stunned from War Stomp
	{ "8122", 
		{	"!target.immune.fear",
			"!target.debuff(20549)",
			"target.range <= 8"
		}
	},
	-- Void Tendrils if Psychic Scream cooldown > 10s & Not Feared
	{ "108920",
		{	"target.range <= 8",
			"player.spell(8122).cooldown >= 10",
			"!target.debuff(8122)"
		}
	},
	--[[ Preempt when channeling
		{"!spell",(function() 
			if UnitChannelInfo("player") ~= nil then return true end 
			end )
		},
	]]
	
    { --DPS WILL NOT FIRE IF TARGET CAN'T BE HURT	
		{ -- Rotation Nesting start
			-- *** Standard Rotation ***
			-- Devouring Plague 2944 lvl 21 with 3 orbs
			{"!2944","player.shadoworbs = 3"},
			{"!2944", 
				{	"player.shadoworbs = 3",
					(function() 
					if UnitChannelInfo("player") ~= nil then return true end 
					end )
				}
			}, 
			--Mind Spike 73510 lvl 44 IF From Darkness, Comes Light(45 talent) proc'd 87160
			{"73510","player.buff(87160)"},
			{"!73510",
				{	"player.buff(87160)",
					(function() 
					if UnitChannelInfo("player") ~= nil then return true end 
					end )
				}
			},
			-- Dot target
			-- Shadowfiend 34433
			{"34433"},
			-- SW: Pain 589 lvl 3
			{"589", "!target.debuff(589)"},
			{"589", 
				{	"modifier.multitarget",
					"mouseover.spell(589).range",
					"!mouseover.debuff(589)",
					"mouseover.enemy"
				},"mouseover"
			},
			-- Vampiric Touch 34914 lvl 28
			{"34914", "!target.debuff(34914)"}, 
			{"34914", 
				{	"modifier.multitarget",
					"mouseover.spell(34914).range",
					"!mouseover.debuff(34914)",
					"mouseover.enemy"
				},"mouseover"
			},
		
			-- Mind Blast 8092 lvl 21
			{"8092"},
			{"!8092",(function() 
				if UnitChannelInfo("player") ~= nil then return true end 
				end )
			},
			-- Dot target if < 3
			{"589","target.debuff(589).duration < 3"},
			{"15286","target.debuff(15286).duration < 3"},
			{"!589", 
				{	"target.debuff(589).duration < 3",
					(function() 
					if UnitChannelInfo("player") ~= nil then return true end 
					end )
				}
			}, 
			{"!15286", 
				{	"target.debuff(15286).duration < 3",
					(function() 
					if UnitChannelInfo("player") ~= nil then return true end 
					end )
				}
			}, 
			-- Shadow Word: Death 32379 lvl 46
			{"32379"},
			{"!32379",(function() 
				if UnitChannelInfo("player") ~= nil then return true end 
				end )
			},
			-- Mind Flay 15407 lvl 10if dotted with Devouring Plague
			-- TODO check for Solace and Insanity
			{"15407",
				{	"target.debuff(15286)",
					"player.spell(8092).cooldown >= 1",
					"target.debuff(589).duration >= 3"
				}
			},
			{"15407",
				{	"player.level >= 21",
					"player.spell(8092).cooldown >= 1",
					"target.debuff(589).duration >= 3"
				}
			},
			{"15407","player.level <= 20"},
		},
		{								--Don't waste mana 
			"!target.immune.all",		--Can't touch this!
			"!target.buff(122464.any)", -- Dematerialize 
			"!target.buff(122470).any", -- touch of karma
		}
	},     
	
}, 
{	-- *** OOC ***
	-- Inner fire lvl 9
	{"588", "!player.buff(588)"},
	-- PW fort lvl 22
	{"21562", "!player.buffs.stamina"},
	-- Shadowform lvl 24
	{"15473", "!player.buff(15473)"},
	
	-- Body and Soul; Activate on movement when talented
	{"17", 
		{	"player.moving",
			"player.spell(64129).exists"
		}
	},
	-- PW Shield when no debuff 6788 IF PvP Flagged
	{"17", 
		{	"!player.debuff(6788).any"	,
			(function() 
			if UnitIsPVP("player") == 1 then return true end 
			end )
		}
	},
	-- Renew < 95%
	{"139",
		{	"player.health <= 95",
			"!modifier.last",
			"!player.buff(139)"
		}
	},
	-- Flash Heal < 50%
	{"2061", "player.health <= 50","player"},
	
	--Auto attack
	-- SW: Pain 589 lvl 3
	{"589",
		{	"target.spell(589).range",
			"target.exists",
			"target.enemy",
		},"target"
	},	
	
	{"589", 
		{	"modifier.multitarget",
			"modifier.lalt",
			"mouseover.spell(589).range",
			"!mouseover.debuff(589)",
			"mouseover.enemy"
		},"mouseover"
	},
	{"34914", 
		{	"modifier.multitarget",
			"modifier.lalt",		
			"mouseover.spell(34914).range",
			"!mouseover.debuff(34914)",
			"mouseover.enemy"
		},"mouseover"
	},
  
	-- Auto Target Enemy 
	{ "/targetenemy","!target.alive"}, 
	{ "/targetenemy","!target.enemy"}, 
	{ "/targetenemy","!target.exists"}, 
	
}, function()
ProbablyEngine.toggle.create('dispelmagic', 'Interface\\Icons\\spell_nature_nullifydisease', 'Auto Dispel Magic', 'Automatically dispel any magic buffs')
end
)