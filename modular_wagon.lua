
local wagonEquipmentGrid = table.deepcopy(data.raw["equipment-grid"]["small-equipment-grid"])
wagonEquipmentGrid.name = "modular-wagon-grid"
wagonEquipmentGrid.width = 10
wagonEquipmentGrid.height = 10
table.insert(wagonEquipmentGrid.equipment_categories,"trains")

local wagonItem = table.deepcopy(data.raw["item-with-entity-data"]["cargo-wagon"])
wagonItem.name = "modular-wagon"
wagonItem.place_result = "modular-wagon"

local modularWagon = table.deepcopy(data.raw["cargo-wagon"]["cargo-wagon"])
modularWagon.name = "modular-wagon"
modularWagon.equipment_grid = "modular-wagon-grid"
modularWagon.minable.result = "modular-wagon"

local modular_wagon_recipe = {
  type = "recipe",
  name = "modular-wagon",
  icon = modularWagon.icon,
  enabled = true,
  energy_required = 8,
  ingredients = {
  {type = "item", name = "cargo-wagon", amount = 1},
  {type = "item", name = "advanced-circuit", amount = 10}
  },
  additional_categories = {"rail-assembler"},
  results = {{type = "item", name = "modular-wagon", amount = 1}},
  enabled = false
}



local modular_locomotive_item = table.deepcopy(data.raw["item-with-entity-data"]["locomotive"])
modular_locomotive_item.name = "modular-locomotive"
modular_locomotive_item.place_result = "modular-locomotive"

local modular_locomotive = table.deepcopy(data.raw["locomotive"]["locomotive"])
modular_locomotive.name = "modular-locomotive"
modular_locomotive.equipment_grid = "modular-wagon-grid"
modular_locomotive.minable.result = "modular-locomotive"

local modular_locomotive_recipe = {
  type = "recipe",
  name = "modular-locomotive",
  icon = modular_locomotive.icon,
  enabled = true,
  energy_required = 8,
  ingredients = {
    {type = "item", name = "locomotive", amount = 1},
    {type = "item", name = "advanced-circuit", amount = 10}
  },
  additional_categories = {"rail-assembler"},
  results = {{type = "item", name = "modular-locomotive", amount = 1}},
  enabled = false
}



local locomotive_power_recipe = {
  type = "recipe",
  name = "locomotive-power",
  icons = {{icon=table.deepcopy(data.raw["item-with-entity-data"]["locomotive"].icon),icon_size=64},{icon="__katze-railways__/graphics/overlays/energy_overlay.png",icon_size=64}},
  enabled = true,
  energy_required = 8,
  ingredients = {
    {type = "item", name = "steel-plate", amount = 10},
    {type="item", name = "copper-cable", amount = 15},
    {type = "item", name = "advanced-circuit", amount = 10}
  },
  additional_categories = {"rail-assembler"},
  results = {{type = "item", name = "locomotive-power", amount = 1}},
  enabled = false
}

local sprite = {
  layers = {
  {
    filename = "__base__/graphics/icons/locomotive.png",
    priority= "medium",
    width=64,
    height=64
  },
  {
  filename = "__katze-railways__/graphics/overlays/energy_overlay.png",
  priority= "medium",
  width=64,
  height=64
  }
  },
  width = 64,
  height = 64
}


locomotive_power = table.deepcopy(data.raw["battery-equipment"]["battery-equipment"])
locomotive_power.name = "locomotive-power"
locomotive_power.take_result = nil -- ensure that it gives me a locomotive power item back
locomotive_power.energy_source.buffer_capacity = "1YJ"
locomotive_power.energy_source.input_flow_limit = "0W"
locomotive_power.shape.width = 1
locomotive_power.shape.height = 1
locomotive_power.categories = {"trains"} -- can only be placed in trains
locomotive_power.sprite = sprite

local locomotive_power_item = table.deepcopy(data.raw["item"]["battery-equipment"])
locomotive_power_item.name = "locomotive-power"
locomotive_power_item.icons = {{icon=table.deepcopy(data.raw["item-with-entity-data"]["locomotive"].icon),icon_size=64},{icon="__katze-railways__/graphics/overlays/energy_overlay.png",icon_size=64}}
locomotive_power_item.place_as_equipment_result = "locomotive-power"
locomotive_power_item.localised_name = nil

local equipment_category_trains = {
  type = "equipment-category",
  name = "trains"
}

data:extend{wagonEquipmentGrid,modularWagon,modular_wagon_recipe,wagonItem,locomotive_power,locomotive_power_item,locomotive_power_recipe,equipment_category_trains, modular_locomotive, modular_locomotive_item,modular_locomotive_recipe}


