
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/zepthical/Vayfield/refs/heads/main/README.md'))()
 
 local Window = Rayfield:CreateWindow({
    Name = "🍪 | Cookie Hub DEV",
    Icon = 0,
    LoadingTitle = "CookieHub DEV",
    LoadingSubtitle = "by Zepthical",
    Theme = "Default",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "cdevtest.lua"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = true
    },
    KeySystem = false,
 })

-- Tables --

--[[local Islands = {
    "Moosewood", "Statue", "Forsaken", "RoslitBay", "GrandReef", "AncientArchivesDoor", 
    "Altar", "DesolateDeep", "SnowCap", "Mushgrove", "CalmZone", "TheDepths", 
    "ForsakenShores", "Terrapin", "Sunstone", "TheArch", "Brine", "CraftTable", 
    "Spike", "Vertigo", "Ancient", "NorthEXP", "ChallengerDeep", "VolcanicVent", 
    "AbyssalZenith", "Atlantis", "EtherealPuzzle", "FinalPuzNorthEXP", "None"
}

-- Coordinates Table
local coordinates = {
    Moosewood = Vector3.new(381, 135, 240),
    Statue = Vector3.new(17.7, 160, -1044),
    Forsaken = Vector3.new(-2500, 134, 1548),
    RoslitBay = Vector3.new(-1447, 133, 672),
    GrandReef = Vector3.new(-3565, 150, 535),
    AncientArchivesDoor = Vector3.new(-3155, 754, 2193),
    Altar = Vector3.new(-1296, 805, 298),
    DesolateDeep = Vector3.new(-1510, 234, 2852),
    SnowCap = Vector3.new(-2648, 142, 2521),
    Mushgrove = Vector3.new(-2501, 131, 720),
    CalmZone = Vector3.new(-4255, 11201, 1775),
    TheDepths = Vector3.new(-568, 704, 1230),
    ForsakenShores = Vector3.new(-2498, 136, 1624),
    Terrapin = Vector3.new(-146, 145, 1914),
    Sunstone = Vector3.new(-932, 131, 1118),
    TheArch = Vector3.new(-998, 131, 1237),
    Brine = Vector3.new(-1794, 142, 3302),
    CraftTable = Vector3.new(-3159, 745, 1684),
    Spike = Vector3.new(-1254, 137, 1554),
    Vertigo = Vector3.new(-112, 515, 1040),
    Ancient = Vector3.new(-6055, 195, 278),
    NorthEXP = Vector3.new(-19990, 1136, 5536),
    ChallengerDeep = Vector3.new(-735, 3360, 1684),
    VolcanicVent = Vector3.new(-3181, 2036, 4017),
    AbyssalZenith = Vector3.new(-13550, 11050, 123),
    Atlantis = Vector3.new(-4263, -603, 1829),
    EtherealPuzzle = Vector3.new(-4122, 602, 1820),
    FinalPuzNorthEXP = Vector3.new(19963, 1137, 5401)
}

return {
	Fish = {
        ["Helios Ray"] = { Price = "180", Rarity = "Unusual", WeightPool = {30, 60}, From = "Atlantis" },
        ["Snowcap Algae"] = { Price = "50", Rarity = "Limited", WeightPool = {25, 50}, From = "N/A" },
        ["Icicle"] = { Price = "130", Rarity = "Limited", WeightPool = {4, 12}, From = "N/A" },
        ["Hydra Haddock"] = { Price = "400", Rarity = "Common", WeightPool = {210, 470}, From = "Veil of the Forsaken" },
        ["Deep Sea Fragment"] = { Price = "0", Rarity = "Fragment", WeightPool = {1, 1}, From = "Ancient Isle" },
        ["Small Spine Chimera"] = { Price = "1200", Rarity = "Legendary", WeightPool = {800, 1500}, From = "The Depths" },
        ["Seaweed"] = { Price = "9", Rarity = "Trash", WeightPool = {1, 3}, From = "None" },
        ["Napoleonfish"] = { Price = "200", Rarity = "Rare", WeightPool = {250, 350}, From = "Sunstone" },
        ["Philosopher's Fish"] = { Price = "300", Rarity = "Unusual", WeightPool = {35, 70}, From = "Atlantis" },
        ["Frozen Fangfish"] = { Price = "650", Rarity = "Limited", WeightPool = {50, 80}, From = "N/A" },
        ["Midnight Axolotl"] = { Price = "1100", Rarity = "Legendary", WeightPool = {10, 30}, From = "Desolate Deep" },
        ["Trout"] = { Price = "65", Rarity = "Common", WeightPool = {9, 50}, From = "Moosewood" },
        ["Rabbitfish"] = { Price = "1100", Rarity = "Legendary", WeightPool = {25, 60}, From = "Ocean" },
        ["Sailfish"] = { Price = "800", Rarity = "Rare", WeightPool = {400, 600}, From = "Ocean" },
        ["Captain's Goldfish"] = { Price = "1700", Rarity = "Mythical", WeightPool = {10, 25}, From = "Forsaken Shores" },
        ["Typhoon Tuna"] = { Price = "900", Rarity = "Rare", WeightPool = {200, 450}, From = "Atlantean Storm" },
        ["Chillshadow Chub"] = { Price = "100", Rarity = "Uncommon", WeightPool = {6, 16}, From = "Challenger's Deep" },
        ["Baby Pond Emperor"] = { Price = "230", Rarity = "Mythical", WeightPool = {5, 20}, From = "Ocean" },
        ["Walleye"] = { Price = "90", Rarity = "Uncommon", WeightPool = {18, 40}, From = "Terrapin" },
        ["Countdown Perch"] = { Price = "2000", Rarity = "Limited", WeightPool = {3000, 5000}, From = "N/A" },
        ["Sturgeon"] = { Price = "300", Rarity = "Rare", WeightPool = {200, 800}, From = "Snowcap" },
        ["Giant Manta"] = { Price = "350", Rarity = "Unusual", WeightPool = {60, 120}, From = "Atlantis" },
        ["Oarfish"] = { Price = "4000", Rarity = "Mythical", WeightPool = {1500, 2500}, From = "Ocean" },
        ["Lobster"] = { Price = "130", Rarity = "Unusual", WeightPool = {9, 28}, From = "Ocean" },
        ["Frigid Mammoth Tusk"] = { Price = "3000", Rarity = "Mythical", WeightPool = {2500, 5000}, From = "Frigid Cavern" },
        ["Starfish"] = { Price = "110", Rarity = "Uncommon", WeightPool = {20, 70}, From = "Ancient Isle" },
        ["Pollock"] = { Price = "70", Rarity = "Common", WeightPool = {10, 50}, From = "Snowcap" },
        ["Neptune's Nibbler"] = { Price = "45", Rarity = "Common", WeightPool = {5, 15}, From = "Atlantis" },
        ["Ancient Serpent Skull"] = { Price = "1200", Rarity = "Limited", WeightPool = {50, 100}, From = "N/A" },
        ["Moon Wood"] = { Price = "450", Rarity = "Legendary", WeightPool = {1, 2}, From = "None" },
        ["Void Wood"] = { Price = "350", Rarity = "Legendary", WeightPool = {1, 2}, From = "None" },
        ["Emerald Elephantnose"] = { Price = "1000", Rarity = "Uncommon", WeightPool = {600, 1600}, From = "Calm Zone" },
        ["Ice Anchovy"] = { Price = "140", Rarity = "Uncommon", WeightPool = {2, 6}, From = "Overgrowth Caves" },
        ["Ice Octopus"] = { Price = "350", Rarity = "Unusual", WeightPool = {30, 80}, From = "Frigid Cavern" },
        ["Iced Perch"] = { Price = "250", Rarity = "Unusual", WeightPool = {20, 45}, From = "Cryogenic Canal" },
        ["Abyss Snapper"] = { Price = "300", Rarity = "Uncommon", WeightPool = {15, 40}, From = "Atlantean Storm" },
        ["Icy Carp"] = { Price = "250", Rarity = "Unusual", WeightPool = {30, 70}, From = "Overgrowth Caves" },
        ["Icebreaker Haddock"] = { Price = "800", Rarity = "Rare", WeightPool = {200, 400}, From = "Cryogenic Canal" },
        ["Ashcloud Archerfish"] = { Price = "24000", Rarity = "Limited", WeightPool = {10000, 16000}, From = "N/A" },
        ["Hollyscale Trout"] = { Price = "150", Rarity = "Limited", WeightPool = {5, 10}, From = "N/A" },
        ["Leviathan Bass"] = { Price = "400", Rarity = "Unusual", WeightPool = {80, 160}, From = "Atlantis" },
        ["Pyrite Pufferfish"] = { Price = "1100", Rarity = "Rare", WeightPool = {75, 190}, From = "Volcanic Vents" },
        ["The Depths Key"] = { Price = "800", Rarity = "Exotic", WeightPool = {500, 1000}, From = "Vertigo" },
        ["Ancient Orca"] = { Price = "15000", Rarity = "Secret", WeightPool = {20000, 25000}, From = "Ocean" },
        ["Galleon Goliath"] = { Price = "190", Rarity = "Uncommon", WeightPool = {50, 200}, From = "Forsaken Shores" },
        ["Destroyed Fossil"] = { Price = "35", Rarity = "Trash", WeightPool = {10, 45}, From = "The Depths" },
        ["Prismatic Parrotfish"] = { Price = "1500", Rarity = "Rare", WeightPool = {80, 240}, From = "Calm Zone" },
        ["Lurkerfish"] = { Price = "1500", Rarity = "Limited", WeightPool = {5, 20}, From = "N/A" },
        ["Quality Bait Crate"] = { Price = "150", Rarity = "Rare", WeightPool = {120, 120}, From = "None" },
        ["Spine Blade"] = { Price = "100", Rarity = "Limited", WeightPool = {30, 60}, From = "N/A" },
        ["Crystal Corydoras"] = { Price = "3000", Rarity = "Legendary", WeightPool = {1500, 4000}, From = "Calm Zone" },
        ["Atlantean Sardine"] = { Price = "35", Rarity = "Common", WeightPool = {3, 10}, From = "Atlantis" },
        ["Colossal Saccopharynx"] = { Price = "100", Rarity = "Uncommon", WeightPool = {800, 2000}, From = "Abyssal Zenith" },
        ["Hallucigenia"] = { Price = "200", Rarity = "Rare", WeightPool = {30, 100}, From = "Ancient Isle" },
        ["Bone"] = { Price = "30", Rarity = "Trash", WeightPool = {10, 25}, From = "Brine Pool" },
        ["Meg's Fang"] = { Price = "1500", Rarity = "Mythical", WeightPool = {10, 20}, From = "None" },
        ["Whirlpool Marlin"] = { Price = "450", Rarity = "Unusual", WeightPool = {40, 90}, From = "Atlantean Storm" },
        ["Moby"] = { Price = "75000", Rarity = "Secret", WeightPool = {900000, 2000000}, From = "Ocean" },
        ["Borealis Snapper"] = { Price = "3500", Rarity = "Legendary", WeightPool = {800, 1600}, From = "Glacial Grotto" },
        ["Vortex Barracuda"] = { Price = "600", Rarity = "Unusual", WeightPool = {80, 160}, From = "Atlantean Storm" },
        ["Skipjack Tuna"] = { Price = "150", Rarity = "Unusual", WeightPool = {70, 160}, From = "Snowcap" },
        ["Cryo Coelacanth"] = { Price = "500", Rarity = "Rare", WeightPool = {70, 210}, From = "Challenger's Deep" },
        ["Atlantean Guardian"] = { Price = "250", Rarity = "Unusual", WeightPool = {40, 80}, From = "Atlantis" },
        ["Glacierfish"] = { Price = "800", Rarity = "Mythical", WeightPool = {400, 600}, From = "Snowcap" },
        ["Radiant Triplewart Seadevil"] = { Price = "600", Rarity = "Unusual", WeightPool = {100, 210}, From = "Abyssal Zenith" },
        ["Pyro Pike"] = { Price = "500", Rarity = "Limited", WeightPool = {25, 45}, From = "N/A" },
        ["Voltfin Carp"] = { Price = "180", Rarity = "Common", WeightPool = {100, 250}, From = "Atlantis" },
        ["Lepidotes"] = { Price = "1800", Rarity = "Mythical", WeightPool = {900, 2000}, From = "Ancient Archives" },
        ["Deep Behemoth"] = { Price = "4000", Rarity = "Legendary", WeightPool = {3000, 6000}, From = "Atlantis" },
        ["Helicoprion"] = { Price = "6000", Rarity = "Mythical", WeightPool = {2500, 4200}, From = "Ancient Isle" },
        ["The Kraken"] = { Price = "20000", Rarity = "Exotic", WeightPool = {35000, 70000}, From = "Atlantis" },
        ["Starlit Weaver"] = { Price = "800", Rarity = "Rare", WeightPool = {200, 400}, From = "Atlantis" },
        ["Red Drum"] = { Price = "80", Rarity = "Common", WeightPool = {10, 25}, From = "Snowcap" },
        ["Buccaneer Barracuda"] = { Price = "250", Rarity = "Uncommon", WeightPool = {90, 250}, From = "Forsaken Shores" },
        ["Diplurus"] = { Price = "800", Rarity = "Legendary", WeightPool = {800, 1600}, From = "Ancient Archives" },
        ["Golden Seahorse"] = { Price = "2900", Rarity = "Mythical", WeightPool = {3, 8}, From = "Forsaken Shores" },
        ["Icy Walleye"] = { Price = "350", Rarity = "Unusual", WeightPool = {40, 90}, From = "Glacial Grotto" },
        ["Snook"] = { Price = "110", Rarity = "Unusual", WeightPool = {30, 70}, From = "Moosewood" },
        ["Embertail Eel"] = { Price = "130", Rarity = "Uncommon", WeightPool = {18, 40}, From = "Volcanic Vents" },
        ["Boot"] = { Price = "15", Rarity = "Trash", WeightPool = {12, 12}, From = "None" },
        ["Megalodon"] = { Price = "10000", Rarity = "Exotic", WeightPool = {500000, 670000}, From = "Ancient Isle" },
        ["Icy Salmon"] = { Price = "180", Rarity = "Uncommon", WeightPool = {40, 100}, From = "Overgrowth Caves" },
        ["Bluefin Tuna"] = { Price = "350", Rarity = "Rare", WeightPool = {1000, 2200}, From = "Ocean" },
        ["Colossal Squid"] = { Price = "6500", Rarity = "Mythical", WeightPool = {7000, 12000}, From = "Ocean" },
        ["Long Pike"] = { Price = "18000", Rarity = "Secret", WeightPool = {12, 35}, From = "Ocean" },
        ["Lapisjack"] = { Price = "115", Rarity = "Rare", WeightPool = {200, 400}, From = "Keepers Altar" },
        ["Yellow Energy Crystal"] = { Price = "0", Rarity = "Mythical", WeightPool = {25, 50}, From = "None" },
        ["Maelstorm Shark"] = { Price = "3000", Rarity = "Legendary", WeightPool = {2500, 5000}, From = "Atlantean Storm" },
        ["Spectral Serpent"] = { Price = "9000", Rarity = "Mythical", WeightPool = {110000, 130000}, From = "Brine Pool" },
        ["Corsair Grouper"] = { Price = "35", Rarity = "Common", WeightPool = {50, 200}, From = "Forsaken Shores" },
        ["Mackerel"] = { Price = "75", Rarity = "Common", WeightPool = {10, 40}, From = "Ocean" },
        ["Oracle's Eye"] = { Price = "350", Rarity = "Unusual", WeightPool = {45, 90}, From = "Atlantis" },
        ["Stingray"] = { Price = "230", Rarity = "Rare", WeightPool = {150, 300}, From = "Ocean" },
        ["Abyssacuda"] = { Price = "400", Rarity = "Rare", WeightPool = {55, 110}, From = "Vertigo" },
        ["Polar Alligator"] = { Price = "3000", Rarity = "Legendary", WeightPool = {800, 1500}, From = "Frigid Cavern" },
        ["Anglers Lantern"] = { Price = "1200", Rarity = "Exotic", WeightPool = {20, 20}, From = "None" },
        ["Leedsichthys"] = { Price = "2200", Rarity = "Legendary", WeightPool = {9000, 11000}, From = "Ancient Isle" },
        ["Minnow"] = { Price = "45", Rarity = "Common", WeightPool = {1, 6}, From = "Roslit" },
        ["Ember Catfish"] = { Price = "275", Rarity = "Limited", WeightPool = {130, 200}, From = "N/A" },
        ["Colossal Carp"] = { Price = "180", Rarity = "Uncommon", WeightPool = {20, 50}, From = "Atlantis" },
        ["Thunder Bass"] = { Price = "450", Rarity = "Unusual", WeightPool = {300, 600}, From = "Atlantis" },
        ["Inferno Wood"] = { Price = "700", Rarity = "Mythical", WeightPool = {1, 2}, From = "None" },
        ["Twilight Tentaclefish"] = { Price = "13000", Rarity = "Mythical", WeightPool = {2800, 7500}, From = "Veil of the Forsaken" },
        ["Olmdeer"] = { Price = "400", Rarity = "Limited", WeightPool = {1, 4}, From = "N/A" },
        ["Tentacled Horror"] = { Price = "300", Rarity = "Uncommon", WeightPool = {50, 120}, From = "Atlantis" },
        ["Glacial Sturgeon"] = { Price = "7000", Rarity = "Mythical", WeightPool = {2500, 5000}, From = "Cryogenic Canal" },
        ["Phanerorhynchus"] = { Price = "450", Rarity = "Rare", WeightPool = {600, 1400}, From = "Ancient Archives" },
        ["Xiphactinus"] = { Price = "170", Rarity = "Unusual", WeightPool = {1400, 2000}, From = "Ancient Isle" },
        ["Mutated Shark"] = { Price = "3000", Rarity = "Mythical", WeightPool = {2000, 4000}, From = "The Depths" },
        ["Gudgeon"] = { Price = "40", Rarity = "Common", WeightPool = {1, 3}, From = "Terrapin" },
        ["Song of the Deep"] = { Price = "1200", Rarity = "Relic", WeightPool = {210, 210}, From = "None" },
        ["Burnt Betta"] = { Price = "3000", Rarity = "Limited", WeightPool = {2000, 8000}, From = "N/A" },
        ["Goblin Shark"] = { Price = "450", Rarity = "Rare", WeightPool = {200, 450}, From = "The Depths" },
        ["Coral Guard"] = { Price = "250", Rarity = "Uncommon", WeightPool = {40, 90}, From = "Grand Reef" },
        ["Golden Smallmouth Bass"] = { Price = "700", Rarity = "Legendary", WeightPool = {15, 45}, From = "Terrapin" },
        ["Gazerfish"] = { Price = "190", Rarity = "Common", WeightPool = {80, 140}, From = "Brine Pool" },
        ["Dweller Catfish"] = { Price = "440", Rarity = "Rare", WeightPool = {100, 160}, From = "Brine Pool" },
        ["Horseshoe Crab"] = { Price = "25", Rarity = "Common", WeightPool = {40, 90}, From = "Desolate Deep" },
        ["Celestial Koi"] = { Price = "8000", Rarity = "Mythical", WeightPool = {5000, 10000}, From = "Atlantis" },
        ["Icebeard Shark"] = { Price = "8000", Rarity = "Mythical", WeightPool = {3000, 6000}, From = "Glacial Grotto" },
        ["Slate Tuna"] = { Price = "70", Rarity = "Common", WeightPool = {300, 600}, From = "Desolate Deep" },
        ["Lightning Pike"] = { Price = "276", Rarity = "Rare", WeightPool = {200, 450}, From = "Atlantis" },
        ["Grand Reef Guardian"] = { Price = "7000", Rarity = "Mythical", WeightPool = {400, 800}, From = "Grand Reef" },
        ["Sunken Silverscale"] = { Price = "65", Rarity = "Common", WeightPool = {4, 14}, From = "Atlantis" },
        ["Bluefish"] = { Price = "65", Rarity = "Unusual", WeightPool = {4, 9}, From = "Keepers Altar" },
        ["Siren Sculpin"] = { Price = "4000", Rarity = "Rare", WeightPool = {900, 2500}, From = "Veil of the Forsaken" },
        ["Chillfin Chimaera"] = { Price = "4000", Rarity = "Mythical", WeightPool = {9000, 26000}, From = "Challenger's Deep" },
        ["Column Crawler"] = { Price = "55", Rarity = "Common", WeightPool = {5, 12}, From = "Atlantis" },
        ["Ancient Wood"] = { Price = "450", Rarity = "Legendary", WeightPool = {1, 2}, From = "None" },
        ["Cookie"] = { Price = "20", Rarity = "Limited", WeightPool = {1, 6}, From = "N/A" },
        ["Umbral Shark"] = { Price = "1000", Rarity = "Legendary", WeightPool = {1050, 1550}, From = "Keepers Altar" },
        ["Crab"] = { Price = "100", Rarity = "Uncommon", WeightPool = {6, 14}, From = "Ocean" },
        ["Solar Fragment"] = { Price = "50", Rarity = "Fragment", WeightPool = {1, 1}, From = "Ancient Isle" },
        ["Icy Goldfish"] = { Price = "800", Rarity = "Rare", WeightPool = {200, 400}, From = "Overgrowth Caves" },
        ["Scooty Salmon"] = { Price = "750", Rarity = "Limited", WeightPool = {70, 130}, From = "N/A" },
        ["Lightning Minnow"] = { Price = "120", Rarity = "Common", WeightPool = {5, 15}, From = "Atlantis" },
        ["Anchovy"] = { Price = "30", Rarity = "Common", WeightPool = {1, 3}, From = "Moosewood" },
        ["Frostling Goby"] = { Price = "180", Rarity = "Uncommon", WeightPool = {12, 28}, From = "Glacial Grotto" },
        ["Molten Banshee"] = { Price = "6500", Rarity = "Exotic", WeightPool = {3000, 5500}, From = "Roslit Volcano" },
        ["Snowflake Smelt"] = { Price = "180", Rarity = "Uncommon", WeightPool = {10, 20}, From = "Cryogenic Canal" },
        ["Log"] = { Price = "124", Rarity = "Trash", WeightPool = {45, 75}, From = "None" },
        ["Bream"] = { Price = "60", Rarity = "Common", WeightPool = {11, 27}, From = "Moosewood" },
        ["Flounder"] = { Price = "120", Rarity = "Unusual", WeightPool = {15, 55}, From = "Moosewood" },
        ["Whiptail Catfish"] = { Price = "600", Rarity = "Legendary", WeightPool = {10, 30}, From = "Moosewood" },
        ["Twilight Eel"] = { Price = "90", Rarity = "Uncommon", WeightPool = {100, 200}, From = "Vertigo" },
        ["Lovestorm Eel"] = { Price = "15000", Rarity = "Secret", WeightPool = {35000, 70000}, From = "N/A" },
        ["Gorgon Grouper"] = { Price = "1500", Rarity = "Unusual", WeightPool = {600, 1650}, From = "Veil of the Forsaken" },
        ["Pale Tang"] = { Price = "100", Rarity = "Uncommon", WeightPool = {3, 15}, From = "Keepers Altar" },
        ["Blue Whale"] = { Price = "30000", Rarity = "Exotic", WeightPool = {1300000, 3000000}, From = "Ocean" },
        ["Arctic Char"] = { Price = "80", Rarity = "Uncommon", WeightPool = {20, 60}, From = "Snowcap" },
        ["Tidal Pike"] = { Price = "1500", Rarity = "Limited", WeightPool = {1500, 2500}, From = "N/A" },
        ["Frost Minnow"] = { Price = "150", Rarity = "Uncommon", WeightPool = {8, 16}, From = "Cryogenic Canal" },
        ["Spider Crab"] = { Price = "550", Rarity = "Rare", WeightPool = {80, 250}, From = "The Depths" },
        ["Crystallized Seadragon"] = { Price = "35000", Rarity = "Secret", WeightPool = {500000, 1200000}, From = "Calm Zone" },
        ["Deep Crownfish"] = { Price = "2000", Rarity = "Legendary", WeightPool = {500, 1000}, From = "Atlantis" },
        ["Brine Phantom"] = { Price = "3000", Rarity = "Legendary", WeightPool = {4800, 6500}, From = "Brine Pool" },
        ["Largemouth Bass"] = { Price = "85", Rarity = "Common", WeightPool = {10, 45}, From = "Moosewood" },
        ["Lava Lamprey"] = { Price = "350", Rarity = "Limited", WeightPool = {450, 750}, From = "N/A" },
        ["Massive Marlin"] = { Price = "800", Rarity = "Rare", WeightPool = {200, 450}, From = "Atlantis" },
        ["Salmon"] = { Price = "130", Rarity = "Uncommon", WeightPool = {40, 100}, From = "Ocean" },
        ["Glass Diamond"] = { Price = "1500", Rarity = "Mythical", WeightPool = {25, 50}, From = "Overgrowth Caves" },
        ["Magma Leviathan"] = { Price = "25000", Rarity = "Secret", WeightPool = {60000, 140000}, From = "Volcanic Vents" },
        ["Triton's Herald"] = { Price = "500", Rarity = "Rare", WeightPool = {100, 200}, From = "Atlantis" },
        ["Spined Fin"] = { Price = "300", Rarity = "Limited", WeightPool = {20, 50}, From = "N/A" },
        ["King Jellyfish"] = { Price = "3500", Rarity = "Mythical", WeightPool = {3000, 5000}, From = "Atlantis" },
        ["Deep Emperor"] = { Price = "3000", Rarity = "Legendary", WeightPool = {2500, 5000}, From = "Atlantis" },
        ["Catfish"] = { Price = "300", Rarity = "Rare", WeightPool = {50, 150}, From = "Mushgrove" },
        ["Amblypterus"] = { Price = "2500", Rarity = "Mythical", WeightPool = {700, 1800}, From = "Ancient Archives" },
        ["Mustard"] = { Price = "19000", Rarity = "Secret", WeightPool = {10, 40}, From = "Ocean" },
        ["Cobia"] = { Price = "230", Rarity = "Rare", WeightPool = {400, 700}, From = "Ancient Isle" },
        ["Confetti Shark"] = { Price = "1200", Rarity = "Limited", WeightPool = {800, 1200}, From = "N/A" },
        ["Scylla"] = { Price = "200000", Rarity = "Secret", WeightPool = {2000000, 5000000}, From = "Veil of the Forsaken" },
        ["Crystal Wrasse"] = { Price = "450", Rarity = "Unusual", WeightPool = {40, 90}, From = "Grand Reef" },
        ["Molten Moray"] = { Price = "1300", Rarity = "Rare", WeightPool = {80, 230}, From = "Volcanic Vents" },
        ["Magma Tang"] = { Price = "130", Rarity = "Uncommon", WeightPool = {6, 30}, From = "Roslit Volcano" },
        ["Redeye Bass"] = { Price = "115", Rarity = "Unusual", WeightPool = {3, 15}, From = "Terrapin" },
        ["Carp"] = { Price = "110", Rarity = "Uncommon", WeightPool = {10, 50}, From = "Moosewood" },
        ["Void Angler"] = { Price = "4500", Rarity = "Mythical", WeightPool = {7000, 12000}, From = "Atlantean Storm" },
        ["Lingcod"] = { Price = "110", Rarity = "Unusual", WeightPool = {40, 140}, From = "Snowcap" },
        ["Hyneria"] = { Price = "145", Rarity = "Unusual", WeightPool = {10000, 18000}, From = "Ancient Isle" },
        ["Temple Drifter"] = { Price = "170", Rarity = "Uncommon", WeightPool = {25, 55}, From = "Atlantis" },
        ["Mosasaurus"] = { Price = "7500", Rarity = "Mythical", WeightPool = {90000, 140000}, From = "Ancient Isle" },
        ["Sand Dollar"] = { Price = "20", Rarity = "Common", WeightPool = {1, 2}, From = "Ocean" },
        ["Enchant Relic"] = { Price = "3500", Rarity = "Relic", WeightPool = {210, 210}, From = "None" },
        ["Hollow Flake Catfish"] = { Price = "450", Rarity = "Limited", WeightPool = {20, 50}, From = "N/A" },
        ["Serpent Surgeonfish"] = { Price = "1250", Rarity = "Uncommon", WeightPool = {850, 2100}, From = "Veil of the Forsaken" },
        ["Sea Bass"] = { Price = "95", Rarity = "Common", WeightPool = {20, 60}, From = "Ocean" },
        ["Sea Snake"] = { Price = "5000", Rarity = "Mythical", WeightPool = {300, 800}, From = "The Depths" },
        ["Shrimp"] = { Price = "45", Rarity = "Common", WeightPool = {1, 2}, From = "Ocean" },
        ["Sea Mine"] = { Price = "3000", Rarity = "Mythical", WeightPool = {2000, 3250}, From = "Desolate Deep" },
        ["Cod"] = { Price = "90", Rarity = "Uncommon", WeightPool = {20, 100}, From = "Ocean" },
        ["Cursed Eel"] = { Price = "700", Rarity = "Rare", WeightPool = {80, 250}, From = "Forsaken Shores" },
        ["Pufferfish"] = { Price = "230", Rarity = "Rare", WeightPool = {5, 20}, From = "Ocean" },
        ["Trumpetfish"] = { Price = "100", Rarity = "Unusual", WeightPool = {9, 20}, From = "Sunstone" },
        ["Grayling"] = { Price = "80", Rarity = "Common", WeightPool = {5, 20}, From = "Snowcap" },
        ["Lapis Lazuli"] = { Price = "700", Rarity = "Gemstone", WeightPool = {4, 14}, From = "Ancient Isle" },
        ["Porgy"] = { Price = "90", Rarity = "Common", WeightPool = {5, 30}, From = "Ocean" },
        ["Anomalocaris"] = { Price = "90", Rarity = "Uncommon", WeightPool = {100, 400}, From = "Ancient Isle" },
        ["Static Ray"] = { Price = "280", Rarity = "Uncommon", WeightPool = {150, 300}, From = "Atlantis" },
        ["Cookiecutter Shark"] = { Price = "500", Rarity = "Rare", WeightPool = {5, 15}, From = "Ocean" },
        ["Mythic Fish"] = { Price = "2000", Rarity = "Mythical", WeightPool = {6, 14}, From = "Ocean" },
        ["Halibut"] = { Price = "250", Rarity = "Rare", WeightPool = {1000, 2000}, From = "Ocean" },
        ["Sardine"] = { Price = "30", Rarity = "Common", WeightPool = {1, 3}, From = "Ocean" },
        ["Eldritch Horror"] = { Price = "1200", Rarity = "Rare", WeightPool = {400, 800}, From = "Atlantis" },
        ["Cutlass Fish"] = { Price = "500", Rarity = "Unusual", WeightPool = {80, 250}, From = "Forsaken Shores" },
        ["Mullet"] = { Price = "90", Rarity = "Common", WeightPool = {5, 20}, From = "Ocean" },
        ["Frostscale Fangtooth"] = { Price = "30", Rarity = "Common", WeightPool = {30, 70}, From = "Challenger's Deep" },
        ["Infant Giant Seadevil"] = { Price = "5000", Rarity = "Legendary", WeightPool = {6000, 17000}, From = "Abyssal Zenith" },
        ["Burbot"] = { Price = "80", Rarity = "Uncommon", WeightPool = {10, 35}, From = "Snowcap" },
        ["Coelacanth"] = { Price = "370", Rarity = "Rare", WeightPool = {70, 100}, From = "Ocean" },
        ["Snowback Char"] = { Price = "320", Rarity = "Unusual", WeightPool = {35, 75}, From = "Cryogenic Canal" },
        ["Rarities"] = { Price = "N/A", Rarity = "N/A", WeightPool = {}, From = "N/A" },
        ["Fish Barrel"] = { Price = "80", Rarity = "Uncommon", WeightPool = {150, 150}, From = "None" },
        ["Flying Fish"] = { Price = "1200", Rarity = "Legendary", WeightPool = {15, 50}, From = "Ocean" },
        ["Anglerfish"] = { Price = "230", Rarity = "Rare", WeightPool = {5, 20}, From = "Ocean" },
        ["Basic Present"] = { Price = "120", Rarity = "Limited", WeightPool = {90, 90}, From = "N/A" },
        ["Abyssal Devourer"] = { Price = "8000", Rarity = "Mythical", WeightPool = {12000, 24000}, From = "Atlantis" },
        ["Amberjack"] = { Price = "115", Rarity = "Uncommon", WeightPool = {200, 400}, From = "Ocean" },
        ["Chillfin Herring"] = { Price = "450", Rarity = "Rare", WeightPool = {30, 70}, From = "Cryogenic Canal" },
        ["Deep One"] = { Price = "900", Rarity = "Rare", WeightPool = {200, 450}, From = "Atlantis" },
        ["Polar Prowler"] = { Price = "1500", Rarity = "Legendary", WeightPool = {9000, 23000}, From = "Challenger's Deep" },
        ["Alligator Gar"] = { Price = "220", Rarity = "Rare", WeightPool = {200, 450}, From = "Roslit" },
        ["Inferno Hide"] = { Price = "50", Rarity = "Common", WeightPool = {30, 80}, From = "Volcanic Vents" },
        ["Yellowfin Tuna"] = { Price = "120", Rarity = "Uncommon", WeightPool = {450, 1360}, From = "Moosewood" },
        ["Phantom Megalodon"] = { Price = "20000", Rarity = "Limited", WeightPool = {500000, 670000}, From = "Ancient Isle" },
        ["Scurvy Sailfish"] = { Price = "300", Rarity = "Unusual", WeightPool = {150, 700}, From = "Forsaken Shores" },
        ["Mauve Pearl"] = { Price = "200", Rarity = "Rare", WeightPool = {1, 4}, From = "Roslit" },
        ["Bull Shark"] = { Price = "400", Rarity = "Legendary", WeightPool = {900, 1300}, From = "Ocean" },
        ["Kraken's Herald"] = { Price = "3000", Rarity = "Legendary", WeightPool = {2500, 5000}, From = "Atlantis" },
        ["Smoldering Stingray"] = { Price = "900", Rarity = "Unusual", WeightPool = {80, 170}, From = "Volcanic Vents" },
        ["Ancient Algae"] = { Price = "50", Rarity = "Limited", WeightPool = {25, 50}, From = "N/A" },
        ["Moonfish"] = { Price = "1800", Rarity = "Legendary", WeightPool = {2500, 5000}, From = "Ocean" },
        ["Crown Bass"] = { Price = "1200", Rarity = "Legendary", WeightPool = {20, 60}, From = "Ocean" },
        ["Cinder Carp"] = { Price = "600", Rarity = "Limited", WeightPool = {50, 80}, From = "N/A" },
        ["Iceberg Isopod"] = { Price = "400", Rarity = "Rare", WeightPool = {95, 240}, From = "Challenger's Deep" },
        ["Bait Crate"] = { Price = "75", Rarity = "Uncommon", WeightPool = {80, 80}, From = "None" },
        ["Emperor Jellyfish"] = { Price = "6000", Rarity = "Mythical", WeightPool = {5000, 8000}, From = "Desolate Deep" },
        ["Olm"] = { Price = "900", Rarity = "Legendary", WeightPool = {1, 4}, From = "Terrapin" },
        ["Angelfish"] = { Price = "120", Rarity = "Unusual", WeightPool = {5, 20}, From = "Roslit" },
        ["Onychodus"] = { Price = "115", Rarity = "Uncommon", WeightPool = {1000, 1400}, From = "Ancient Isle" },
        ["Oyster"] = { Price = "30", Rarity = "Uncommon", WeightPool = {2, 5}, From = "Ocean" },
        ["Great Hammerhead Shark"] = { Price = "5500", Rarity = "Mythical", WeightPool = {2300, 5000}, From = "Ocean" },
        ["Sea Pickle"] = { Price = "2000", Rarity = "Mythical", WeightPool = {4, 10}, From = "Ocean" },
        ["Sapphire Stargazer"] = { Price = "1300", Rarity = "Unusual", WeightPool = {500, 1400}, From = "Calm Zone" },
        ["Ruby"] = { Price = "200", Rarity = "Gemstone", WeightPool = {7, 20}, From = "Ancient Isle" },
        ["Earth Fragment"] = { Price = "0", Rarity = "Fragment", WeightPool = {1, 1}, From = "Ancient Isle" },
        ["Smallmouth Bass"] = { Price = "70", Rarity = "Common", WeightPool = {5, 17}, From = "Terrapin" },
        ["Snowfish"] = { Price = "800", Rarity = "Rare", WeightPool = {200, 450}, From = "Frigid Cavern" },
        ["Ancient Depth Serpent"] = { Price = "8000", Rarity = "Exotic", WeightPool = {5000, 10000}, From = "The Depths" },
        ["Shark Fang"] = { Price = "135", Rarity = "Limited", WeightPool = {30, 50}, From = "N/A" },
        ["Red Energy Crystal"] = { Price = "5", Rarity = "Mythical", WeightPool = {25, 50}, From = "None" },
        ["Ruby Rasbora"] = { Price = "1400", Rarity = "Rare", WeightPool = {395, 1000}, From = "Calm Zone" },
        ["Blistered Eel"] = { Price = "300", Rarity = "Limited", WeightPool = {115, 190}, From = "N/A" },
        ["Whale Shark"] = { Price = "6500", Rarity = "Mythical", WeightPool = {80000, 100000}, From = "Ocean" },
        ["Deep Freeze Devilfish"] = { Price = "300", Rarity = "Unusual", WeightPool = {90, 190}, From = "Challenger's Deep" },
        ["Ancient Serpent Spine"] = { Price = "800", Rarity = "Limited", WeightPool = {30, 80}, From = "N/A" },
        ["Chronos Deep Swimmer"] = { Price = "400", Rarity = "Unusual", WeightPool = {55, 100}, From = "Atlantis" },
        ["Resin"] = { Price = "800", Rarity = "Secret", WeightPool = {30, 80}, From = "Mushgrove Swamp" },
        ["Crystal Carp"] = { Price = "375", Rarity = "Limited", WeightPool = {10, 18}, From = "N/A" },
        ["White Bass"] = { Price = "110", Rarity = "Uncommon", WeightPool = {3, 25}, From = "Terrapin" },
        ["Alligator"] = { Price = "700", Rarity = "Legendary", WeightPool = {1500, 3000}, From = "Mushgrove" },
        ["Swamp Bass"] = { Price = "60", Rarity = "Common", WeightPool = {20, 60}, From = "Mushgrove" },
        ["White Perch"] = { Price = "80", Rarity = "Common", WeightPool = {2, 12}, From = "Mushgrove" },
        ["Lovestorm Eel Supercharged"] = { Price = "25000", Rarity = "Secret", WeightPool = {60000, 105000}, From = "N/A" },
        ["Dunkleosteus"] = { Price = "3500", Rarity = "Legendary", WeightPool = {12000, 30000}, From = "Ancient Isle" },
        ["Chillback Whitefish"] = { Price = "280", Rarity = "Unusual", WeightPool = {25, 55}, From = "Glacial Grotto" },
        ["Poseidon's Perch"] = { Price = "70", Rarity = "Common", WeightPool = {10, 25}, From = "Atlantis" },
        ["Sawfish"] = { Price = "1500", Rarity = "Legendary", WeightPool = {4000, 6000}, From = "Ocean" },
        ["Rock"] = { Price = "15", Rarity = "Trash", WeightPool = {150, 210}, From = "None" },
        ["Mussel"] = { Price = "20", Rarity = "Common", WeightPool = {1, 2}, From = "Ocean" },
        ["Common Crate"] = { Price = "80", Rarity = "Uncommon", WeightPool = {80, 80}, From = "None" },
        ["Ancient Kraken"] = { Price = "50000", Rarity = "Secret", WeightPool = {100000, 200000}, From = "Atlantis" },
        ["Blue Tang"] = { Price = "90", Rarity = "Uncommon", WeightPool = {3, 15}, From = "Roslit" },
        ["Cyclone Scorpionfish"] = { Price = "1800", Rarity = "Rare", WeightPool = {460, 1200}, From = "Veil of the Forsaken" },
        ["Brine Shrimp"] = { Price = "230", Rarity = "Uncommon", WeightPool = {1, 3}, From = "Brine Pool" },
        ["Scalding Swordfish"] = { Price = "4000", Rarity = "Legendary", WeightPool = {10000, 25000}, From = "Volcanic Vents" },
        ["Gilded Pearl"] = { Price = "120", Rarity = "Unusual", WeightPool = {1, 4}, From = "Roslit" },
        ["Globe Jellyfish"] = { Price = "300", Rarity = "Unusual", WeightPool = {140, 240}, From = "Brine Pool" },
        ["Moonstone"] = { Price = "1000", Rarity = "Gemstone", WeightPool = {5, 28}, From = "Ancient Isle" },
        ["Blackfish"] = { Price = "100", Rarity = "Uncommon", WeightPool = {5, 20}, From = "Snowcap" },
        ["Meg's Spine"] = { Price = "1500", Rarity = "Mythical", WeightPool = {25, 50}, From = "None" },
        ["Crystal Chorus"] = { Price = "160", Rarity = "Uncommon", WeightPool = {25, 50}, From = "Atlantis" },
        ["Chinfish"] = { Price = "85", Rarity = "Uncommon", WeightPool = {20, 40}, From = "Sunstone" },
        ["Haddock"] = { Price = "50", Rarity = "Common", WeightPool = {15, 40}, From = "Ocean" },
        ["Infernal Iguanafish"] = { Price = "120", Rarity = "Uncommon", WeightPool = {8, 20}, From = "Volcanic Vents" },
        ["Titanic Sturgeon"] = { Price = "900", Rarity = "Rare", WeightPool = {250, 500}, From = "Atlantis" },
        ["Icy Tuna"] = { Price = "600", Rarity = "Rare", WeightPool = {100, 250}, From = "Overgrowth Caves" },
        ["Aurora Trout"] = { Price = "6000", Rarity = "Mythical", WeightPool = {2000, 4000}, From = "Cryogenic Canal" },
        ["Blisterback Blenny"] = { Price = "6300", Rarity = "Mythical", WeightPool = {10000, 28000}, From = "Volcanic Vents" },
        ["Ice Jellyfish"] = { Price = "280", Rarity = "Unusual", WeightPool = {20, 45}, From = "Frigid Cavern" },
        ["Yellow Boxfish"] = { Price = "140", Rarity = "Unusual", WeightPool = {5, 20}, From = "Roslit" },
        ["Sea Turtle"] = { Price = "2000", Rarity = "Mythical", WeightPool = {700, 1500}, From = "Terrapin" },
        ["Rose Pearl"] = { Price = "145", Rarity = "Unusual", WeightPool = {1, 4}, From = "Roslit" },
        ["Storm Eel"] = { Price = "550", Rarity = "Unusual", WeightPool = {400, 800}, From = "Atlantis" },
        ["Thunder Serpent"] = { Price = "2500", Rarity = "Legendary", WeightPool = {1000, 2000}, From = "Atlantis" },
        ["Ancient Fragment"] = { Price = "500", Rarity = "Fragment", WeightPool = {1, 1}, From = "Ancient Isle" },
        ["Void Emperor"] = { Price = "6000", Rarity = "Mythical", WeightPool = {7000, 12000}, From = "Atlantis" },
        ["Black Dragon Fish"] = { Price = "500", Rarity = "Rare", WeightPool = {150, 400}, From = "The Depths" },
        ["Pumpkinseed"] = { Price = "90", Rarity = "Uncommon", WeightPool = {1, 5}, From = "Roslit" },
        ["Carbon Crate"] = { Price = "140", Rarity = "Rare", WeightPool = {160, 160}, From = "None" },
        ["Coral Chromis"] = { Price = "120", Rarity = "Common", WeightPool = {5, 20}, From = "Grand Reef" },
        ["Nessie"] = { Price = "6500", Rarity = "Limited", WeightPool = {20000, 40000}, From = "N/A" },
        ["Pyrogrub"] = { Price = "340", Rarity = "Rare", WeightPool = {300, 600}, From = "Roslit Volcano" },
        ["Crowned Anglerfish"] = { Price = "22000", Rarity = "Secret", WeightPool = {80000, 180000}, From = "Abyssal Zenith" },
        ["Glacier Glowfish"] = { Price = "1800", Rarity = "Limited", WeightPool = {80, 150}, From = "N/A" },
        ["Titan Tuna"] = { Price = "220", Rarity = "Uncommon", WeightPool = {30, 70}, From = "Atlantis" },
        ["Stalactite"] = { Price = "35", Rarity = "Trash", WeightPool = {60, 130}, From = "Desolate Deep" },
        ["Depth Octopus"] = { Price = "175", Rarity = "Unusual", WeightPool = {30, 80}, From = "The Depths" },
        ["Isonade"] = { Price = "8000", Rarity = "Mythical", WeightPool = {6000, 13000}, From = "Vertigo" },
        ["Deeplight Footballfish"] = { Price = "1000", Rarity = "Rare", WeightPool = {175, 400}, From = "Abyssal Zenith" },
        ["Supreme Present"] = { Price = "650", Rarity = "Limited", WeightPool = {90, 90}, From = "N/A" },
        ["Reef Parrotfish"] = { Price = "900", Rarity = "Rare", WeightPool = {70, 200}, From = "Grand Reef" },
        ["Forsaken Algae"] = { Price = "50", Rarity = "Limited", WeightPool = {25, 50}, From = "N/A" },
        ["Grey Carp"] = { Price = "120", Rarity = "Uncommon", WeightPool = {20, 70}, From = "Mushgrove" },
        ["Cladoselache"] = { Price = "90", Rarity = "Common", WeightPool = {180, 240}, From = "Ancient Isle" },
        ["Sea Urchin"] = { Price = "320", Rarity = "Rare", WeightPool = {2, 9}, From = "Ocean" },
        ["Goldfish"] = { Price = "65", Rarity = "Uncommon", WeightPool = {2, 7}, From = "Moosewood" },
        ["Exalted Relic"] = { Price = "12000", Rarity = "Relic", WeightPool = {210, 210}, From = "None" },
        ["Sweetfish"] = { Price = "40", Rarity = "Common", WeightPool = {2, 5}, From = "Sunstone" },
        ["Quartzfin Queenfish"] = { Price = "300", Rarity = "Common", WeightPool = {180, 400}, From = "Calm Zone" },
        ["Siren Singer"] = { Price = "380", Rarity = "Unusual", WeightPool = {50, 95}, From = "Atlantis" },
        ["Sunfish"] = { Price = "1500", Rarity = "Legendary", WeightPool = {4000, 10000}, From = "Sunstone" },
        ["Zombiefish"] = { Price = "200", Rarity = "Limited", WeightPool = {15, 30}, From = "N/A" },
        ["Acanthodii"] = { Price = "160", Rarity = "Unusual", WeightPool = {130, 160}, From = "Ancient Isle" },
        ["Phantom Ray"] = { Price = "140", Rarity = "Uncommon", WeightPool = {40, 60}, From = "Desolate Deep" },
        ["Dumbo Octopus"] = { Price = "900", Rarity = "Legendary", WeightPool = {15, 40}, From = "Roslit" },
        ["Frigid Taco"] = { Price = "600", Rarity = "Rare", WeightPool = {100, 250}, From = "Frigid Cavern" },
        ["Clownfish"] = { Price = "90", Rarity = "Uncommon", WeightPool = {1, 6}, From = "Roslit" },
        ["Frozen Pike"] = { Price = "650", Rarity = "Rare", WeightPool = {100, 250}, From = "Cryogenic Canal" },
        ["Axolotl"] = { Price = "1000", Rarity = "Legendary", WeightPool = {5, 15}, From = "Roslit" },
        ["Atlantean Anchovy"] = { Price = "40", Rarity = "Common", WeightPool = {2, 8}, From = "Atlantis" },
        ["RarityColours"] = { Price = "N/A", Rarity = "N/A", WeightPool = {}, From = "N/A" },
        ["Reef Goby"] = { Price = "200", Rarity = "Uncommon", WeightPool = {10, 30}, From = "Grand Reef" },
        ["Tempest Ray"] = { Price = "250", Rarity = "Uncommon", WeightPool = {5, 20}, From = "Atlantean Storm" },
        ["Icefang Barracuda"] = { Price = "650", Rarity = "Rare", WeightPool = {200, 450}, From = "Glacial Grotto" },
        ["Swamp Scallop"] = { Price = "150", Rarity = "Unusual", WeightPool = {6, 14}, From = "Mushgrove" },
        ["Frozen Leviathan"] = { Price = "18000", Rarity = "Secret", WeightPool = {60000, 140000}, From = "Challenger's Deep" },
        ["Spiderfish"] = { Price = "30", Rarity = "Common", WeightPool = {3, 10}, From = "Vertigo" },
        ["Butterflyfish"] = { Price = "110", Rarity = "Uncommon", WeightPool = {2, 15}, From = "Roslit" },
        ["Eyefestation"] = { Price = "3000", Rarity = "Legendary", WeightPool = {4800, 6500}, From = "N/A" },
        ["Santa Salmon"] = { Price = "120", Rarity = "Limited", WeightPool = {80, 200}, From = "N/A" },
        ["Gingerbread Fish"] = { Price = "135", Rarity = "Limited", WeightPool = {20, 35}, From = "N/A" },
        ["Barreleye Fish"] = { Price = "4500", Rarity = "Mythical", WeightPool = {50, 150}, From = "The Depths" },
        ["Abyssal Bearded Seadevil"] = { Price = "120", Rarity = "Uncommon", WeightPool = {180, 400}, From = "Abyssal Zenith" },
        ["Nautilus"] = { Price = "1000", Rarity = "Legendary", WeightPool = {400, 800}, From = "The Depths" },
        ["Shadowfang Snapper"] = { Price = "200", Rarity = "Uncommon", WeightPool = {20, 50}, From = "Atlantis" },
        ["Deep Pearl"] = { Price = "880", Rarity = "Legendary", WeightPool = {1, 4}, From = "Roslit" },
        ["Night Shrimp"] = { Price = "55", Rarity = "Common", WeightPool = {1, 2}, From = "Vertigo" },
        ["Nessie's Spine"] = { Price = "250", Rarity = "Limited", WeightPool = {40, 80}, From = "N/A" },
        ["Glass of Milk"] = { Price = "20", Rarity = "Limited", WeightPool = {1, 6}, From = "N/A" },
        ["Ribbon Eel"] = { Price = "150", Rarity = "Unusual", WeightPool = {5, 150}, From = "Roslit" },
        ["Clam"] = { Price = "13", Rarity = "Unusual", WeightPool = {9, 10}, From = "Roslit" },
        ["Ice"] = { Price = "15", Rarity = "Trash", WeightPool = {40, 60}, From = "Snowcap" },
        ["Green Energy Crystal"] = { Price = "0", Rarity = "Mythical", WeightPool = {25, 50}, From = "None" },
        ["Frilled Shark"] = { Price = "150", Rarity = "Unusual", WeightPool = {40, 90}, From = "The Depths" },
        ["Frostbite Flounder"] = { Price = "750", Rarity = "Rare", WeightPool = {150, 300}, From = "Glacial Grotto" },
        ["Frigid Antlers"] = { Price = "1200", Rarity = "Legendary", WeightPool = {500, 1000}, From = "Overgrowth Caves" },
        ["Titanic Black Seadevil"] = { Price = "45", Rarity = "Common", WeightPool = {55, 105}, From = "Abyssal Zenith" },
        ["Kraken Koi"] = { Price = "1100", Rarity = "Uncommon", WeightPool = {1000, 2800}, From = "Veil of the Forsaken" },
        ["Shipwreck Barracuda"] = { Price = "1200", Rarity = "Legendary", WeightPool = {100, 300}, From = "Forsaken Shores" },
        ["Ginsu Shark"] = { Price = "3000", Rarity = "Legendary", WeightPool = {7800, 10000}, From = "Ancient Isle" },
        ["Spine Bone"] = { Price = "80", Rarity = "Limited", WeightPool = {30, 60}, From = "N/A" },
        ["Chinook Salmon"] = { Price = "230", Rarity = "Unusual", WeightPool = {100, 400}, From = "Terrapin" },
        ["Shimmering Silverside"] = { Price = "7800", Rarity = "Mythical", WeightPool = {250, 700}, From = "Calm Zone" },
        ["Birgeria"] = { Price = "200", Rarity = "Unusual", WeightPool = {500, 1200}, From = "Ancient Archives" },
        ["Festive Bait Crate"] = { Price = "500", Rarity = "Limited", WeightPool = {80, 80}, From = "N/A" },
        ["Banditfish"] = { Price = "250", Rarity = "Rare", WeightPool = {150, 200}, From = "Desolate Deep" },
        ["Oracle Minnow"] = { Price = "50", Rarity = "Common", WeightPool = {2, 7}, From = "Atlantis" },
        ["Rockstar Hermit Crab"] = { Price = "65", Rarity = "Unusual", WeightPool = {4, 12}, From = "Desolate Deep" },
        ["Aurora Pearl"] = { Price = "2250", Rarity = "Mythical", WeightPool = {1, 4}, From = "Roslit" },
        ["Ringle"] = { Price = "900", Rarity = "Mythical", WeightPool = {1, 4}, From = "Snowcap" },
        ["Voidscale Guppy"] = { Price = "650", Rarity = "Rare", WeightPool = {150, 300}, From = "Atlantis" },
        ["Orca"] = { Price = "12000", Rarity = "Exotic", WeightPool = {10000, 15000}, From = "Ocean" },
        ["Ancient Eel"] = { Price = "1500", Rarity = "Legendary", WeightPool = {1000, 2000}, From = "The Depths" },
        ["Fossil Fan"] = { Price = "60", Rarity = "Limited", WeightPool = {25, 50}, From = "N/A" },
        ["Barbed Shark"] = { Price = "8300", Rarity = "Legendary", WeightPool = {7000, 9500}, From = "Desolate Deep" },
        ["Scallop"] = { Price = "100", Rarity = "Uncommon", WeightPool = {2, 5}, From = "Ocean" },
        ["Chub"] = { Price = "40", Rarity = "Common", WeightPool = {10, 30}, From = "Roslit" },
        ["Piranha"] = { Price = "85", Rarity = "Common", WeightPool = {20, 50}, From = "Ancient Isle" },
        ["Deep-sea Dragonfish"] = { Price = "45", Rarity = "Common", WeightPool = {8, 40}, From = "The Depths" },
        ["Luminescent Minnow"] = { Price = "120", Rarity = "Unusual", WeightPool = {2, 8}, From = "The Depths" },
        ["Frostjaw Cod"] = { Price = "2000", Rarity = "Legendary", WeightPool = {500, 1000}, From = "Cryogenic Canal" },
        ["Wiifish"] = { Price = "1200", Rarity = "Legendary", WeightPool = {200, 400}, From = "Sunstone" },
        ["Treble Bass"] = { Price = "4000", Rarity = "Exotic", WeightPool = {10, 45}, From = "Moosewood" },
        ["Eel"] = { Price = "130", Rarity = "Unusual", WeightPool = {8, 45}, From = "Moosewood" },
        ["Bluegill"] = { Price = "60", Rarity = "Common", WeightPool = {1, 6}, From = "Snowcap" },
        ["Cyclone Mako"] = { Price = "1200", Rarity = "Rare", WeightPool = {400, 800}, From = "Atlantean Storm" },
        ["Obsidian Salmon"] = { Price = "600", Rarity = "Legendary", WeightPool = {40, 180}, From = "Roslit Volcano" },
        ["Palaeoniscum"] = { Price = "125", Rarity = "Unusual", WeightPool = {25, 700}, From = "Ancient Archives" },
        ["Scrap Metal"] = { Price = "40", Rarity = "Trash", WeightPool = {10, 50}, From = "The Depths" },
        ["Glacier Pike"] = { Price = "230", Rarity = "Unusual", WeightPool = {12, 35}, From = "Snowcap" },
        ["Mushgrove Crab"] = { Price = "330", Rarity = "Rare", WeightPool = {6, 14}, From = "Mushgrove" },
        ["Titanfang Grouper"] = { Price = "1000", Rarity = "Rare", WeightPool = {300, 600}, From = "Atlantis" },
        ["Typhoon Tailfin"] = { Price = "9000", Rarity = "Legendary", WeightPool = {12000, 34000}, From = "Veil of the Forsaken" },
        ["Ember Snapper"] = { Price = "200", Rarity = "Unusual", WeightPool = {60, 120}, From = "Roslit Volcano" },
        ["Dolphin"] = { Price = "1200", Rarity = "Legendary", WeightPool = {1500, 2000}, From = "Ocean" },
        ["Longtail Bass"] = { Price = "120", Rarity = "Uncommon", WeightPool = {20, 40}, From = "Sunstone" },
        ["Echo Fisher"] = { Price = "190", Rarity = "Uncommon", WeightPool = {30, 65}, From = "Atlantis" },
        ["Santa Pufferfish"] = { Price = "2000", Rarity = "Limited", WeightPool = {8, 25}, From = "N/A" },
        ["Arapaima"] = { Price = "250", Rarity = "Rare", WeightPool = {1000, 2000}, From = "Roslit" },
        ["Hellfire Haddock"] = { Price = "50", Rarity = "Common", WeightPool = {25, 60}, From = "Volcanic Vents" },
        ["Atlantean Alchemist"] = { Price = "800", Rarity = "Rare", WeightPool = {200, 400}, From = "Atlantis" },
        ["Shortfin Mako Shark"] = { Price = "190", Rarity = "Common", WeightPool = {250, 1000}, From = "Forsaken Shores" },
        ["Barracuda"] = { Price = "150", Rarity = "Uncommon", WeightPool = {55, 110}, From = "Ocean" },
        ["King Oyster"] = { Price = "200", Rarity = "Rare", WeightPool = {4, 10}, From = "Terrapin" },
        ["Driftwood"] = { Price = "10", Rarity = "Trash", WeightPool = {6, 6}, From = "None" },
        ["Amethyst"] = { Price = "150", Rarity = "Gemstone", WeightPool = {8, 16}, From = "Ancient Isle" },
        ["Red Snapper"] = { Price = "70", Rarity = "Common", WeightPool = {10, 70}, From = "Moosewood" },
        ["Ancient Megalodon"] = { Price = "16000", Rarity = "Exotic", WeightPool = {500000, 700000}, From = "Ancient Isle" },
        ["Manta Ray"] = { Price = "3000", Rarity = "Mythical", WeightPool = {7750, 10000}, From = "Roslit" },
        ["Tire"] = { Price = "20", Rarity = "Trash", WeightPool = {110, 110}, From = "None" },
        ["Fangborn Gar"] = { Price = "170", Rarity = "Unusual", WeightPool = {170, 380}, From = "Vertigo" },
        ["Obsidian Swordfish"] = { Price = "2500", Rarity = "Mythical", WeightPool = {1000, 2500}, From = "Roslit Volcano" },
        ["Opal"] = { Price = "500", Rarity = "Gemstone", WeightPool = {9, 32}, From = "Ancient Isle" },
        ["Twilight Glowfish"] = { Price = "650", Rarity = "Rare", WeightPool = {150, 300}, From = "Atlantis" },
        ["Abyssal King"] = { Price = "4000", Rarity = "Legendary", WeightPool = {3000, 6000}, From = "Atlantis" },
        ["Candy Fish"] = { Price = "200", Rarity = "Limited", WeightPool = {5, 10}, From = "N/A" },
        ["Ember Perch"] = { Price = "160", Rarity = "Unusual", WeightPool = {4, 15}, From = "Roslit Volcano" },
        ["Perch"] = { Price = "70", Rarity = "Common", WeightPool = {2, 12}, From = "Roslit" },
        ["Nurse Shark"] = { Price = "200", Rarity = "Unusual", WeightPool = {1000, 1500}, From = "Ocean" },
        ["Floppy"] = { Price = "2000", Rarity = "Legendary", WeightPool = {80, 100}, From = "Ancient Isle" },
        ["Pike"] = { Price = "230", Rarity = "Unusual", WeightPool = {12, 35}, From = "Moosewood" },
        ["Pond Emperor"] = { Price = "900", Rarity = "Legendary", WeightPool = {1000, 2500}, From = "Snowcap" },
        ["Great White Shark"] = { Price = "6000", Rarity = "Mythical", WeightPool = {7000, 12000}, From = "Ocean" },
        ["Ornament Fish"] = { Price = "140", Rarity = "Limited", WeightPool = {3, 7}, From = "N/A" },
        ["Voltfish"] = { Price = "2200", Rarity = "Mythical", WeightPool = {8, 16}, From = "Sunstone" },
        ["Hourglass Bass"] = { Price = "3000", Rarity = "Limited", WeightPool = {8000, 12000}, From = "N/A" },
        ["Prawn"] = { Price = "45", Rarity = "Uncommon", WeightPool = {1, 5}, From = "Ocean" },
        ["Sockeye Salmon"] = { Price = "45", Rarity = "Common", WeightPool = {20, 70}, From = "Moosewood" },
        ["Basalt"] = { Price = "15", Rarity = "Trash", WeightPool = {150, 210}, From = "Roslit Volcano" },
        ["Pearl"] = { Price = "60", Rarity = "Common", WeightPool = {1, 4}, From = "Roslit" },
        ["Skelefish"] = { Price = "200", Rarity = "Limited", WeightPool = {5, 10}, From = "N/A" },
        ["Giant Seadevil"] = { Price = "9000", Rarity = "Mythical", WeightPool = {20000, 50000}, From = "Abyssal Zenith" },
        ["Suckermouth Catfish"] = { Price = "160", Rarity = "Rare", WeightPool = {95, 170}, From = "Roslit" },
        ["Squid"] = { Price = "140", Rarity = "Unusual", WeightPool = {5, 25}, From = "Roslit" },
        ["Mage Marlin"] = { Price = "2500", Rarity = "Legendary", WeightPool = {1000, 2000}, From = "Atlantis" },
        ["Voidglow Ghostfish"] = { Price = "7500", Rarity = "Legendary", WeightPool = {8000, 23000}, From = "Abyssal Zenith" },
        ["Glassfish"] = { Price = "45", Rarity = "Common", WeightPool = {1, 4}, From = "Sunstone" },
        ["Deep-sea Hatchetfish"] = { Price = "35", Rarity = "Common", WeightPool = {5, 35}, From = "The Depths" },
        ["Swordfish"] = { Price = "850", Rarity = "Rare", WeightPool = {1000, 2500}, From = "Ocean" },
        ["Turkey"] = { Price = "4000", Rarity = "Limited", WeightPool = {80, 300}, From = "N/A" },
        ["Mushgrove Algae"] = { Price = "50", Rarity = "Limited", WeightPool = {25, 50}, From = "N/A" },
        ["Bowfin"] = { Price = "100", Rarity = "Uncommon", WeightPool = {30, 60}, From = "Mushgrove" },
        ["Voidfin Mahi"] = { Price = "450", Rarity = "Rare", WeightPool = {75, 155}, From = "Vertigo" },
        ["Mosaic Swimmer"] = { Price = "150", Rarity = "Uncommon", WeightPool = {20, 40}, From = "Atlantis" },
        ["Marble Maiden"] = { Price = "120", Rarity = "Uncommon", WeightPool = {15, 35}, From = "Atlantis" },
        ["Barracuda's Spine"] = { Price = "50", Rarity = "Limited", WeightPool = {25, 50}, From = "N/A" },
        ["Leviathan Humpback Anglerfish"] = { Price = "40", Rarity = "Common", WeightPool = {35, 80}, From = "Abyssal Zenith" },
        ["Fungal Cluster"] = { Price = "9", Rarity = "Trash", WeightPool = {9, 9}, From = "Mushgrove" },
        ["Herring"] = { Price = "70", Rarity = "Common", WeightPool = {5, 11}, From = "Snowcap" },
        ["Cockatoo Squid"] = { Price = "200", Rarity = "Unusual", WeightPool = {4, 20}, From = "Desolate Deep" },
        ["Sparkfin Tetra"] = { Price = "90", Rarity = "Common", WeightPool = {50, 120}, From = "Atlantis" },
        ["Mahi Mahi"] = { Price = "150", Rarity = "Rare", WeightPool = {70, 150}, From = "Sunstone" },
        ["Frozen Walnut"] = { Price = "2500", Rarity = "Mythical", WeightPool = {500, 1000}, From = "Overgrowth Caves" },
        ["Abyssal Goliath"] = { Price = "6000", Rarity = "Mythical", WeightPool = {7000, 12000}, From = "Atlantis" },
        ["Stormcloud Angelfish"] = { Price = "310", Rarity = "Rare", WeightPool = {600, 1200}, From = "Atlantis" },
        ["Northstar Serpent"] = { Price = "20000", Rarity = "Limited", WeightPool = {140000, 200000}, From = "N/A" },
        ["Molten Minnow"] = { Price = "400", Rarity = "Limited", WeightPool = {4, 7}, From = "N/A" },
        ["Banana"] = { Price = "18500", Rarity = "Secret", WeightPool = {4, 10}, From = "Ancient Isle" },
        ["Unique Present"] = { Price = "180", Rarity = "Limited", WeightPool = {90, 90}, From = "N/A" },
        ["Coral Geode"] = { Price = "200", Rarity = "Uncommon", WeightPool = {180, 180}, From = "Desolate Deep" },
        ["Red Tang"] = { Price = "100", Rarity = "Uncommon", WeightPool = {3, 15}, From = "Sunstone" },
        ["Candy Cane Carp"] = { Price = "75", Rarity = "Limited", WeightPool = {10, 50}, From = "N/A" },
        ["Whisker Bill"] = { Price = "3100", Rarity = "Mythical", WeightPool = {350, 1000}, From = "Moosewood" },
        ["Reef Minnow"] = { Price = "85", Rarity = "Common", WeightPool = {1, 6}, From = "Grand Reef" },
        ["Claw Gill"] = { Price = "60", Rarity = "Limited", WeightPool = {15, 30}, From = "N/A" },
        ["Eternal Frostwhale"] = { Price = "12000", Rarity = "Limited", WeightPool = {10000, 15000}, From = "N/A" },
        ["Reefrunner Snapper"] = { Price = "750", Rarity = "Rare", WeightPool = {80, 250}, From = "Forsaken Shores" },
        ["Handfish"] = { Price = "1000", Rarity = "Mythical", WeightPool = {20, 60}, From = "Mushgrove" },
        ["Blue Energy Crystal"] = { Price = "0", Rarity = "Mythical", WeightPool = {25, 50}, From = "None" },
        ["Snowflake Flounder"] = { Price = "145", Rarity = "Limited", WeightPool = {15, 55}, From = "N/A" },
        ["Zeus' Herald"] = { Price = "5000", Rarity = "Mythical", WeightPool = {1500, 3000}, From = "Atlantis" },
        ["Snowgill Dace"] = { Price = "160", Rarity = "Uncommon", WeightPool = {10, 25}, From = "Glacial Grotto" },
        ["Frigid Crab"] = { Price = "300", Rarity = "Unusual", WeightPool = {15, 35}, From = "Overgrowth Caves" },
        ["Three-eyed Fish"] = { Price = "200", Rarity = "Unusual", WeightPool = {20, 60}, From = "The Depths" },
        ["Frigid Shrimp"] = { Price = "175", Rarity = "Uncommon", WeightPool = {3, 8}, From = "Frigid Cavern" },
        ["Cryoskin"] = { Price = "50", Rarity = "Common", WeightPool = {30, 80}, From = "Challenger's Deep" },
        ["Aqua Scribe"] = { Price = "60", Rarity = "Common", WeightPool = {4, 11}, From = "Atlantis" },
        ["Glacier Swordfish"] = { Price = "1000", Rarity = "Rare", WeightPool = {200, 450}, From = "Glacial Grotto" },
        ["Shiverfin Haddock"] = { Price = "500", Rarity = "Rare", WeightPool = {50, 120}, From = "Glacial Grotto" },
        ["Subzero Stargazer"] = { Price = "100", Rarity = "Uncommon", WeightPool = {20, 45}, From = "Challenger's Deep" },
        ["Volcanic Geode"] = { Price = "200", Rarity = "Rare", WeightPool = {200, 200}, From = "Roslit Volcano" },
        ["Golden Sea Pearl"] = { Price = "3500", Rarity = "Exotic", WeightPool = {1, 4}, From = "Roslit" },
        ["Rubber Ducky"] = { Price = "900", Rarity = "Legendary", WeightPool = {1, 7}, From = "Vertigo" },
        ["Marsh Gar"] = { Price = "280", Rarity = "Rare", WeightPool = {170, 380}, From = "Mushgrove" },
        ["Ice Eel"] = { Price = "155", Rarity = "Uncommon", WeightPool = {8, 20}, From = "Frigid Cavern" },
        ["Keepers Guardian"] = { Price = "250", Rarity = "Rare", WeightPool = {200, 400}, From = "Keepers Altar" },
        ["Tentacle Eel"] = { Price = "450", Rarity = "Unusual", WeightPool = {100, 200}, From = "Atlantis" },
        ["Ghoulfish"] = { Price = "1000", Rarity = "Limited", WeightPool = {45, 120}, From = "N/A" },
        ["Diamond Discus"] = { Price = "1200", Rarity = "Uncommon", WeightPool = {800, 1750}, From = "Calm Zone" },
        ["Coral Emperor"] = { Price = "4000", Rarity = "Legendary", WeightPool = {150, 300}, From = "Grand Reef" },
   }
} ]]

