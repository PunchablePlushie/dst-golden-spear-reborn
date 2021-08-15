-- Set up
local uses = {
    TUNING.SPEAR_USES,
    TUNING.SPEAR_USES * (TUNING.GOLDENTOOLFACTOR * 0.75),
    TUNING.SPEAR_USES * TUNING.GOLDENTOOLFACTOR,
    nil,
}
TUNING.GOLDENSPEAR_USES = uses[GetModConfigData("uses")]

local damage = {
    TUNING.SPEAR_DAMAGE,
    TUNING.SPEAR_DAMAGE * 1.1,
    TUNING.SPEAR_DAMAGE * 1.2,
}
TUNING.GOLDENSPEAR_DAMAGE = damage[GetModConfigData("damage")]

local Ingredient = GLOBAL.Ingredient
local crafting_cost = {
    {Ingredient("twigs", 2), Ingredient("rope", 1), Ingredient("goldnugget", 1)},
    {Ingredient("twigs", 4), Ingredient("rope", 2), Ingredient("goldnugget", 2)},
    {Ingredient("twigs", 6), Ingredient("rope", 3), Ingredient("goldnugget", 3)},
    {Ingredient("twigs", 8), Ingredient("rope", 4), Ingredient("goldnugget", 4)},
}
TUNING.GOLDENSPEAR_COST = crafting_cost[GetModConfigData("crafting_cost")]

PrefabFiles = {
	"goldenspear",
	--"gold_spear_projectile",
}


-- Recipe Info
GLOBAL.STRINGS.NAMES.GOLDENSPEAR = "Sumptuous Spear"
GLOBAL.STRINGS.RECIPE_DESC.GOLDENSPEAR = "Use the pointy end like a badass."

AddRecipe("goldenspear", TUNING.GOLDENSPEAR_COST, GLOBAL.RECIPETABS.WAR,  GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, nil, "images/inventoryimages/goldenspear.xml", "goldenspear.tex")


-- Quotes
local CHARACTER = GLOBAL.STRINGS.CHARACTERS
CHARACTER.GENERIC.DESCRIBE.GOLDENSPEAR = "It's pointy and pretty."
CHARACTER.WILLOW.DESCRIBE.GOLDENSPEAR = "It won't light my enemies on fire, but at least it's shiny."
CHARACTER.WOLFGANG.DESCRIBE.GOLDENSPEAR = "Fancy spear has better stab."
CHARACTER.WENDY.DESCRIBE.GOLDENSPEAR = "Now I can destroy worlds with style."
CHARACTER.WX78.DESCRIBE.GOLDENSPEAR = "GOLD SPEAR IS *MORE* DURABLE?"
CHARACTER.WICKERBOTTOM.DESCRIBE.GOLDENSPEAR = "The most malleable of metals, but let's see how this stabs."
CHARACTER.WOODIE.DESCRIBE.GOLDENSPEAR = "Shiny, but still not an axe."
CHARACTER.WAXWELL.DESCRIBE.GOLDENSPEAR = "I don't remember having this in vanilla."
CHARACTER.WEBBER.DESCRIBE.GOLDENSPEAR = "The pointy part is so pretty now."
CHARACTER.WINONA.DESCRIBE.GOLDENSPEAR = "Quite luxurious."
CHARACTER.WATHGRITHR.DESCRIBE.GOLDENSPEAR = "Nöt as gööd as my spear."
CHARACTER.WORTOX.DESCRIBE.GOLDENSPEAR = "So shiny! Hyuyu!"
CHARACTER.WORMWOOD.DESCRIBE.GOLDENSPEAR = "Pretty sharp stick."
CHARACTER.WARLY.DESCRIBE.GOLDENSPEAR = "For gourmet kebab-ing."
CHARACTER.WURT.DESCRIBE.GOLDENSPEAR = "Maybe this can help with those tentacles."
CHARACTER.WALTER.DESCRIBE.GOLDENSPEAR = "But I was taught that gold is not suitable for something like this."

-- Throwable Spears Compatibility. WIP.
--[[
KnownModIndex = GLOBAL.KnownModIndex
local throwable_spears = "workshop-2408298309"  -- This is simply the workshop id of the Throwable Spears mod
if KnownModIndex:IsModEnabled(throwable_spears) then
	local SMALL_MISS_CHANCE = GLOBAL.GetModConfigData("SMALL_MISS_CHANCE", throwable_spears)
	local SMALL_USES = GLOBAL.GetModConfigData("SMALL_USES", throwable_spears)
	local LARGE_USES = GLOBAL.GetModConfigData("LARGE_USES", throwable_spears)
	local RANGE_CHECK = GLOBAL.GetModConfigData("RANGE_CHECK", throwable_spears)

	local smallhits =
	{
		frog = true,
		penguin = true,
		eyeplant = true,
	}

	local function spearthrow_onattack(inst, attacker, target, skipsanity)
    local smalltarget = target:HasTag("smallcreature") and not target:HasTag("spider") and not smallhits[target.prefab]
    local missed = false
    local spear = GLOBAL.SpawnSaveRecord(inst._spear)
    spear.Transform:SetPosition(inst:GetPosition():Get())
    if math.random() < SMALL_MISS_CHANCE and smalltarget then
        missed = true
        if attacker.components and attacker.components.talker then
            local miss_message = "Ugh, I don't think I can hit something that small!"
            if attacker.prefab == 'wx78' then miss_message = "INSUFFICIENT ACCURACY" end
            attacker.components.talker:Say(miss_message)
            target:PushEvent("attacked", {attacker = attacker, damage = 0, weapon = spear})
        end
    else
        if target.components.combat then
            spear.projectile = true
            target.components.combat:GetAttacked(attacker, attacker.components.combat:CalcDamage(target, spear), spear)
        end
    end
    if spear.components.finiteuses then
        spear.components.finiteuses:Use((smalltarget and not missed)
        and GLOBAL.TUNING.SPEAR_USES/SMALL_USES
        or GLOBAL.TUNING.SPEAR_USES/LARGE_USES)
    end
    spear:AddTag("scarytoprey")
    spear:DoTaskInTime(1, function(inst) inst:RemoveTag("scarytoprey") end)
    inst:Remove()

    attacker.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon", nil, nil, true)
	end
	
	function GoldenSpearPostInit(inst)
		if not GLOBAL.TheWorld.ismastersim then 
			return 
		end
		
		inst:AddComponent('spearthrowable')
		inst.components.spearthrowable:SetRange(8, 10)
		inst.components.spearthrowable:SetOnAttack(spearthrow_onattack)
		inst.components.spearthrowable:SetProjectile("gold_spear_projectile")
	end
	
	AddPrefabPostInit("goldenspear", GoldenSpearPostInit)
end
--]]
