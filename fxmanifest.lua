fx_version 'cerulean'
game 'gta5'

shared_script {
    '@qb-core/shared/locale.lua',
    'locales/en.lua', -- Want to change language just common the uneeded locale
    --'locales/lt.lua',
    'config.lua'
}

client_scripts {
    'client/functions/*.lua',
    'client/*.lua'
}

server_script 'server/*.lua'