------------
 
 local MainTab = Window:CreateTab("Main", 124714113910876)
 
 
 Rayfield:Notify({
    Title = "Welcome to Cookie Hub!",
    Content = "Don't forget to save the configs!",
    Duration = 6.5,
    Image = 124714113910876,
 })
 
 -- Define essential variables
 local Players = game:GetService("Players")
 local LocalPlayer = Players.LocalPlayer
 local ReplicatedStorage = game:GetService("ReplicatedStorage")
 local VirtualInputManager = game:GetService("VirtualInputManager")
 local GuiService = game:GetService("GuiService")
 
 --------------------------------------------------------------------

local function Shake()
   local PlayerGUI = LocalPlayer:FindFirstChild("PlayerGui")
local shakeUI = PlayerGUI and PlayerGUI:FindFirstChild("shakeui")

if shakeUI and shakeUI.Enabled then
    local safezone = shakeUI:FindFirstChild("safezone")
    if safezone then
        local button = safezone:FindFirstChild("button")
        if button and button:IsA("ImageButton") and button.Visible then
          GuiService.SelectedObject = button
          VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
          VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
       end
    end
  end
end

local function Shake2()
   local PlayerGUI = LocalPlayer:FindFirstChild("PlayerGui")
local shakeUI = PlayerGUI and PlayerGUI:FindFirstChild("shakeui")

