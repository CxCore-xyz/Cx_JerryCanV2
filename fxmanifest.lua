fx_version 'cerulean'
game 'gta5'

shared_script {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua'
}

client_scripts {
    'client/functions/*.lua',
    'client/*.lua'
}

server_script 'server/*.lua'
