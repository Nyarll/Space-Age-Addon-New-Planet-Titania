data:extend(
    {
        {
            type = "technology",
            name = "planet-discovery-titania",
            icons = util.technology_icon_constant_planet("__new-planet-dev__/graphics/technology/titania.png"),
            icon_size = 256,
            essential = true,
            effects =
            {
                {
                    type = "unlock-space-location",
                    space_location = "titania",
                    use_icon_overlay_constant = true
                }
            },
            prerequisites = { "planet-discovery-vulcanus", "planet-discovery-gleba" },
            unit =
            {
                count = 1000,
                ingredients =
                {
                    { "automation-science-pack",   1 },
                    { "logistic-science-pack",     1 },
                    { "chemical-science-pack",     1 },
                    { "space-science-pack",        1 },
                    { "metallurgic-science-pack",  1 },
                    { "agricultural-science-pack", 1 },
                },
                time = 60
            }
        },
        {
            type = "technology",
            name = "dissolving-silicate-ice",
            icon = "__new-planet-dev__/graphics/technology/dissolving-silicate-ice.png",
            icon_size = 256,
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "dissolving-silicate-ice"
                }
            },
            prerequisites = { "planet-discovery-titania" },
            research_trigger =
            {
                type = "mine-entity",
                entity = "silicate-ice"
            }
        },
        {
            type = "technology",
            name = "advanced-electronics-science-pack",
            icon = "__new-planet-dev__/graphics/technology/advanced-electronics-science-pack.png",
            icon_size = 256,
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "advanced-electronics-science-pack"
                }
            },
            prerequisites = {"dissolving-silicate-ice"},
            research_trigger =
            {
                type = "craft-item",
                item = "silicon"
            }
        }
    }
)
