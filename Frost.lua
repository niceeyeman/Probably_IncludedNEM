-- ProbablyEngine Rotation Packager
-- Custom Frost Death Knight Rotation
-- Created on Dec 10th 2013 10:05 pm
-- SPEC ID 251
ProbablyEngine.rotation.register_custom(251, "Included_NEM", {

    -- Survival
    -- Death Pact Macro
    { "!/cast Raise Dead\n/cast Death Pact", {
      "player.health < 35",
      "player.spell(Death Pact).cooldown",
      "player.spell(Raise Dead).cooldown",
      "player.spell.usable(Death Pact)"
    }},
--Interupts
	{ "MindFreeze", "modifier.interrupts" },  --MindFreeze
	{ "Asphyxiate", { "player.spell(Asphyxiate).exists", "modifier.interrupts" }}, --Asphyxiate


    -- Keep up dots
	{ "Unholy Blight", { --Unh0lyBlight1
	"player.spell(Unholy Blight).exists",
	"modifier.multitarget",
	"target.range <= 8",
	}},
    { "Outbreak", "!target.debuff(Blood Plague)" },
    { "Outbreak", "!target.debuff(Frost Fever)" },
    { "Soul Reaper", "target.health < 30" },
    { "Plague Strike", "!target.debuff(Blood Plague)" },
	{"Howling Blast", "!target.debuff(Frost Fever)"},
	{ "Obliterate", "player.buff(Freezing Fog)" },
    { "Howling Blast", "player.buff(Rime)" },
    { "Obliterate", "player.buff(Killing Machine)" },
    { "Frost Strike"},
    { "Obliterate" },
    { "Howling Blast", "player.runes(frost) = 2" },
    { "Horn of Winter" },

  }
)