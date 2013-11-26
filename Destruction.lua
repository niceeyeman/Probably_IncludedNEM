-- ProbablyEngine Rotation Packager
-- Custom Destruction Warlock Rotation
-- Created on Nov 25th 2013 9:32 pm
ProbablyEngine.rotation.register_custom(267, "Included[NEM]", {

  { "109773", "!player.buff(109773)" },			        --Dark Intent
  { "1490", "!target.debuff(1490)" },					--Curse of the Elements

  -- Cooldowns
  { "113858", "modifier.cooldowns" },					--Dark Soul: Instability
  { "18540", "modifier.cooldowns" },					--Summon Doomguard

  -- Rotation
  { "348", "target.debuff(348).duration <= 4" },		--Immolate
  { "17877", "target.health <= 20" },					--Shadowburn
  { "29722", "player.buff(117896)" },					--Incinerate with Proc
  { "17962" },											--Conflagrate
  { "5740", "modifier.shift", "ground" },				--Rain of Fire
  { "116858", "!modifier.control" },					--Chaos Bolt
  { "29722"}											--Incinerate (filler)


})