-- General Info
name = "Golden Spear, TEST!"
description = [[A golden spear with more durability and damage (configurable). Original mod developed by "Black Mirror".






♦ Visit the workshop page to view the latest patch notes.
♦ If you want to report bugs or other issues, please create a discussion on the workshop page or create an issue on the Github repo.
♦ Feel free to comment about your suggestions or questions on the workshop page!

Hope you enjoy this mod and thanks for using it ♥
v1.4.0 - 8/26/2021]]
author = "PunchablePlushie"
version = "1.4.0"
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
    hover = "The number of uses a golden spear has.",
    options = {
      {description = "Single Use", data = 1, hover = "The spear can only be used once and it'll break after a single use."},
      {description = "150", data = 150, hover = "This is the same number of uses as a flint spear."},
      {description = "200", data = 200, hover = "This is the same number of uses as Wigfrid's spear."},
      {description = "250", data = 250, hover = "This is the default value."},
      {description = "300", data = 300, hover = "The spear is extra durable."},
      {description = "400", data = 400, hover = "x4 times more uses, just like other golden tools."},
      {description = "Unbreakable", data = -1, hover = "The spear has infinite uses."},
    },
    default = 250,
  },

  -- Damage
  {
    name = "damage",
    label = "Damage",
    hover = "The amount of extra damage a golden spear deals compared to a flint spear.",
    options = {
      {description = "0%", data = 1, hover = "No extra damage so the spear deals the same damage as a flint spear."},
      {description = "5%", data = 1.05, hover = "5% more damage than a flint spear. This is the default value."},
      {description = "10%", data = 1.1, hover = "10% more damage than a flint spear."},
      {description = "15%", data = 1.15, hover = "15% more damage than a flint spear."},
      {description = "20%", data = 1.2, hover = "20% more damage than a flint spear."},
      {description = "25%", data = 1.25, hover = "25% more damage which is the same damage as Wigfrid's spear."},
      {description = "One Shot", data = -1, hover = "The spear one shots all mobs."},
    },
    default = 1.05,
  },

  -- Crafting Cost
  {
    name = "crafting_cost",
    label = "Crafting Cost",
    hover = "The crafting cost modifier for making a golden spear.",
    options = {
      {description = "Free", data = 0, hover = "Crafting a golden spear doesn't consume any resources."},
      {description = "-50%", data = 0.5, hover = "Golden spear is 50% cheaper."},
      {description = "0%", data = 1, hover = "No modifier. Default value."},
      {description = "+50%", data = 1.5, hover = "Golden spear is 50% more expensive."},
      {description = "+100%", data = 2, hover = "Golden spear is 100% more expensive."},
      {description = "+150%", data = 2.5, hover = "Golden spear is 150% more expensive."},
      {description = "+200%", data = 3, hover = "Golden spear is 200% more expensive."},
      {description = "Unreasonable", data = -1, hover = "Golden spear requires a full stack of each ingredient."},
    },
    default = 1,
  },
}