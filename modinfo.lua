-- General Info
name = "Golden Spear, Reborn!"
description = "A golden spear with more durability and damage (configurable). Original mod developed by \"_Q_\"."
author = "PunchablePlushie"
version = "1.3.0"
forumthread = ""
server_filter_tags = {"golden spear, golden, spear, weapon, gold, crafting, PunchablePlushie"}


-- Mod Info
api_version = 10
priority = -1   -- Lower priorty to allow the Throwable Spears mod load first.
dst_compatible = true
all_clients_require_mod = true
client_only_mod = false


-- Icon
icon_atlas = "goldenspear.xml"
icon = "goldenspear.tex"


-- Config
configuration_options = {
  -- Uses
  {
    name = "uses",
    label = "Durability",
    hover = "By default, the golden spear has 300% more durability. Extra makes it 400% more durable (just like golden axe/pickaxe).",
    options = {
      {description = "Flint Spear", data = 1},
      {description = "Default", data = 2},
      {description = "Extra Durable", data = 3},
      {description = "Unbreakable", data = 4},
    },
    default = 2
  },

  -- Damage
  {
    name = "damage",
    label = "Damage",
    hover = "By default the golden spear deals 10% more damage. Extra Sharp makes it 20%.",
    options = {
      {description = "Flint Spear", data = 1},
      {description = "Default", data = 2},
      {description = "Extra Sharp", data = 3},
    },
    default = 2
  },

  -- Crafting Cost
  {
    name = "crafting_cost",
    label = "Crafting Cost",
    hover = "Cheap consumes 50% less resources. Expensive consumes 50% more and Extra Expensive consumes 100% more.",
    options = {
      {description = "Cheap", data = 1},
      {description = "Default", data = 2},
      {description = "Expensive", data = 3},
      {description = "Extra Expensive", data = 4},
    },
    default = 2
  },
}