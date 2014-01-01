-- ProbablyEngine Rotation Packager
-- Custom Enhancement Shaman Rotation
-- Created on Nov 20th 2013 6:12 pm
-- Mavmins Enhancement with Purge added

ProbablyEngine.rotation.register_custom(263, "Mavmins with Purge [NEM]", {

-- Buffs
	{ "8238", "!player.enchant.mainhand" }, --Windfury
	{ "8024", "!player.enchant.offhand" }, --Flametounge
	{ "324", "!player.buff(324)" }, --Lightning Shield
	
	--Utility Interrupt
	
	--Wind Shear
	 { "57994", {
	 		"player.spell(57994).exists",
			"modifier.interrupts"},
			"target" },
			
	
	--Healing / Survival 
	
	--Healthstone
	{"#5512", "player.health < 45"},
			
	--Draenei: Gift of the Naaru
	{ "59544", {
		"player.spell(59544).exists",
			"toggle.healing",
			"!player.buff(59544)",
			"player.health < 71"}},
	
	--Astral shift
	{ "108271", {
		"player.spell(108271).exists",
			"toggle.healing",
			"!player.buff(108271)",
			"!player.buff(30823)",
			"player.health < 51"}},
	
	--Shamanistic Rage----
	{ "30823", {
	 		"player.spell(30823).exists",
			"!player.buff(108271)",
			"toggle.healing",
			"!player.buff(30823)",
			"player.health < 56"}},
		
	--Healing Stream Totem
	{ "5394", {
	 		"player.spell(5394).exists",
			"!player.totem(5394)",
			"!player.totem(108280)",
			"toggle.healing",
			"player.health < 74"}},
	
	--Healing Tide Totem----
	{ "108280", {
	 		"player.spell(108280).exists",
			"!player.totem(108280)",
			"toggle.healing",
			"player.health < 40"}},
		
	--Healing Surge----
	{ "8004", {
	 		"player.spell(8004).exists",
			"player.mana >= 30",
			 "toggle.healing",
			"toggle.healing",
			"player.health < 60"}},
		
	--Stone Bulwark Totem
	{ "108270", {
			"player.spell(108270).exists",
			"toggle.healing",
			"!player.totem(108270)",
			"player.health < 90"}},
		
	
	--Cleanse Spirit
	--Cleanse Spirit Mouseover
	--Purge
	--Pop Their Bubble
    --Purge 370 lvl 12 if target has PW:S
	{ "370", {
		"player.spell(370).exists",
		"target.spell(370).range", 
		"target.buff(Power Word: Shield)"}, 
		"target" },
	
--Dispel Any Magic Buff if Button ON
    --Purge 370 lvl 12
	{ "370", {
		"player.spell(370).exists",
		"target.spell(370).range",
		"target.dispellable(370)",
		"toggle.dispelmagic"},
		"target" }, 
		
	-- Cooldowns
	{{
	--stormlash_totem,if=!active&!buff.stormlash.up&(buff.bloodlust.up|time>=60)
	{ "120668", {
	 		"player.spell(120668).exists",
			"target.range <= 5",
			"!player.buff(120676)",
			"@mavmins.heroism"}},
		
	--virmens_bite_potion,if=time>60&(pet.primal_fire_elemental.active|pet.greater_fire_elemental.active|target.time_to_die<=60)
	--{"#76089", {
	--	"player.totem(2894)",
	--	"!player.buff(105697",
	--	"@mavmins.virmenPotion"}},
	
	{"!/run UseItemByName(76089)", {
		"player.totem(2894)",
		"!player.buff(105697)",
		"@mavmins.virmenPotion"}},
		
	--{"#76089", "target.ttd <= 60"},
	
	--blood_fury
	{ "33697", { 
		"player.spell(33697).exists",
		"!player.buff(33697)"}},
	
	--berserking
	{ "26297", { 
		"player.spell(26297).exists",
		"!player.buff(26297)"}},
		
	--elemental_mastery,if=talent.elemental_mastery.enabled&(talent.primal_elementalist.enabled&glyph.fire_elemental_totem.enabled&(cooldown.fire_elemental_totem.remains=0|cooldown.fire_elemental_totem.remains>=80))
	{ "16166", { 
		"player.spell(16166).exists",
		"player.spell(117013).exists",
		"player.glyph(217)",
		"player.spell(2894).cooldown = 0"}},
	
	{ "16166", { 
		"player.spell(16166).exists",
		"player.spell(117013).exists",
		"player.glyph(217)",
		"player.spell(2894).cooldown > 79"}},
	
	--elemental_mastery,if=talent.elemental_mastery.enabled&(talent.primal_elementalist.enabled&!glyph.fire_elemental_totem.enabled&(cooldown.fire_elemental_totem.remains=0|cooldown.fire_elemental_totem.remains>=50))
	{ "16166", { 
		"player.spell(16166).exists",
		"player.spell(117013).exists",
		"!player.glyph(217)",
		"player.spell(2894).cooldown = 0"}},
	
	{ "16166", { 
		"player.spell(16166).exists",
		"player.spell(117013).exists",
		"!player.glyph(217)",
		"player.spell(2894).cooldown > 49"}},
	
	--elemental_mastery,if=talent.elemental_mastery.enabled&!talent.primal_elementalist.enabled
	{ "16166", {
		"!player.spell(117013).exists",
		"player.spell(16166).exists"}},
	
	--gloves
	{"!/run UseInventoryItem(10)", {
		"@mavmins.Gloves",
		"!player.buff(96228)",
		"!player.totem(2894)",
		"target.exists"}},
		
	--lifeblood
	{ "121279", "player.spell(121279).exists"},
		
	--fire_elemental_totem,if=!active
	{ "2894", {
	 		"player.spell(2894).exists",
			"!player.totem(2894)"}},
	
	--ascendance,if=cooldown.strike.remains>=3
	{ "114049", { 				
	 		"player.spell(114049).exists",
			"!player.buff(114051)",
			"player.spell(17364).cooldown > 2"}},
	
	{ "114049", { 				
	 		"player.spell(114049).exists",
			"player.totem(2894)",
			"!player.buff(114051)"}},
		
	}, "modifier.cooldowns"},

	-- AoE Rotation
	{{
	--fire_nova,if=active_flame_shock>=4
	{ "1535", {
	 		"player.spell(1535).exists",
			"!@mavmins.oneTarget",
			"target.debuff(8050)"}},
	
	--magma_totem,if=active_enemies>5&!totem.fire.active
	{ "8190", {
	 		"player.spell(8190).exists",
			"@mavmins.magmaTotem" }},
		
	--searing_totem,if=active_enemies<=5&!totem.fire.active
	{ "3599", {
	 		"player.spell(3599).exists",
			"@mavmins.SearingTotem" }},
	
	--flame_shock,cycle_targets=1,if=!ticking
	{ "8050", {
	 		"player.spell(8050).exists",
			"!target.debuff(8050)"}}, 
	
	--lava_lash,if=dot.flame_shock.ticking
	{ "60103", {
		 	"player.spell(60103).exists",
			"target.debuff(8050)" }}, 
	
	--elemental_blast,if=talent.elemental_blast.enabled&buff.maelstrom_weapon.react>=1
	{ "117014", { 
		"player.spell(117014).exists",
		"target.range <= 40",
		"!player.moving",
		"player.buff(53817).count >= 1"}}, 
			
	-- elemental blast Moving Spiritwalkers Grace	
	{ "117014", { 
		"player.spell(117014).exists",
		"target.range <= 40",
		"player.moving",
		"player.buff(79206)",
		"player.buff(53817).count >= 1"}}, 
		
	--elemental blast MOVING 5 Maelstrom so instant cast		
	{ "117014", { 
		"player.spell(117014).exists",
		"target.range <= 40",
		"player.moving",
		"player.buff(53817).count = 5"}},
	
	--chain_lightning,if=active_enemies>=2&buff.maelstrom_weapon.react>=3
	
	{ "421", { 
	 	"player.spell(421).exists",
		"target.spell(421).range",
		"!player.moving",
		"player.buff(53817).count >= 3"}},
		
	{ "421", { 
	 	"player.spell(421).exists",
		"target.spell(421).range",
		"player.moving",
		"player.buff(79206)",
		"player.buff(53817).count >= 3"}},
		
	{ "421", { 
	 	"player.spell(421).exists",
		"target.spell(421).range",
		"player.moving",
		"player.buff(53817).count = 5"}},
		
	--unleash_elements
	{ "73680", {
	 	"player.spell(73680).exists",
		"target.spell(73680).range"}},
	
	--stormblast
	{ "115356", {
	 	"player.spell(115356).exists",
		"target.spell(115356).range",
		"player.buff(114049)"}}, 
	
	--chain_lightning,if=active_enemies>=2&buff.maelstrom_weapon.react>=1
	
	{ "421", {
	 	"player.spell(421).exists",
		"target.spell(421).range",		
		"player.buff(53817).count >= 1"}},
	
	{ "421", { 
	 	"player.spell(421).exists",
		"target.spell(421).range",
		"!player.moving",
		"player.buff(53817).count >= 1"}},
		
	{ "421", { 
	 	"player.spell(421).exists",
		"target.spell(421).range",
		"player.moving",
		"player.buff(79206)",
		"player.buff(53817).count >= 1"}},
		
	--stormstrike
	{ "17364", {
	 	"player.spell(17364).exists",
		"target.spell(17364).range"}}, 
	
	--earth_shock,if=active_enemies<4
	{ "8042", {
	 	"player.spell(8042).exists",
		"target.spell(8042)range",
		"!@mavmins.sixTarget"}},
			
	--feral_spirit
	{ "51533",{
	 	"player.spell(51533).exists",
		"target.range <= 5"}}, 
	
	--earth_elemental_totem,if=!active&cooldown.fire_elemental_totem.remains>=50
	{ "2062", {
	 	"player.spell(2062).exists",
		"target.range <= 25",
		"!player.totem(2062)",
		"!player.totem(2894)",
		"player.spell(2894).cooldown >= 60"}}, 
		
	--spiritwalkers_grace,moving=1
	{ "79206",{
	 	"player.spell(79206).exists",
		"player.moving"}}, 
	
	}, "modifier.multitarget"},
	

    -- Rotation
	{{
		--spirit walk target > 15 yds
		{ "58875", {
	 	"player.spell(58875).exists",
		"target.range >= 15"}}, 
		
		--searing totem
		{ "3599", {
	 	"player.spell(3599).exists",
		"@mavmins.SearingTotem"}},
		
		--Gloves
		--{"#gloves", {
		--	"player.spell(110403).exists",
		--	"target.exists"}},
			
		--{"!/run UseInventoryItem(10)", {
		--	"@mavmins.Gloves",
		--	"!player.buff(96228)",
		--	"!player.totem(2894)",
		--	"target.exists"}},
		
		--unleash_elements,if=(talent.unleashed_fury.enabled|set_bonus.tier16_2pc_melee=1)
		{ "73680", {
			"player.spell(73680).exists",
			"target.spell(73680).range",
			"player.spell(117012).exists"}},
			
		{ "73680", {
			"player.spell(73680).exists",
			"target.spell(73680).range",
			"@mavmins.t16_2pc"}},		
		
		--elemental_blast,if=talent.elemental_blast.enabled&buff.maelstrom_weapon.react>=1 - NOT MOVING
		{ "117014", { 
			"player.spell(117014).exists",
			"target.range <= 40",
			"!player.moving",
			"player.buff(53817).count >= 1"}}, 
			
		 --elemental blast Moving Spiritwalkers Grace	
		{ "117014", { 
			"player.spell(117014).exists",
			"target.spell(117014).range",
			"player.moving",
			"player.buff(79206)",
			"player.buff(53817).count >= 1"}}, 
		
		--elemental blast MOVING 5 Maelstrom so instant cast		
		{ "117014", { 
			"player.spell(117014).exists",
			"target.spell(117014).range",
			"player.moving",
			"player.buff(53817).count = 5"}}, 
		
		--lightning_bolt,if=buff.maelstrom_weapon.react=5		
		{ "403", { 
			"target.spell(403).range",
			"player.buff(53817).count = 5" }}, 
			
		--feral_spirit,if=set_bonus.tier15_4pc_melee=1	
		{ "51533", {
			"player.spell(51533).exists",
			"target.range <= 5",
			"@mavmins.t15_4pc"}}, 
			
		--Stormblast (stormstrike during ascendence)	
		{ "115356", {
			"player.spell(115356).exists",
			"target.spell(115356).range",
			"player.buff(114049)"}}, 
					
		--Stormstrike	
		{ "17364", {
			"player.spell(17364).exists",
			"target.spell(17364)range"}}, 
		
		--flame_shock,if=buff.unleash_flame.up&!ticking		
		{ "8050",{  
			"player.spell(8050).exists",
			"target.spell(8050).range",
			"player.buff(73683)", 
			"!target.debuff(8050)"}},
			
		--Lavalash		
		{ "60103", {
			"player.spell(60103).exists",
			"target.spell(60103).range"}}, 
			
		--lightning_bolt,if=set_bonus.tier15_2pc_melee=1&buff.maelstrom_weapon.react>=4&!buff.ascendance.up		
		{ "403", { 
			"target.spell(403).range",
			"@mavmins.t15_2pc",
			"player.buff(53817).count >= 4",
			"!player.buff(114049)"}},
				
		--flame_shock,if=(buff.unleash_flame.up&(dot.flame_shock.remains<10|set_bonus.tier16_2pc_melee=0))|!ticking
		{ "8050",{ 
			"player.spell(8050).exists",
			"target.spell(8050).range",
			"player.buff(73683)", 
			"target.debuff(8050).duration < 10"  }}, 
			
		{ "8050",{ 
			"player.spell(8050).exists",
			"target.spell(8050).range",
			"player.buff(73683)", 
			"!@mavmins.t16_2pc"  }}, 
			
		{ "8050",{ 
			"player.spell(8050).exists",
			"target.spell(8050).range",
			"!target.debuff(8050)"  }}, 
			
		--unleash_elements
		{ "73680", {
			"player.spell(73680).exists",
			"target.spell(73680).range"}},
		
		--frost_shock,if=glyph.frost_shock.enabled&set_bonus.tier14_4pc_melee=0
		{ "8056", {
			"target.spell{8056}.range",
			"player.spell{8056}.exists",
			"@mavmins.frostShockglyph"}},
		
		--lightning_bolt,if=buff.maelstrom_weapon.react>=3&!buff.ascendance.up
		{ "403", { 
			"target.range <= 30",
			"player.buff(53817).count >= 3",
			"!player.buff(114049)"}},
			
		--ancestral_swiftness,if=talent.ancestral_swiftness.enabled&buff.maelstrom_weapon.react<2
		{ "16188", { 
			"target.range <= 25",
			"player.spell(16188).exists",
			"player.buff(53817).count < 2"}},
			
		--lightning_bolt,if=buff.ancestral_swiftness.up
		{ "403", { 
			"target.spell(403).range",
			"player.spell(403).exists",
			"player.buff(16188)" }},
		
		--earth_shock,if=(!glyph.frost_shock.enabled|set_bonus.tier14_4pc_melee=1)
		{ "8042", {
			"player.spell(8042).exists",
			"target.spell(8042).range",
			"!@mavmins.frostShockglyph"}},
		
		--feral_spirit
		{ "51533", {
			"player.spell(51533).exists",
			"target.range <= 5"}}, 
			
		--earth_elemental_totem,if=!active
		{ "2062", {
			"player.spell(2062).exists",
			"target.range <= 25",
			"!player.totem(2062)",
			"!player.totem(2894)",
			"player.spell(2894).cooldown > 60"}}, 
		
		--spiritwalkers_grace,moving=1
		{ "79206", {
			"player.spell(79206).exists",
			"player.moving"}}, 
		
		--lightning_bolt,if=buff.maelstrom_weapon.react>1&!buff.ascendance.up
		{ "403", { 
			"target.spell(403).range",
			"player.buff(53817).count > 1",
			"!player.spell(403).casting",
			"!player.spell(117014).casting",
			"player.spell(73680).cooldown >= 1.5",
			"player.spell(17364).cooldown >= 1.5",
			"player.spell(8050).cooldown >= 1.5",
			"player.spell(60103).cooldown >= 1.5",
			"!player.buff(114049)"}},
		
		--Primal Strike 73899 lvl 3
		{"73899", {
			"player.spell(73899).exists",
			"target.spell(73899)range"}},
			
		--Lightning Bolt moving
		{"403","target.spell(403).range"},
	}, {"!modifier.multitarget", "@mavmins.oneTarget"}},
	

}, {
  -- Buffs
  { "Windfury Weapon", "!player.enchant.mainhand" },
  { "Flametongue Weapon", "!player.enchant.offhand" },
  { "Lightning Shield", "!player.buff(Lightning Shield)" },
  --AutoAttack
	--Flame Strike
		{ "8050",{ 
			"player.spell(8050).exists",
			"target.spell(8050).range",
			"target.exists",
			"target.enemy",
			"!target.debuff(8050)"},"target"}, 
	-- LB		
		{"403", { 
		"target.spell(403).range",
		"target.enemy",
		"target.exists"},"target"}, 
}, function()
	ProbablyEngine.toggle.create('healing', 'Interface\\Icons\\spell_nature_rejuvenation', 'Healing', 'Toggle Healing')
	ProbablyEngine.toggle.create('dispelmagic', 'Interface\\Icons\\spell_nature_nullifydisease', 'Auto Dispel Magic', 'Automatically dispel any magic buffs')
	end
)
