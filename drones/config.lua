Config = {
  BankAccountName = "bank",   -- ESX account name for bank.

  DroneSounds = true,        -- Should the drones make sound?

  MaxVelocity = 250.0,        -- Max drone speed (* drone stats.speed)
  BoostSpeed  = 3.0,          -- How much the boost ability multiplies max speed
  BoostAccel  = 2.0,          -- How much the boost ability multiplies acceleration
  BoostDrain  = 1.0,          -- Boost ability drain speed when used
  BoostFill   = 0.2,          -- Boost ability recharge speed.
  TazerFill   = 0.2,          -- Tazer ability recharge speed.

  -- Shop = {                 
  --   show_blip   = false,
  --   blip_sprite = 627,
  --   blip_color  = 2,
  --   blip_scale  = 0.5,
  --   blip_text   = "Teknoloji Mağazası",
  --   blip_disp   = 2,
  --   location    = vector4(-656.69,-858.13,23.10,0.0),
  --   droneoffset = vector3(0.0,0.0,1.5),
  --   camoffset2  = vector3(0.0,0.0,1.85),
  --   camoffset1  = vector3(0.12,0.4,1.5),
  -- },

  Drones = {
    [1] = {
      label = "Basit Drone 1",                               -- Visible text.
      name = "drone_flyer_1",                                -- Item name.
      public = true,                                         -- Can be used by anybody?
      price = 10000,                                          -- Price
      model = GetHashKey('ch_prop_arcade_drone_01a'),        -- Model
      stats = {                        
        speed   = 1.0,               -- max speed multiplier
        agility = 1.0,               -- acceleration/deceleration multiplier
        range   = 100.0,             -- range (drone display begins fading out when leaving range)

        -- Max Stats:
        -- Max stats are displayed in the NUI window. You can categorize your drones by sharing max stats across similar drones (e.g: basic drone 1,2,3), and changing them for others (e.g: advanced drone 1,2,3).
        -- or you can choose to display the same max stats across all drones to have a fair comparison chart.
        maxSpeed    = 2,             
        maxAgility  = 2,
        maxRange    = 200,
      },
      abilities = {
        infared     = true,  -- infared/heat-vision
        nightvision = true,  -- nightvision
        boost       = false,  -- boost
        tazer       = false,  -- tazer 
        explosive   = false,  -- explosion
      },
      restrictions = {},          -- enter job names in here (e.g: {'police','mechanic'}) to restrict the drone purchase to these jobs only, or leave it empty (e.g: {}) for no job restrictions.
      -- bannerUrl = "banner1.png";  -- set the banner image to display at the shop while previewing this drone.
    },

    -- [2] = {
    --   label = "Basit Drone 2",
    --   name = "drone_flyer_2",
    --   public = true,
    --   price = 10000,
    --   model = GetHashKey('ch_prop_arcade_drone_01b'),
    --   stats = {
    --     speed   = 0.5,
    --     agility = 1.5,
    --     range   = 100.0,

    --     maxSpeed    = 2,
    --     maxAgility  = 2,
    --     maxRange    = 200,
    --   },
    --   abilities = {
    --     infared     = false,
    --     nightvision = false,
    --     boost       = false,
    --     tazer       = false,
    --     explosive   = false,
    --   },
    --   restrictions = {},
    --   bannerUrl = "banner2.png";
    -- },

    -- [3] = {
    --   label = "Basit Drone 3",
    --   name = "drone_flyer_3",
    --   public = true,
    --   price = 10000,
    --   model = GetHashKey('ch_prop_arcade_drone_01c'),
    --   stats = {
    --     speed   = 1.5,
    --     agility = 0.5,
    --     range   = 100.0,

    --     maxSpeed    = 2,
    --     maxAgility  = 2,
    --     maxRange    = 200,
    --   },
    --   abilities = {
    --     infared     = false,
    --     nightvision = false,
    --     boost       = false,
    --     tazer       = false,
    --     explosive   = false,
    --   },
    --   restrictions = {},
    --   bannerUrl = "banner3.png";
    -- },

    -- [4] = {
    --   label = "Gelişmiş Drone 1",
    --   name = "drone_flyer_4",
    --   public = true,
    --   price = 25000,
    --   model = GetHashKey('ch_prop_arcade_drone_01d'),
    --   stats = {
    --     speed   = 1.5,
    --     agility = 1.5,
    --     range   = 300.0,

    --     maxSpeed    = 2,
    --     maxAgility  = 2,
    --     maxRange    = 200,
    --   },
    --   abilities = {
    --     infared     = true,
    --     nightvision = true,
    --     boost       = true,
    --     tazer       = false,
    --     explosive   = false,
    --   },
    --   restrictions = {},
    --   bannerUrl = "banner4.png";
    -- },

    -- [5] = {
    --   label = "Gelişmiş Drone 2",
    --   name = "drone_flyer_5",
    --   public = true,
    --   price = 25000,
    --   model = GetHashKey('ch_prop_arcade_drone_01e'),
    --   stats = {
    --     speed   = 2.0,
    --     agility = 1.0,
    --     range   = 300.0,

    --     maxSpeed    = 2,
    --     maxAgility  = 2,
    --     maxRange    = 500,
    --   },
    --   abilities = {
    --     infared     = true,
    --     nightvision = true,
    --     boost       = true,
    --     tazer       = false,
    --     explosive   = false,
    --   },
    --   restrictions = {},
    --   bannerUrl = "banner3.png";
    -- },

    -- [6] = {
    --   label = "Gelişmiş Drone 3",
    --   name = "drone",
    --   public = true,
    --   price = 25000,
    --   model = GetHashKey('ch_prop_casino_drone_02a'),
    --   stats = {
    --     speed   = 1.0,
    --     agility = 2.0,
    --     range   = 300.0,

    --     maxSpeed    = 2,
    --     maxAgility  = 2,
    --     maxRange    = 500,
    --   },
    --   abilities = {
    --     infared     = true,
    --     nightvision = true,
    --     boost       = true,
    --     tazer       = false,
    --     explosive   = false,
    --   },
    --   restrictions = {},
    --   bannerUrl = "banner2.png";
    -- },

    -- [7] = {
    --   label = "Polis Drone",
    --   name = "drone_flyer_7",
    --   public = false,
    --   price = 10000,
    --   model = GetHashKey('ch_prop_casino_drone_02a'),
    --   stats = {
    --     speed   = 1.0,
    --     agility = 1.0,
    --     range   = 500.0,

    --     maxSpeed    = 2,
    --     maxAgility  = 2,
    --     maxRange    = 500,
    --   },
    --   abilities = {
    --     infared     = true,
    --     nightvision = true,
    --     boost       = true,
    --     tazer       = true,
    --     explosive   = false,
    --   },
    --   restrictions = {
    --     'police'
    --   },
    --   bannerUrl = "banner1.png";
    -- },
  },

  Controls = {
    Drone = {
      ["inspect"] = {
        codes = {38},
        text = "Technology store",
      },
      ["pickup_drone"] = {
        codes = {38},
        text = "Get the Drone",
      },
      ["direction"] = {
        codes = {32,33,34,35},
        text = "Direction",
      },
      ["heading"] = {
        codes = {51,52},
        text = "heading",
      },
      ["height"] = {
        codes = {36,21},
        text = "height",
      },
      ["camera"] = {
        codes = {24,25},
        text = "camera",
      },
      ["centercam"] = {
        codes = {214},
        text = "center camera",
      },
      ["zoom"] = {
        codes = {16,17},
        text = "zoom"
      },
      ["nightvision"] = {
        codes = {140},
        text = "nightvision"
      },
      ["infared"] = {
        codes = {75},
        text = "Infrared"
      },
      ["tazer"] = {
        codes = {157},
        text = "tazer"
      },
      ["explosive"] = {
        codes = {158},
        text = "explosive"
      },
      ["boost"] = {
        codes = {160},
        text = "boost"
      },
      ["home"] = {
        codes = {213},
        text = "back home",
      },
      ["disconnect"] = {
        codes = {200},
        text = "disconnect"
      },
    },
    Homing = {
      ["cancel"] = {
        codes = {213},
        text = "cancel",
      },
      ["disconnect"] = {
        codes = {200},
        text = "disconnect"
      },
    }
  },
}

mLibs = exports["meta_libs"]