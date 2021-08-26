local assets = {
	Asset("ANIM", "anim/golden_spear.zip"),
	Asset("ANIM", "anim/golden_swap_spear.zip"),
    Asset("ATLAS", "images/inventoryimages/goldenspear.xml"),
}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "golden_swap_spear", "swap_spear")
	owner.SoundEmitter:PlaySound("dontstarve/wilson/equip_item_gold")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end


local function fn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    inst.entity:AddNetwork()
	
    MakeInventoryPhysics(inst)
	
    inst.AnimState:SetBank("spear")
    inst.AnimState:SetBuild("golden_swap_spear")
    inst.AnimState:PlayAnimation("idle")
	
    inst:AddTag("sharp")
    inst:AddTag("pointy")
    inst:AddTag("weapon")

    MakeInventoryFloatable(inst, "med", 0.05, {1.1, 0.5, 1.1}, true, -9)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.GOLDENSPEAR_DAMAGE)

    if TUNING.GOLDENSPEAR_USES > 0 then  -- If configured to be Unbreakable
        inst:AddComponent("finiteuses")
        inst.components.finiteuses:SetMaxUses(TUNING.GOLDENSPEAR_USES)
        inst.components.finiteuses:SetUses(TUNING.GOLDENSPEAR_USES)
        inst.components.finiteuses:SetOnFinished(inst.Remove)
    end

    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/goldenspear.xml"
    
    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip( onequip )
    inst.components.equippable:SetOnUnequip( onunequip )
	
	MakeHauntableLaunch(inst)
    
    return inst
end

return Prefab( "common/inventory/goldenspear", fn, assets)
