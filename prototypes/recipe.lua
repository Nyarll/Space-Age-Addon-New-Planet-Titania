local seconds = 60
local minutes = 60 * seconds

data:extend(
    {
        {
            type = "recipe",
            name = "dissolving-silicate-ice",
            enabled = false,
            energy_required = 2,
            ingredients =
            {
                { type = "item", name = "silicate-ice", amount = 2 }
            },
            results =
            {
                { type = "fluid", name = "water",   amount = 40 },
                { type = "item",  name = "silicon", amount = 2 }
            },
            allow_producivity = true,
            allow_decomposition = false,
            icon = "__new-planet-dev__/graphics/icons/fluid/dissolving-silicate-ice.png",
            category = "chemistry",
            subgroup = "fluid-recipes",
            order = "d[other-chemistry]-c[dissolving-silicate-ice]",
            auto_recycle = false,
            surface_conditions =
            {
                {
                    property = "gravity",
                    min = 0,
                    max = 30
                }
            },
        },
        {
            type = "recipe",
            name = "advanced-electronics-science-pack",
            icon = "__new-planet-dev__/graphics/icons/advanced-electronics-science-pack.png",
            enabled = false,
            energy_required = 15,
            ingredients =
            {
                { type = "item", name = "silicon",            amount = 2 },
                { type = "item", name = "electronic-circuit", amount = 3 },
                { type = "item", name = "advanced-circuit",   amount = 2 },
                { type = "item", name = "processing-unit",    amount = 1 },
            },
            surface_conditions =
            {
                {
                    property = "pressure",
                    min = 200,
                    max = 200
                },
                {
                    property = "gravity",
                    min = 10,
                    max = 10
                }
            },
            results =
            {
                { type = "item", name = "advanced-electronics-science-pack", amount = 1 }
            },
            allow_productivity = true,
            main_product = "advanced-electronics-science-pack"
        }
    }
)
