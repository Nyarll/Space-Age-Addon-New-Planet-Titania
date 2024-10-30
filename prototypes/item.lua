local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require("__space-age__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local item_effects = require("__space-age__.prototypes.item-effects")
local meld = require("meld")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

local make_tile_area = function(area, name)
    local result = {}
    local left_top = area[1]
    local right_bottom = area[2]
    for x = left_top[1], right_bottom[1] do
        for y = left_top[2], right_bottom[2] do
            table.insert(result,
                {
                    position = { x, y },
                    tile = name
                })
        end
    end
    return result
end

data:extend(
    {
        {
            type = "item",
            name = "silicate-ice",
            icon = "__new-planet-dev__/graphics/icons/silicate-ice.png",
            picture =
            {
                { size = 64, filename = "__new-planet-dev__/graphics/icons/silicate-ice.png", scale = 0.5, mipmap_count = 4 },
                { size = 64, filename = "__new-planet-dev__/graphics/icons/silicate-ice.png", scale = 0.5, mipmap_count = 4 },
                { size = 64, filename = "__new-planet-dev__/graphics/icons/silicate-ice.png", scale = 0.5, mipmap_count = 4 },
                { size = 64, filename = "__new-planet-dev__/graphics/icons/silicate-ice.png", scale = 0.5, mipmap_count = 4 }
            },
            subgroup = "titania-processes",
            color_hint = { text = "Si" },
            order = "c[silicate-ice]-a[silicate-ice]",
            inventory_move_sound = item_sounds.resource_inventory_move,
            pick_sound = item_sounds.resource_inventory_pickup,
            drop_sound = item_sounds.resource_inventory_move,
            stack_size = 50,
            default_import_location = "titania",
            weight = 2.5 * kg
        },
        {
            type = "item",
            name = "silicon",
            icon = "__space-age__/graphics/icons/calcite.png",
            subgroup = "titania-processes",
            order = "c[silicate-ice]-c[silicon]",
            inventory_move_sound = item_sounds.resource_inventory_move,
            pick_sound = item_sounds.resource_inventory_pickup,
            drop_sound = item_sounds.resource_inventory_move,
            stack_size = 50,
            default_import_location = "titania",
            weight = 1 * kg
        },
        -- science pack
        {
            type = "tool",
            name = "advanced-electronics-science-pack",
            localised_description = { "item-description.science-pack" },
            icon = "__new-planet-dev__/graphics/icons/advanced-electronics-science-pack.png",
            subgroup = "science-pack",
            color_hint = { text = "I" },
            order = "m",
            inventory_move_sound = item_sounds.science_inventory_move,
            pick_sound = item_sounds.science_inventory_pickup,
            drop_sound = item_sounds.science_inventory_move,
            stack_size = 200,
            default_import_location = "titania",
            weight = 1 * kg,
            durability = 1,
            durability_description_key = "description.science-pack-remaining-amount-key",
            durability_description_value = "description.science-pack-remaining-amount-value",
            random_tint_color = item_tints.bluish_science
        }
    }
)