if shakeUI and shakeUI.Enabled then
    local safezone = shakeUI:FindFirstChild("safezone")
    if safezone then
        local button = safezone:FindFirstChild("button")
        if button and button:IsA("ImageButton") and button.Visible then
          GuiService.SelectedObject = button
          VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
          VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
       end
    end
  end
end

--------------------------------------------------------------------


 -- Ensure Character Loads Properly
 local function getCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
 end
 
 local Char = getCharacter()
 local Backpack = LocalPlayer:FindFirstChild("Backpack")
 
 -- Auto Variables
 _G.AutoCast = false
 _G.AutoShake = false
 _G.AutoReel = false
 _G.FreezeCharacter = false
 _G.AutoDropBobber = false
 _G.InstantReel = false
 
 local CharSection = MainTab:CreateSection("Character")
 
 MainTab:CreateToggle({
    Name = "Freeze Character",
    Flag = "FChar",
    Callback = function(v)
       _G.FreezeCharacter = v
       spawn(function()
          while _G.FreezeCharacter do
             Char = getCharacter()
             if Char and Char:FindFirstChild("HumanoidRootPart") then
                Char.HumanoidRootPart.Anchored = true
             end
             task.wait(0.1)
          end
          -- Unfreeze when toggled off
          Char = getCharacter()
          if Char and Char:FindFirstChild("HumanoidRootPart") then
             Char.HumanoidRootPart.Anchored = false
          end
       end)
    end
 })

