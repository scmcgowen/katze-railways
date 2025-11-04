local modularTrainTechnology = {
  type = "technology",
  name = "modular-trains",
  icon = data.raw["item-with-entity-data"]["modular-wagon"].icon,
  unit = {
    count=100,
    ingredients = {{"automation-science-pack",1},{"logistic-science-pack",1},{"chemical-science-pack",1}},
    time=30
  },
  effects = {
  {
    type = "unlock-recipe",
    recipe = "modular-wagon"
  },
  {
    type = "unlock-recipe",
    recipe = "modular-locomotive"
  },
  {
    type = "unlock-recipe",
    recipe = "locomotive-power"
  }
  },
  prerequisites = {"railway","modular-armor"}
}

local railAssemblerTechnology = {
  type = "technology",
  name = "rail-assembler",
  icons= data.raw["item"]["rail-assembler"].icons,
  unit = {
    count=80,
    ingredients = {{"automation-science-pack",1},{"logistic-science-pack",1},{"chemical-science-pack",1}},
    time=60
  },
  effects = {
    {
      type = "unlock-recipe",
      recipe = "rail-assembler"
    }

  },
  prerequisites = {"railway"}
}

data:extend{modularTrainTechnology,railAssemblerTechnology}
