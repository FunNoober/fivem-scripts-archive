fx_version 'cerulean'
games { 'gta5' }

description "Core files for FN_CORE"
author "Fun Noober"

client_scripts {
    "client/hud_color.lua",
    "client/fn_notify.lua",
    "Announce/client.lua",
    "Blacklist/client/*.lua",
    "client/drop_weapon.lua"
}

server_scripts {
    "Announce/server.lua"
}

shared_scripts {
    "Blacklist/util.lua"
}

files {
    "Notify/*"
}

ui_page 'Notify/notyf.min.html'