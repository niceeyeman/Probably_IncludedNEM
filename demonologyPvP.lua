-- SPEC ID 266
ProbablyEngine.rotation.register_custom(266, "NEM solo-pvp", 
{
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

  { "Dark Intent", "!player.buff(Dark Intent)" },
  { "Curse of the Elements", "!target.debuff(Curse of the Elements)" },


  -- Cooldowns
  { "Summon Doomguard", "modifier.cooldowns" },

  -- Rotation
  { "Command Demon", "pet.energy > 60" },

  -- Metamorphosis Rotation
  {{
    { "Immolation Aura", "modifier.multitarget" },
    { "Dark Soul: Knowledge", "modifier.cooldowns" },
    { "Corruption", "target.debuff(Corruption).duration < 10" },
    { "Soul Fire", "player.buff(Molten Core)" },
    { "!/cancelaura Metamorphosis", {
      "player.demonicfury < 100",
      "!player.buff(Dark Soul: Knowledge)"
    }},
    { "Void Ray", "modifier.multitarget" },
    { "Shadow Bolt" },
  }, "player.buff(Metamorphosis)" },

  -- Regular Rotation
  {{
    { "Life Tap", {
      "player.mana < 40",
      "player.health > 70"
    }},
    { "Corruption", "!target.debuff(Corruption)" },
    { "Metamorphosis", "player.demonicfury > 900" },
    { "Hand of Gul'dan", "!target.debuff(Shadowflame)" },
    { "Soul Fire", "player.buff(Molten Core)" },
    { "Harvest Life", "modifier.multitarget" },
    { "Shadow Bolt" }
  }, "!player.buff(Metamorphosis)" },

},
{
	{"demonic leap",
		{	"player.moving",
			"!target.exists"
		},
	},
    { "!/cancelaura Metamorphosis", 
		{	"player.moving",
			"!target.exists"
		}
	},
	
}
)