-- Set up
TUNING.GOLDENSPEAR_USES = GetModConfigData("uses")

local configured_damage = GetModConfigData("damage")
if configured_damage == -1 then
	TUNING.GOLDENSPEAR_DAMAGE = 99999
else
	TUNING.GOLDENSPEAR_DAMAGE = TUNING.SPEAR_DAMAGE * configured_damage
end

local Ingredient = GLOBAL.Ingredient
local configured_cost = GetModConfigData("crafting_cost")
if configured_cost == 0 then
	TUNING.GOLDENSPEAR_COST = {}
elseif configured_cost == -1 then
	TUNING.GOLDENSPEAR_COST = {Ingredient("twigs", 40), Ingredient("rope", 20), Ingredient("goldnugget", 20)}
else
	TUNING.GOLDENSPEAR_COST = {
		Ingredient("twigs", 4 * configured_cost),
		Ingredient("rope", 2 * configured_cost),
		Ingredient("goldnugget", 2 * configured_cost)
	}
end

PrefabFiles = {
	"goldenspear",
}


-- Recipe Info
GLOBAL.STRINGS.NAMES.GOLDENSPEAR = "Sumptuous Spear"
GLOBAL.STRINGS.RECIPE_DESC.GOLDENSPEAR = "Use the pointy end like a badass."

AddRecipe("goldenspear", TUNING.GOLDENSPEAR_COST, GLOBAL.RECIPETABS.WAR,  GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/goldenspear.xml", "goldenspear.tex")


-- Quotes
local CHARACTER = GLOBAL.STRINGS.CHARACTERS
CHARACTER.GENERIC.DESCRIBE.GOLDENSPEAR = "It's pointy and pretty."
CHARACTER.WILLOW.DESCRIBE.GOLDENSPEAR = "It won't set my enemies on fire, but at least it's shiny."
CHARACTER.WOLFGANG.DESCRIBE.GOLDENSPEAR = "Fancy spear has better stab."
CHARACTER.WENDY.DESCRIBE.GOLDENSPEAR = "Now I can destroy worlds with style."
CHARACTER.WX78.DESCRIBE.GOLDENSPEAR = "GOLD SPEAR IS *MORE* DURABLE?"
CHARACTER.WICKERBOTTOM.DESCRIBE.GOLDENSPEAR = "The most malleable of metals, but let's see how this stabs."
CHARACTER.WOODIE.DESCRIBE.GOLDENSPEAR = "Shiny, but still not an axe."
CHARACTER.WAXWELL.DESCRIBE.GOLDENSPEAR = "I don't remember having this in vanilla."
CHARACTER.WEBBER.DESCRIBE.GOLDENSPEAR = "The pointy part is so pretty now."
CHARACTER.WINONA.DESCRIBE.GOLDENSPEAR = "Quite luxurious!"
CHARACTER.WATHGRITHR.DESCRIBE.GOLDENSPEAR = "Nöt as gööd as my spear."
CHARACTER.WORTOX.DESCRIBE.GOLDENSPEAR = "So shiny! Hyuyu!"
CHARACTER.WORMWOOD.DESCRIBE.GOLDENSPEAR = "Pretty sharp stick."
CHARACTER.WARLY.DESCRIBE.GOLDENSPEAR = "For gourmet kebab-ing."
CHARACTER.WURT.DESCRIBE.GOLDENSPEAR = "Maybe this can help with those tentacles."
CHARACTER.WALTER.DESCRIBE.GOLDENSPEAR = "But I was taught that gold is not suitable for something like this."

-- Tools Are Fuel mod support
local ModIndex = GLOBAL.KnownModIndex
local tools_are_fuel = "workshop-599498678"
TUNING.GOLDENSPEAR_ISFUEL = ModIndex:IsModEnabled(tools_are_fuel)