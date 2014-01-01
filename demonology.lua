-- SPEC ID 266
ProbablyEngine.rotation.register_custom(266, "NEM Group", 
{

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