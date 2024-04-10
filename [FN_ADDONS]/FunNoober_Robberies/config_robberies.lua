Config = {}

Config.CooldownTime = 120

Config.RobberyPresets = {
    twentyfourseven = {
        moneyToAdd = 75.0,
        subTitle = "~y~robbing 24/7",
        description = "This will take about 10 seconds",
        blip = 59
    },
    ltd = {
        moneyToAdd = 75.0,
        subTitle = "~y~robbing ltd",
        description = "This will take about 10 seconds",
        blip= 59
    },
    fleeca = {
        moneyToAdd = 250.0,
        subTitle = "~y~robbing fleeca",
        description = "This will take about 10 seconds",
        blip = 272
    }
}

Config.RobberyLocations = {
    {
        x = 146.56,
        y = -1045.04,
        z = 29.38,
        title = "Legion Square Fleeca",
        moneyToAdd = Config.RobberyPresets.fleeca.moneyToAdd,
        subTitle = Config.RobberyPresets.fleeca.subTitle,
        description = Config.RobberyPresets.fleeca.description,
        blip = Config.RobberyPresets.fleeca.blip
    },
    {
        x = -1211.77,
        y = -335.8,
        z = 37.8,
        title = "Rockford Hills Fleeca",
        moneyToAdd = Config.RobberyPresets.fleeca.moneyToAdd,
        subTitle = Config.RobberyPresets.fleeca.subTitle,
        description = Config.RobberyPresets.fleeca.description,
        blip = Config.RobberyPresets.fleeca.blip
    },
    {
        x = 311.2,
        y = -283.84,
        z = 54.16,
        title = "Hawick Fleeca",
        moneyToAdd = Config.RobberyPresets.fleeca.moneyToAdd,
        subTitle = Config.RobberyPresets.fleeca.subTitle,
        description = Config.RobberyPresets.fleeca.description,
        blip = Config.RobberyPresets.fleeca.blip
    },
    {
        x = -2957.11,
        y = 481.26,
        z = 15.71,
        title = "Great Ocean Highway Fleeca",
        moneyToAdd = Config.RobberyPresets.fleeca.moneyToAdd,
        subTitle = Config.RobberyPresets.fleeca.subTitle,
        description = Config.RobberyPresets.fleeca.description,
        blip = Config.RobberyPresets.fleeca.blip
    },
    {
        x = 1176.47,
        y = 2712.01,
        z = 38.1,
        title = "Route 68 Fleeca",
        moneyToAdd = Config.RobberyPresets.fleeca.moneyToAdd,
        subTitle = Config.RobberyPresets.fleeca.subTitle,
        description = Config.RobberyPresets.fleeca.description,
        blip = Config.RobberyPresets.fleeca.blip
    },
    {
        x = 1959.95,
        y = 3739.86,
        z = 32.35,
        title = "Sandy Shores 24/7",
        moneyToAdd = Config.RobberyPresets.twentyfourseven.moneyToAdd,
        subTitle = Config.RobberyPresets.twentyfourseven.subTitle,
        description = Config.RobberyPresets.twentyfourseven.description,
        blip = Config.RobberyPresets.twentyfourseven.blip
    },
    {
        x = 1727.65,
        y = 6415.29,
        z = 35.04,
        title = "Senora Freeway 24/7",
        moneyToAdd = Config.RobberyPresets.twentyfourseven.moneyToAdd,
        subTitle = Config.RobberyPresets.twentyfourseven.subTitle,
        description = Config.RobberyPresets.twentyfourseven.description,
        blip = Config.RobberyPresets.twentyfourseven.blip
    },
    {
        x = 160.42,
        y = 6641.82,
        z = 31.71,
        title = "Paleto Gas Station",
        moneyToAdd = Config.RobberyPresets.twentyfourseven.moneyToAdd,
        subTitle = Config.RobberyPresets.twentyfourseven.subTitle,
        description = Config.RobberyPresets.twentyfourseven.description,
        blip = Config.RobberyPresets.twentyfourseven.blip
    },
    {
        x = 2557.13,
        y = 380.68,
        z = 108.62,
        title = "Palomino Freeway 24/7",
        moneyToAdd = Config.RobberyPresets.twentyfourseven.moneyToAdd,
        subTitle = Config.RobberyPresets.twentyfourseven.subTitle,
        description = Config.RobberyPresets.twentyfourseven.description,
        blip = Config.RobberyPresets.twentyfourseven.blip
    },
    {
        x = 1165.06,
        y = -322.66,
        z = 69.21,
        title = "Mirror Park LTD",
        moneyToAdd = Config.RobberyPresets.ltd.moneyToAdd,
        subTitle = Config.RobberyPresets.ltd.subTitle,
        description = Config.RobberyPresets.ltd.description,
        blip = Config.RobberyPresets.ltd.blip
    },
    {
        x = -46.36,
        y = -1758.15,
        z = 29.42,
        title = "Grove Street LTD",
        moneyToAdd = Config.RobberyPresets.ltd.moneyToAdd,
        subTitle = Config.RobberyPresets.ltd.subTitle,
        description = Config.RobberyPresets.ltd.description,
        blip = Config.RobberyPresets.ltd.blip
    },
    {
        x = -1819.8,
        y = 794.61,
        z = 138.08,
        title = "Banham Canyon LTD",
        moneyToAdd = Config.RobberyPresets.ltd.moneyToAdd,
        subTitle = Config.RobberyPresets.ltd.subTitle,
        description = Config.RobberyPresets.ltd.description,
        blip = Config.RobberyPresets.ltd.blip
    },
    {
        x = 254.23,
        y = 225.37,
        z = 101.88,
        title = "Pacific Standard",
        moneyToAdd = 1000.0,
        subTitle = "~y~robbing pacific standard",
        description = "This will take about 10 seconds",
        blip = 605
    },
    {
        x = 2525.28,
        y = -238.51,
        z = -70.74,
        title = "Diamond Casino",
        moneyToAdd = 8500.0,
        subTitle = "~y~robbing diamond casino",
        description = "This will take about 10 seconds",
        blip = nil
    },
    {
        x = -103.61,
        y = 6477.83,
        z = 31.63,
        title = "Blaine County Savings",
        moneyToAdd = 325.0,
        subTitle = "~y~robbing blaine county savings",
        description = "This will take about 10 seconds",
        blip = 272
    },
    {
        x = 902.81,
        y = -3182.35,
        z = -97.06,
        title = "Bunker",
        moneyToAdd = 9000000,
        subTitle = "~y~robbing bunker",
        description = "This will take about 10 seconds",
        blip = nil
    },
    {
        x = -705.61,
        y = -913.41,
        z = 19.22,
        title = "Palomino LTD",
        moneyToAdd = Config.RobberyPresets.ltd.moneyToAdd,
        subTitle = Config.RobberyPresets.ltd.subTitle,
        description = Config.RobberyPresets.ltd.description,
        blip = Config.RobberyPresets.ltd.blip
    },
    {
        x = -1197.47,
        y = -892.04,
        z = 14,
        title = "Burgershot",
        moneyToAdd = 85.0,
        subTitle = "~y~robbing burgershot",
        description = "This will take about 10 seconds",
        blip = 93
    },
    {
        x = -1.16,
        y = 6510.56,
        z = 31.88,
        title = "Paleto Clothing Store",
        moneyToAdd = 50.0,
        subTitle = "~y~robbing clothing store",
        description = "This will take about 10 seconds",
        blip = 73
    },
    {
        x = 2677.78,
        y = 3279.26,
        z = 55.24,
        title = "Senora Freeway 24/7",
        moneyToAdd = Config.RobberyPresets.twentyfourseven.moneyToAdd,
        subTitle = Config.RobberyPresets.twentyfourseven.subTitle,
        description = Config.RobberyPresets.twentyfourseven.description,
        blip = Config.RobberyPresets.twentyfourseven.blip
    },
    {
        x = 549.26,
        y = 2671.36,
        z = 42.15,
        title = "Route 68 24/7",
        moneyToAdd = Config.RobberyPresets.twentyfourseven.moneyToAdd,
        subTitle = Config.RobberyPresets.twentyfourseven.subTitle,
        description = Config.RobberyPresets.twentyfourseven.description,
        blip = Config.RobberyPresets.twentyfourseven.blip
    },
    {
        x = 612.63,
        y = 2762.88,
        z = 42.09,
        title = "Harmony Clothing Store",
        moneyToAdd = 50.0,
        subTitle = "~y~robbing clothing store",
        description = "This will take about 10 seconds",
        blip = 73
    },
    {
        x = -815.96,
        y = -1073.13,
        z = 11.33,
        title = "Vespucci Canals Clothing Store",
        moneyToAdd = 50.0,
        subTitle = "~y~robbing clothing store",
        description = "This will take about 10 seconds",
        blip = 73
    },
    {
        x = 1212.01,
        y = -470.77,
        z = 66.21,
        title = "Mirror Park Barber",
        moneyToAdd = 50.0,
        subTitle = "~y~robbing barber shop",
        description = "This will take about 10 seconds",
        blip = 71
    },
    {
        x = 1132.69,
        y = -992.95,
        z = 46.11,
        title = "Money Laundering",
        moneyToAdd = 150.0,
        subTitle = "~y~robbing laundromat",
        description = "This will take about 10 seconds",
        blip = nil
    },
    {
        x = 422.85,
        y = -811.98,
        z = 29.49,
        title = "Mission Row Clothing Store",
        moneyToAdd = 50.0,
        subTitle = "~y~robbing clothing store",
        description = "This will take about 10 seconds",
        blip = 73
    },
    {
        x = 24.2,
        y = -1347.18,
        z = 29.5,
        title = "Innocense 24/7",
        moneyToAdd = Config.RobberyPresets.twentyfourseven.moneyToAdd,
        subTitle = Config.RobberyPresets.twentyfourseven.subTitle,
        description = Config.RobberyPresets.twentyfourseven.description,
        blip = Config.RobberyPresets.twentyfourseven.blip
    },
    {
        x = 1202.40,
        y = 2707.54,
        z = 38.22,
        title = "Harmony Clothing Store",
        moneyToAdd = 50.0,
        subTitle = "~y~robbing clothing store",
        description = "This will take about 10 seconds",
        blip = 73
    },
    {
        x = 372.34,
        y = 326.42,
        z = 103.57,
        title = "Vinewood 24/7",
        moneyToAdd = Config.RobberyPresets.twentyfourseven.moneyToAdd,
        subTitle = Config.RobberyPresets.twentyfourseven.subTitle,
        description = Config.RobberyPresets.twentyfourseven.description,
        blip = Config.RobberyPresets.twentyfourseven.blip
    },
    {
        x = 1697.61,
        y = 4922.35,
        z = 42.06,
        title = "Grapeseed LTD",
        moneyToAdd = Config.RobberyPresets.ltd.moneyToAdd,
        subTitle = Config.RobberyPresets.ltd.subTitle,
        description = Config.RobberyPresets.ltd.description,
        blip = Config.RobberyPresets.ltd.blip
    },
    {
        x = 269.09,
        y = -977.99,
        z = 29.37,
        title = "Legion Square 24/7",
        moneyToAdd = Config.RobberyPresets.twentyfourseven.moneyToAdd,
        subTitle = Config.RobberyPresets.twentyfourseven.subTitle,
        description = Config.RobberyPresets.twentyfourseven.description,
        blip = Config.RobberyPresets.twentyfourseven.blip
    },
    {
        x = -3038.82,
        y = 584.28,
        z = 7.91,
        title = "Great Ocean Highway 24/7",
        moneyToAdd = Config.RobberyPresets.twentyfourseven.moneyToAdd,
        subTitle = Config.RobberyPresets.twentyfourseven.subTitle,
        description = Config.RobberyPresets.twentyfourseven.description,
        blip = Config.RobberyPresets.twentyfourseven.blip
    },
    {
        x = -2539.09,
        y = 2313.95,
        z = 33.41,
        title = "Zancudo 24/7",
        moneyToAdd = Config.RobberyPresets.twentyfourseven.moneyToAdd,
        subTitle = Config.RobberyPresets.twentyfourseven.subTitle,
        description = Config.RobberyPresets.twentyfourseven.description,
        blip = Config.RobberyPresets.twentyfourseven.blip
    },
    {
        x = -3242.24,
        y = 999.75,
        z = 12.81,
        title = "Barbareno 24/7",
        moneyToAdd = Config.RobberyPresets.twentyfourseven.moneyToAdd,
        subTitle = Config.RobberyPresets.twentyfourseven.subTitle,
        description = Config.RobberyPresets.twentyfourseven.description,
        blip = Config.RobberyPresets.twentyfourseven.blip
    },
    {
        x = -670.78,
        y = 5832.16,
        z = 17.52,
        title = "Motel Lodge Shop",
        moneyToAdd = Config.RobberyPresets.twentyfourseven.moneyToAdd,
        subTitle = Config.RobberyPresets.twentyfourseven.subTitle,
        description = Config.RobberyPresets.twentyfourseven.description,
        blip = Config.RobberyPresets.twentyfourseven.blip
    }
}