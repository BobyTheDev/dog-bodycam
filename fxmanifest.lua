fx_version 'cerulean'
games { 'gta5' }

author 'Dog#7087'
description 'Axon Body Cam for QBCore'
version '1.0.0'

lua54 'yes'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client.lua',
}

server_scripts {
    "server.lua",
}


ui_page "index.html"
files {
    "script.js",
    "index.html"
}

escrow_ignore {
	"index.html",
	"config.lua",
	"server.lua"
}


dependency '/assetpacks'