MainTab:CreateToggle({
    Name = "Auto Equip Rod",
    CurrentValue = false,
    Flag = "AutoEquipRod",
    Callback = function(Value)
        _G.AutoEquipRod = Value

        while _G.AutoEquipRod do
            local player = game:GetService("Players").LocalPlayer
            local backpack = player:FindFirstChild("Backpack")

            if backpack then
                for _, tool in ipairs(backpack:GetChildren()) do
                    if tool:IsA("Tool") and tool:FindFirstChild("events") and tool.events:FindFirstChild("cast") then
                        local remote = game:GetService("ReplicatedStorage"):WaitForChild("packages"):WaitForChild("Net"):WaitForChild("RE/Backpack/Equip")
                        remote:FireServer(tool)
                        break -- you and only you
                    end
                end
            end

            task.wait(1) -- i love you
        end
    end
})





 local MainSection = MainTab:CreateSection("Main")
 
local function getRod()
    local Char = game.Players.LocalPlayer.Character
    if not Char then return nil end
    return Char:FindFirstChildOfClass("Tool")
end

local function Cast()
    local Char = game:GetService("Players").LocalPlayer.Character
    if not Char then return end

    local Rod = Char:FindFirstChildOfClass("Tool") -- Finds the fishing rod
    if Rod and Rod:FindFirstChild("events") and Rod.events:FindFirstChild("cast") then
        Rod.events.cast:FireServer(100, 1)
    else
        warn("Rod or cast event not found!")
    end
