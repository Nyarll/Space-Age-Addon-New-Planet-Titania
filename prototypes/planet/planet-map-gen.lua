local planet_map_gen = require("__base__/prototypes/planet/planet-map-gen")

local base_ore = "iron-ore"
if data.raw["map-gen-presets"] and data.raw["map-gen-presets"].default then
  for name, preset in pairs(data.raw["map-gen-presets"].default) do
    if
      type(preset) == "table"
      and preset.basic_settings
      and preset.basic_settings.autoplace_controls
      and preset.basic_settings.autoplace_controls[base_ore]
    then
      preset.basic_settings.autoplace_controls["silicate-ice"] = preset.basic_settings.autoplace_controls[base_ore]
    end
  end
end

planet_map_gen.titania = function()
    return
    {
        aux_climate_control = true,
        moisture_climate_control = true,
        property_expression_names =
        { -- Warning: anything set here overrides any selections made in the map setup screen so the options do nothing.
            cliff_elevation = "cliff_elevation_nauvis",
            cliffiness = "cliffiness_nauvis",
            --elevation = "elevation_island"
        },
        cliff_settings =
        {
            name = "cliff",
            control = "nauvis_cliff",
            cliff_smoothing = 0
        },
        autoplace_controls =
        {
            ["stone"] = {},
            ["coal"] = {},
            ["silicate-ice"] = {},
            ["aquilo_crude_oil"] = {},
--            ["water"] = {},
            ["rocks"] = {},
        },
        autoplace_settings =
        {
            ["tile"] =
            {
                settings =
                {
                    ["snow-flat"] = {},
                    ["snow-crests"] = {},
                    ["snow-lumpy"] = {},
                    ["snow-patchy"] = {},
--                    ["water"] = {},
--                    ["deepwater"] = {},
                }
            },
            ["decorative"] =
            {
                settings =
                {
                    ["floating-iceberg-large"] = {},
                    ["floating-iceberg-small"] = {},
                    ["aqulio-ice-decal-blue"] = {},
                    ["aqulio-snowy-decal"] = {},
                    ["snow-drift-decal"] = {}
                }
            },
            ["entity"] =
            {
                settings =
                {
                    ["stone"] = {},
                    ["coal"] = {},
                    ["silicate-ice"] = {},
                    ["crude-oil"] = {},
                    ["big-sand-rock"] = {},
                    ["huge-rock"] = {},
                    ["big-rock"] = {},
                }
            }
        }
    }
end

return planet_map_gen
