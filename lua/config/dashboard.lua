local db = require("dashboard")

db.custom_header = {
    "                              ",
    "                              ",
    "                              ",
    "                              ",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⣰⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⢀⣀⡀⠀⠀⠀⠀⠀⣸⣷⣄⠺⣿⣿⣿⠇⣼⣦⡀⠀⠀⠀⠀⣀⣠⡄⠀⠀",
    "⠀⠀⠀⣿⣿⡷⢠⣾⣦⣀⠻⣿⣿⣷⢬⠛⣡⣾⠟⣉⣴⣾⣷⡄⢿⣿⡿⠀⠀⠀",
    "⠀⠀⠀⢸⡿⢠⣿⣿⣿⣿⣷⡜⠟⣡⣾⣧⡙⠇⣼⣿⣿⣿⣿⣿⡄⢿⣷⠀⠀⠀",
    "⠀⠀⠀⢾⡇⣼⣿⣿⣿⡿⢋⣴⣾⣿⣿⣿⣿⣦⡙⢿⣿⣿⣿⣿⣷⢸⣿⠀⠀⠀",
    "⣤⣀⣀⣘⠇⢹⣿⡿⠿⢁⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠹⣿⣿⣿⡏⠸⢋⣀⣀⣤",
    "⢿⣿⣿⣿⣿⡌⢿⠃⣷⣤⣍⡛⠻⢿⣿⣿⣿⣿⣿⣿⣇⢹⣿⡟⢡⣿⣿⣿⣿⣿",
    "⠘⣿⣿⣿⣿⣿⣦⢸⣿⣿⣿⣿⣿⣶⣤⣉⠻⣿⣿⣿⣿⠘⣡⣴⣿⣿⣿⣿⣿⠇",
    "⠀⠘⢿⣿⣿⣿⣿⡘⣿⣿⣿⣿⣿⣿⣿⣿⣷⡌⢿⣿⡿⢸⣿⣿⣿⣿⣿⣿⠏⠀",
    "⠀⠀⠀⠙⠿⣿⣿⣷⡘⢿⣿⣿⣿⣿⣿⣿⣿⡇⣸⣿⠃⣾⣿⣿⣿⣿⠟⠁⠀⠀",
    "⠀⠀⠀⠀⠀⠈⠙⠛⠻⢶⡌⠙⠛⠿⠿⠛⣋⡴⠟⠡⠾⠛⠛⠋⠉⠀⠀⠀⠀⠀",
    "                              ",
    "                              ",
}

db.custom_center = {
    {
        icon = " ",
        desc = "Find File   ",
        action = "Telescope find_files",
    },
    {
        icon = " ",
        desc = "Recent Files",
        action = "Telescope oldfiles",
    },
    {
        icon = " ",
        desc = "Search Text ",
        action = "Telescope live_grep",
    },
    {
        icon = " ",
        desc = "Config      ",
        action = "e ~/.config/nvim/init.lua",
    },
}
