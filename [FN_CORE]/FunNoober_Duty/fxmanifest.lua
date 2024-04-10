fx_version 'cerulean'
games { 'gta5' }

client_scripts{
    'client.lua',
    'RPBackup/backup_client.lua',
    'PanicButton/client.lua',
    'CallES/calles_client.lua'
}
server_script{
    'server.lua',
    'RPBackup/backup_server.lua',
    'PanicButton/server.lua',
    'CallES/calles_server.lua'
}
shared_scripts{
    'PanicButton/config.lua',
    'config.lua'
}

files{
    'PanicButton/main.html',
    'PanicButton/assets/*'
}

ui_page 'PanicButton/main.html'