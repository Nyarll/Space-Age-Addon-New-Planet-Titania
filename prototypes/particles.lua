local sounds = require("__base__.prototypes.entity.sounds")
local particle_animations = require("__new-planet-dev__/prototypes/particle-animations")

particle_animations.get_old_silicate_ice_particle_pictures = function(options)
    return
    {
        {
            filename = "__new-planet-dev__/graphics/particle/silicate-ice/silicate-ice-1.png",
            priority = "extra-high",
            width = 32,
            height = 32,
            scale = 0.5
        },
        {
            filename = "__new-planet-dev__/graphics/particle/silicate-ice/silicate-ice-2.png",
            priority = "extra-high",
            width = 32,
            height = 32,
            scale = 0.5
        },
        {
            filename = "__new-planet-dev__/graphics/particle/silicate-ice/silicate-ice-3.png",
            priority = "extra-high",
            width = 32,
            height = 32,
            scale = 0.5
        },
        {
            filename = "__new-planet-dev__/graphics/particle/silicate-ice/silicate-ice-4.png",
            priority = "extra-high",
            width = 32,
            height = 32,
            scale = 0.5
        },
    }
end

local default_ended_in_water_trigger_effect = function()
    return
    {
  
      {
        type = "create-particle",
        probability = 1,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "tintable-water-particle",
        apply_tile_tint = "secondary",
        offset_deviation = { { -0.05, -0.05 }, { 0.05, 0.05 } },
        initial_height = 0,
        initial_height_deviation = 0.02,
        initial_vertical_speed = 0.05,
        initial_vertical_speed_deviation = 0.05,
        speed_from_center = 0.01,
        speed_from_center_deviation = 0.006,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 2,
        tail_length_deviation = 1,
        tail_width = 3
      },
      {
        type = "create-particle",
        repeat_count = 10,
        repeat_count_deviation = 6,
        probability = 0.03,
        affects_target = false,
        show_in_tooltip = false,
        particle_name = "tintable-water-particle",
        apply_tile_tint = "primary",
        offsets =
        {
          { 0, 0 },
          { 0.01563, -0.09375 },
          { 0.0625, 0.09375 },
          { -0.1094, 0.0625 }
        },
        offset_deviation = { { -0.2969, -0.1992 }, { 0.2969, 0.1992 } },
        initial_height = 0,
        initial_height_deviation = 0.02,
        initial_vertical_speed = 0.053,
        initial_vertical_speed_deviation = 0.005,
        speed_from_center = 0.02,
        speed_from_center_deviation = 0.006,
        frame_speed = 1,
        frame_speed_deviation = 0,
        tail_length = 9,
        tail_length_deviation = 0,
        tail_width = 1
      },
      {
        type = "play-sound",
        sound = sounds.small_splash
      }
    }
  
  end
  
  local particle_ended_in_water_trigger_effect = function()
    return
    {
      type = "create-particle",
      repeat_count = 5,
      repeat_count_deviation = 4,
      probability = 0.2,
      affects_target = false,
      show_in_tooltip = false,
      particle_name = "tintable-water-particle",
      apply_tile_tint = "secondary",
      offsets = { { 0, 0 } },
      offset_deviation = { { -0.2969, -0.2969 }, { 0.2969, 0.2969 } },
      tile_collision_mask = nil,
      initial_height = 0.1,
      initial_height_deviation = 0.5,
      initial_vertical_speed = 0.06,
      initial_vertical_speed_deviation = 0.069,
      speed_from_center = 0.02,
      speed_from_center_deviation = 0.05,
      frame_speed = 1,
      frame_speed_deviation = 0,
      tail_length = 9,
      tail_length_deviation = 8,
      tail_width = 1
    }
  end

local make_particle = function(params)

    if not params then error("No params given to make_particle function") end
    local name = params.name or error("No name given")
  
    local ended_in_water_trigger_effect = params.ended_in_water_trigger_effect or default_ended_in_water_trigger_effect()
    if params.ended_in_water_trigger_effect == false then
      ended_in_water_trigger_effect = nil
    end
  
    local particle =
    {
  
      type = "optimized-particle",
      name = name,
  
      life_time = params.life_time or (60 * 15),
      fade_away_duration = params.fade_away_duration,
  
      render_layer = params.render_layer or "projectile",
      render_layer_when_on_ground = params.render_layer_when_on_ground or "corpse",
  
      regular_trigger_effect_frequency = params.regular_trigger_effect_frequency or 2,
      regular_trigger_effect = params.regular_trigger_effect,
      ended_in_water_trigger_effect = ended_in_water_trigger_effect,
  
      pictures = params.pictures,
      shadows = params.shadows,
      draw_shadow_when_on_ground = params.draw_shadow_when_on_ground,
  
      movement_modifier_when_on_ground = params.movement_modifier_when_on_ground,
      movement_modifier = params.movement_modifier,
      vertical_acceleration = params.vertical_acceleration,
  
      mining_particle_frame_speed = params.mining_particle_frame_speed,
  
    }
  
    return particle
  
  end

local particles =
{
    make_particle
    {
        name = "silicate-ice-particle",
        life_time = 180,
        pictures = particle_animations.get_old_silicate_ice_particle_pictures(),
        shadows = particle_animations.get_old_stone_particle_shadow_pictures()
    },
}

data:extend(particles)