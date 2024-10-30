require("__space-age__/prototypes/planet/planet-vulcanus-map-gen")
require("__space-age__/prototypes/planet/planet-gleba-map-gen")
require("__space-age__/prototypes/planet/planet-fulgora-map-gen")
require("__space-age__/prototypes/planet/planet-aquilo-map-gen")

local planet_map_gen = require("__new-planet-dev__/prototypes/planet/planet-map-gen")

local effects = require("__core__.lualib.surface-render-parameter-effects")
local asteroid_util = require("prototypes.planet.asteroid-spawn-definitions")
local planet_catalogue_vulcanus = require("__space-age__.prototypes.planet.procession-catalogue-vulcanus")
--local planet_catalogue_gleba = require("__space-age__.prototypes.planet.procession-catalogue-gleba")
--local planet_catalogue_fulgora = require("__space-age__.prototypes.planet.procession-catalogue-fulgora")
--local planet_catalogue_aquilo = require("__space-age__.prototypes.planet.procession-catalogue-aquilo")

data:extend(
    {
        {
            type = "planet",
            name = "titania",
            icon = "__new-planet-dev__/graphics/icons/titania.png",
            starmap_icon = "__new-planet-dev__/graphics/icons/starmap-planet-titania.png",
            starmap_icon_size = 512,
            gravity_pull = 10,
            distance = 30,       -- orbital radius
            orientation = 0.125, -- position of stars on orbit
            magnitude = 1.25,
            order = "j[titania]",
            subgroup = "planets",
            map_gen_settings = planet_map_gen.titania(),
            pollutant_type = nil,
            solar_power_in_space = 80,
            platform_procession_set =
            {
                arrival = { "planet-to-platform-b" },
                departure = { "platform-to-planet-a" }
            },
            planet_procession_set =
            {
                arrival = { "platform-to-planet-b" },
                departure = { "planet-to-platform-a" }
            },
            procession_graphic_catalogue = planet_catalogue_vulcanus,
            surface_properties =
            {
                ["day-night-cycle"] = 30 * minute,
                ["solar-power"] = 10,
                pressure = 200,
                gravity = 10
            },
            asteroid_spawn_influence = 1,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus, 0.9),
            persistent_ambient_sounds =
            {
                base_ambience = { filename = "__space-age__/sound/wind/base-wind-aquilo.ogg", volume = 0.5 },
                wind = { filename = "__space-age__/sound/wind/wind-fulgora.ogg", volume = 0.8 },
                crossfade =
                {
                    order = { "wind", "base_ambience" },
                    curve_type = "cosine",
                    from = { control = 0.35, volume_percentage = 0.0 },
                    to = { control = 2, volume_percentage = 100.0 }
                },
                semi_persistent =
                {
                    {
                        sound = { variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-rumble", 3, 0.5) },
                        delay_mean_seconds = 10,
                        delay_variance_seconds = 5
                    },
                    {
                        sound = { variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-flames", 5, 0.6) },
                        delay_mean_seconds = 15,
                        delay_variance_seconds = 7.0
                    }
                }
            },
            surface_render_parameters =
            {
                fog = effects.default_fog_effect_properties(),
                -- clouds = effects.default_clouds_effect_properties(),

                -- Should be based on the default day/night times, ie
                -- sun starts to set at 0.25
                -- sun fully set at 0.45
                -- sun starts to rise at 0.55
                -- sun fully risen at 0.75
                day_night_cycle_color_lookup =
                {
                    { 0.0,  "__space-age__/graphics/lut/vulcanus-1-day.png" },
                    { 0.20, "__space-age__/graphics/lut/vulcanus-1-day.png" },
                    { 0.45, "__space-age__/graphics/lut/vulcanus-2-night.png" },
                    { 0.55, "__space-age__/graphics/lut/vulcanus-2-night.png" },
                    { 0.80, "__space-age__/graphics/lut/vulcanus-1-day.png" },
                },

                terrain_tint_effect =
                {
                    noise_texture =
                    {
                        filename = "__space-age__/graphics/terrain/vulcanus/tint-noise.png",
                        size = 4096
                    },

                    offset = { 0.2, 0, 0.4, 0.8 },
                    intensity = { 0.5, 0.2, 0.3, 1.0 },
                    scale_u = { 3, 1, 1, 1 },
                    scale_v = { 1, 1, 1, 1 },

                    global_intensity = 0.3,
                    global_scale = 0.1,
                    zoom_factor = 3,
                    zoom_intensity = 0.6
                }
            }
        },
        -------------------------------------------------------------------------- PLANET CONNECTIONS
        {
            type = "space-connection",
            name = "vulcanus-titania",
            subgroup = "planet-connections",
            from = "vulcanus",
            to = "titania",
            order = "j",
            length = 20000,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_titania)
        },
        {
            type = "space-connection",
            name = "gleba-titania",
            subgroup = "planet-connections",
            from = "gleba",
            to = "titania",
            order = "k",
            length = 10000,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_titania)
        },
        {
            type = "space-connection",
            name = "titania-aquilo",
            subgroup = "planet-connections",
            from = "titania",
            to = "aquilo",
            order = "l",
            length = 15000,
            asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.titania_aquilo)
        }
    })