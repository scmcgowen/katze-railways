local function give_power_to_wagons(wagons)

  for _, wagon in pairs(wagons) do
    local train = wagon.train
    if train then -- do nothing if wagon is not part of a train somehow
      local locomotives = {}-- get number of locomotives in the train
      local locomotive_count = 0
      for _,loco in pairs(train.locomotives.front_movers) do table.insert(locomotives,loco) end
      for _,loco in pairs(train.locomotives.back_movers) do table.insert(locomotives,loco) end
      for _,loco in pairs(locomotives) do
        if loco.status ~= defines.entity_status.no_fuel then
          locomotive_count = locomotive_count + 1
        end
      end
      local locomotive_power = wagon.grid.find("locomotive-power") -- find first locomotive power object and give it power
      if locomotive_power then
        locomotive_power.energy = settings.startup["power-per-locomotive"].value * 1000 * locomotive_count / 60
      end
    end
  end
end

local function on_tick(data)
  for _,surface in pairs(game.surfaces) do
    give_power_to_wagons(surface.find_entities_filtered{name="modular-wagon"}) -- get all modular wagons
    give_power_to_wagons(surface.find_entities_filtered{name="modular-locomotive"})
  end
end
script.on_event(defines.events.on_tick,on_tick)