end

MainTab:CreateToggle({
    Name = "Auto Cast",
    Flag = "ACast",
    Callback = function(v)
        _G.AutoCast = v

        spawn(function()
            while _G.AutoCast do
                task.wait(1)  -- You can adjust the wait time if needed.
                
                local Rod = getRod()
                if Rod and Rod:FindFirstChild("values") and Rod.values:FindFirstChild("casted") then
                    if Rod.values.casted.Value == false then
                        Cast()  -- Perform the cast
                        -- After casting, we don't need to repeat continuously if you want it to happen once after each toggle
                    end
                else
                    warn("Rod is missing necessary properties.")
                end
            end
        end)
    end
})



 
 MainTab:CreateToggle({
    Name = "Auto Shake",
    Flag = "AShake",
    Callback = function(v)
    _G.AutoShake = v
       spawn(function()
          while _G.AutoShake do
             Shake()
             Shake2()
             task.wait(0.01)
          end
       end)
    end
 })

local function getRod()
    return Char:FindFirstChildOfClass("Tool") -- Assuming the fishing rod is a tool in the character's inventory
end

local function Reel()
    -- Wait a short delay to ensure everything is loaded
    task.wait(0.2)

    -- Search through the player's GUI for the reel UI elements
    for _, v in pairs(LocalPlayer.PlayerGui:GetChildren()) do
        if v:IsA("ScreenGui") and v.Name == "reel" then
            local bar = v:FindFirstChild("bar")
            if bar and ReplicatedStorage:FindFirstChild("events") then
                local playerbar = bar:FindFirstChild("playerbar")
                if playerbar then
                    -- Fill the player bar to simulate reeling
                    playerbar.Size = UDim2.new(1, 0, 1, 0)

                    -- Check for the "reelfinished" event and fire it
                    local reelFinished = ReplicatedStorage:FindFirstChild("events") and ReplicatedStorage.events:FindFirstChild("reelfinished")
                    if reelFinished then
                        reelFinished:FireServer(100, true)
                    else
                        warn("reelfinished event not found!")					end
                else
                    warn("Playerbar not found!")
                end
            else
                warn("Bar or events not found!")
            end
        end
    end
