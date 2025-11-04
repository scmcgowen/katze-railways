local function RGB(colors)
local r = colors[1]
local g = colors[2]
local b = colors[3]
return ({r=r, g=g, b=b})
end

local tint = RGB{0xff,0x35,0x35}
local rail_assembler = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])
rail_assembler.name = "rail-assembler"
rail_assembler.crafting_categories = {"rail-assembler"}
rail_assembler.effect_receiver = { base_effect = { productivity = 0.5 }}
rail_assembler.minable.result = "rail-assembler"
rail_assembler.icons = {{icon = rail_assembler.icon,tint = RGB{0xff,0x35,0x35}}}
rail_assembler.collision_box = {{-2.2, -2.2}, {2.2, 2.2}}
rail_assembler.selection_box = {{-2.5, -2.5}, {2.5, 2.5}}
for i,layer in pairs(rail_assembler.graphics_set.animation.layers) do
  layer.tint = tint
  layer.scale = 0.9
end
local rail_assembler_recipe_category = {
  type = "recipe-category",
  name = "rail-assembler"
}

local rail_recipes = {
  "rail",
  "train-stop",
  "rail-signal",
  "rail-chain-signal",
  "locomotive",
  "cargo-wagon",
  "fluid-wagon",
  "artillery-wagon",
  -- Space Age DLC.
  "rail-ramp",
  "rail-support"
}
local rail_assembler_item = table.deepcopy(data.raw["item"]["assembling-machine-3"])
rail_assembler_item.icons = rail_assembler.icons
rail_assembler_item.name = "rail-assembler"
rail_assembler_item.place_result  = "rail-assembler"

local rail_assembler_recipe = {
  type = "recipe",
  name = "rail-assembler",
  icons = rail_assembler_item.icons,
  enabled = false,
  energy_required = 8,
  ingredients = {
    {type = "item", name = "assembling-machine-2", amount = 1},
    {type = "item", name = "rail", amount=20},
    {type = "item", name = "advanced-circuit", amount = 10}
  },
  additional_categories = {"rail-assembler"},
  results = {{type = "item", name = "rail-assembler", amount = 1}},
}

for _, recipe in pairs(rail_recipes) do
  if data.raw["recipe"][recipe] then
    data.raw["recipe"][recipe].additional_categories = data.raw["recipe"][recipe].additional_categories or {} -- make sure additional categories is defined
    table.insert(data.raw["recipe"][recipe].additional_categories,"rail-assembler") -- Add rail assembler category to those recipes
  end
end

data:extend{rail_assembler,rail_assembler_recipe_category,rail_assembler_item,rail_assembler_recipe}
