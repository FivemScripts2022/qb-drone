fx_version 'adamant'
games { 'rdr3', 'gta5' }

ui_page 'src/nui/dronemenu.html'

client_scripts {
  'config.lua',
  'src/client/scaleforms.lua',
  'src/client/functions.lua',
  'src/client/main.lua',
}

server_scripts {
  'config.lua',
  'src/server/main.lua',
}

files {
  'src/nui/dronemenu.html',
  'src/nui/*.png'
}

dependencies {
  'meta_libs',
  'drones_stream'
}