end

local function Reset()
    -- Ensure Char is valid before trying to reset
    local Rod = getRod()
    if Rod and Rod:FindFirstChild("events") and Rod.events:FindFirstChild("reset") then
        task.wait(0.1)
        Rod.events.reset:FireServer() -- Trigger the reset event
        -- Equip the rod again if required
        game:GetService("ReplicatedStorage").packages.Net:FindFirstChild("RE/Backpack/Equip"):FireServer(Rod)
        task.wait(0.1)
        game:GetService("ReplicatedStorage").packages.Net:FindFirstChild("RE/Backpack/Equip"):FireServer(Rod)
    else
        warn("Rod or reset event not found!")
    end
end

MainTab:CreateToggle({
    Name = "Auto Reel",
    Flag = "AReel",
    Callback = function(v)
        _G.AutoReel = v

        spawn(function()
            while _G.AutoReel do
                task.wait(1) -- Prevent excessive calls

                local Rod = getRod()
                if Rod and Rod:FindFirstChild("values") and Rod.values:FindFirstChild("bite") then
                    if Rod.values.bite.Value == true then
			task.wait(1.85)
			Reel()
			task.wait(0.5)
			Reset				
                        repeat task.wait(0.1) until Rod.values.bite.Value == false
                    end
                end
            end
        end)
    end
})
 
 --[[ MainTab:CreateToggle({
    Name = "Auto Drop Bobber",
    Flag = "DropBob",
    Callback = function(v)
       _G.AutoDropBobber = v
       spawn(function()
          while _G.AutoDropBobber do
             task.wait(0.1) -- Adjust delay as needed
             Char = getCharacter()
             local Rod = Char:FindFirstChildOfClass("Tool")
             if Rod and Rod:FindFirstChild("events") and Rod.events:FindFirstChild("cast") then
                
                if _G.FreezeCharacter then
                   Char.HumanoidRootPart.Anchored = false
                end
                
                Rod.events.cast:FireServer(100, 1)

                if _G.FreezeCharacter then
                   Char.HumanoidRootPart.Anchored = true
                end
             end
          end
       end)
    end
 }) ]]
 
local Divider = MainTab:CreateDivider()

MainTab:CreateToggle({
    Name = "Instant Reel",
    Flag = "InsReel",
    Callback = function(v)
        _G.AutoReel = v

        spawn(function()
            while _G.AutoReel do
                task.wait(1) -- Prevent excessive calls

                local Rod = getRod()
                if Rod and Rod:FindFirstChild("values") and Rod.values:FindFirstChild("bite") then
                    if Rod.values.bite.Value == true then
			task.wait(1.2)
			Reel()
			task.wait(0.5)
			Reset()
                        repeat task.wait(0.1) until Rod.values.bite.Value == false
                    end
                end
            end
        end)
    end
})

 local AutoTab = Window:CreateTab("Auto", 124714113910876)
 local AutoSection = AutoTab:CreateSection("Auto")
 
AutoTab:CreateToggle({
    Name = "Auto Sell",
    Flag = "ASell",
    Callback = function(v)
        _G.AutoSell = v
        spawn(function()
            while _G.AutoSell do
                local SellAllEvent = game:GetService("ReplicatedStorage").events:FindFirstChild("SellAll")
                if SellAllEvent then
                    SellAllEvent:InvokeServer()
                end
                task.wait(1.5)
            end
        end)
    end
})

--[[ Create Teleport Tab
local TeleportTab = Window:CreateTab("Teleport")

-- Create Section
local IslandsSection = TeleportTab:CreateSection("Islands")

-- Teleport Dropdown
TeleportTab:CreateDropdown({
    Name = "Select Island",
    Options = Islands,
    CurrentOption = {"None"},
    MultipleOptions = false,
    Callback = function(Options)
        -- Ensure the dropdown returns a valid option
        local selectedIsland = Options[1]
        if not selectedIsland then
            warn("No island selected!")
            return
        end

        print("Selected Island:", selectedIsland)

        -- Get Player and Character
        local Player = game.Players.LocalPlayer
        if not Player then
            warn("Player not found!")
            return
        end

        -- Ensure Character is loaded
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local HRP = Character and Character:FindFirstChild("HumanoidRootPart")

        if not HRP then
            warn("HumanoidRootPart not found! Try again.")
            return
        end

        -- If "None" is selected, save current position
        if selectedIsland == "None" then
            coordinates["None"] = HRP.Position
            print("Saved current position as 'None':", coordinates["None"])
            return
        end

        -- Check if the island has valid coordinates
        if coordinates[selectedIsland] then
            print("Teleporting to:", selectedIsland, coordinates[selectedIsland])
            HRP.CFrame = CFrame.new(coordinates[selectedIsland]) -- Teleport player
        else
            warn("No coordinates found for the selected island!")
        end
    end
}) ]]


local MiscTab = Window:CreateTab("Misc")
--[[local LPlayerSection = MiscTab:CreateSection("LocalPlayer")

-- WalkSpeed Input with Number Validation
MiscTab:CreateInput({
   Name = "WalkSpeed",
   CurrentValue = "16",
   PlaceholderText = "Value",
   RemoveTextAfterFocusLost = false,
   Flag = "WalkSpeed",
   Callback = function(Text)
      local num = tonumber(Text)
      if num then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = num
      else
         warn("Invalid WalkSpeed value!")
      end
   end,
})

-- JumpPower Input with Number Validation
MiscTab:CreateInput({
   Name = "JumpPower",
   CurrentValue = "50",
   PlaceholderText = "Value",
   RemoveTextAfterFocusLost = false,
   Flag = "JumpPower",
   Callback = function(Text)
      local num = tonumber(Text)
      if num then
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = num
      else
         warn("Invalid JumpPower value!")
      end
   end,
})

local waterparts = {}  
local partSize = 200  -- Size of each individual part (e.g., 200x2x200)  
local numParts = 150  -- Number of parts in each direction (adjust as needed for your map size)  
local mapSize = 30000 -- Approximate map size (in studs), adjust as needed  
  
MiscTab:CreateToggle({  
   Name = "Walk on water",  
   CurrentValue = false,  
   Flag = "walkonwater",    
   Callback = function(Value)  
       _G.WalkOnWater = Value  
  
       if Value then  
           -- Create the parts only once if they haven't been created already  
           if #waterparts == 0 then  
               local offsetX = mapSize / 2  -- Adjust for centering the grid
               local offsetZ = mapSize / 2  -- Adjust for centering the grid
               
               for i = 0, numParts - 1 do  
                   for j = 0, numParts - 1 do  
                       local waterpart = Instance.new("Part")  
                       waterpart.Size = Vector3.new(partSize, 2, partSize)  
                       
                       -- Center the grid on the map
                       waterpart.Position = Vector3.new((i * partSize) - offsetX, 126, (j * partSize) - offsetZ)  
                       
                       waterpart.Anchored = true  
                       waterpart.CanCollide = true  
                       waterpart.Transparency = 0.8  
                       waterpart.Color = Color3.fromRGB(0, 255, 255)  -- Light blue color for water  
                       waterpart.Parent = game.Workspace  
                         
                       table.insert(waterparts, waterpart)  -- Add part to the waterparts table  
                   end  
               end  
           end  
       else  
           -- Remove all water parts when toggled off  
           for _, part in ipairs(waterparts) do  
               part.Parent = nil  
           end  
           waterparts = {}  -- Clear the list  
       end  
   end,  
})

MiscTab:CreateToggle({
    Name = "NoClip",
    Callback = function(v)
        _G.NoClip = v
        if _G.NoClip then
            local function NoClipLoop()
                while _G.NoClip and task.wait() do
                    local Character = game.Players.LocalPlayer.Character
                    if Character then
                        for _, v in pairs(Character:GetDescendants()) do
                            if v:IsA("BasePart") and v.CanCollide then
                                v.CanCollide = false
                            end
                        end
                    end
                end
            end
            spawn(NoClipLoop) -- Start NoClip when enabled
        else
            local Character = game.Players.LocalPlayer.Character
            if Character then
                for _, v in pairs(Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end
        end
    end
})

-- Ensure "Resources" exist before accessing
local Player = game.Players.LocalPlayer
local Character = Player and Player.Character
local Resources = Character and Character:FindFirstChild("Resources")
local gas = Resources and Resources:FindFirstChild("gas")
local oxygen = Resources and Resources:FindFirstChild("oxygen")
local peaksoxygen = Resources and Resources:FindFirstChild("oxygen(peaks)")
local temp = Resources and Resources:FindFirstChild("temperature")
local heat = Resources and Resources:FindFirstChild("temperature(heat)")

MiscTab:CreateToggle({
   Name = "Disable Resources",
   CurrentValue = false,
   Flag = "resources",
   Callback = function(v)
      gas.Disabled = v
      oxygen.Disbaled = v
      peaksoxygen.Disabled = v
      temp.Disabled = v
      heat.Disabled = v
   end,
})ĺ

MiscTab:CreateToggle({
    Name = "Hide Identity",
    CurrentValue = false,
    Flag = "hideidentity", 
    Callback = function(Value)
        _G.HideIdentity = Value 

        while _G.HideIdentity do
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidrp = character and character:FindFirstChild("HumanoidRootPart")
            local usr = humanoidrp and humanoidrp:FindFirstChild("user")
            local hud = player:FindFirstChildOfClass("PlayerGui") and player.PlayerGui:FindFirstChild("hud")
            local sfzone = hud and hud:FindFirstChild("safezone") -- Fixed typo

            if sfzone then
                local lvl = sfzone:FindFirstChild("lvl")
                local coins = sfzone:FindFirstChild("coins")

                if lvl then 
                    lvl.Text = "Cookie Hub" 
                end
                if coins then 
                    coins.Text = "Cookie Hub" 
                end
            end
            
            if usr then
                local level = usr:FindFirstChild("level")
                local streak = usr:FindFirstChild("streak")
                local title = usr:FindFirstChild("title")
                local usertitle = usr:FindFirstChild("user")

                if level and level:IsA("TextLabel") then 
                    level.Text = "Cookie Hub" -- Fixed incorrect property
                end
                if streak and streak:IsA("TextLabel") then 
                    streak.Text = "Cookie Hub" -- Fixed incorrect property
                end
                if title and title:IsA("TextLabel") then 
                    title.Text = "Cookie Hub" -- Fixed incorrect property
                end
                if usertitle and usertitle:IsA("TextLabel") then 
                    usertitle.Text = "Cookie Hub" -- Fixed incorrect property
                end
            end

            task.wait(1) -- i love you guys :D
        end
    end
})

MiscTab:CreateDivider()

MiscTab:CreateSection("FPS")

MiscTab:CreateToggle({
    Name = "Low Graphics Mode",
    CurrentValue = false,
    Flag = "LowGraphics",
    Callback = function(Value)
        _G.LowGraphics = Value

        if _G.LowGraphics then
            -- Remove unnecessary graphical effects
            local Lighting = game:GetService("Lighting")
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 9e9
            Lighting.Brightness = 0
            
            for _, v in pairs(Lighting:GetChildren()) do
                if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") then
                    v.Enabled = false
                end
            end

            -- Reduce textures and details in workspace
            local Terrain = workspace:FindFirstChildOfClass("Terrain")
            if Terrain then Terrain.WaterWaveSize = 0 Terrain.WaterWaveSpeed = 0 Terrain.WaterReflectance = 0 Terrain.WaterTransparency = 0 end

            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Decal") or v:IsA("Texture") then
                    v.Transparency = 1
                elseif v:IsA("BasePart") and not v:IsA("MeshPart") then
                    v.Material = Enum.Material.Plastic
                end
            end

        else
            -- Reset to default settings when disabled
            local Lighting = game:GetService("Lighting")
            Lighting.GlobalShadows = true
            Lighting.FogEnd = 100000
            Lighting.Brightness = 2
            
            for _, v in pairs(Lighting:GetChildren()) do
                if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") then
                    v.Enabled = true
                end
            end
            
            local Terrain = worksMainTab:CreateToggle({
            pace:FindFirstChildOfClass("Terrain")
            if Terrain then Terrain.WaterWaveSize = 1 Terrain.WaterWaveSpeed = 10 Terrain.WaterReflectance = 1 Terrain.WaterTransparency = 0.5 end

            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("Decal") or v:IsA("Texture") then
                    v.Transparency = 0
                elseif v:IsA("BasePart") and not v:IsA("MeshPart") then
                    v.Material = Enum.Material.SmoothPlastic
                end
            end
        end
    end
}) ]]

--[[local function removeBlacklistedItems()
    if backpack then
        for _, item in pairs(backpack:GetChildren()) do
            if table.find(Fish, item.Name) then
                item:Destroy()
                print("Removed:", item.Name)
            end
        end
    end
end
		
MiscTab:CreateButton({
   Name = "Remove Fish(Irreversible)",
   Callback = function()
   	removeBlacklistedItems()
   end,
}) ]]
