local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"
-- dashboard.section.header.val = {
--   [[                               __                ]],
--   [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
--   [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
--   [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
--   [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
--   [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
-- }
-- dashboard.section.header.val = {
--     
-- [[██   ██  █████  ██ ███████  ]],     
-- [[██  ██  ██   ██ ██    ███   ]],   
-- [[█████   ███████ ██   ███    ]],   
-- [[██  ██  ██   ██ ██  ███     ]],  
-- [[██   ██ ██   ██ ██ ███████  ]],
-- }


-- dashboard.section.header.val = {
-- [[██╗  ██╗ █████╗ ██╗███████╗   ]], 
-- [[██║ ██╔╝██╔══██╗██║╚══███╔╝   ]],
-- [[█████╔╝ ███████║██║  ███╔╝    ]],
-- [[██╔═██╗ ██╔══██║██║ ███╔╝     ]],
-- [[██║  ██╗██║  ██║██║███████╗   ]],
-- [[╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚══════╝   ]],
-- }

dashboard.section.header.val = {
[[██████╗  █████╗ ███╗   ██╗ ██████╗     ██╗   ██╗ █████╗ ███╗   ██╗    ████████╗██╗   ██╗ █████╗ ███╗   ██╗    ]],
[[██╔══██╗██╔══██╗████╗  ██║██╔════╝     ██║   ██║██╔══██╗████╗  ██║    ╚══██╔══╝██║   ██║██╔══██╗████╗  ██║    ]],
[[██║  ██║███████║██╔██╗ ██║██║  ███╗    ██║   ██║███████║██╔██╗ ██║       ██║   ██║   ██║███████║██╔██╗ ██║    ]],
[[██║  ██║██╔══██║██║╚██╗██║██║   ██║    ╚██╗ ██╔╝██╔══██║██║╚██╗██║       ██║   ██║   ██║██╔══██║██║╚██╗██║    ]],
[[██████╔╝██║  ██║██║ ╚████║╚██████╔╝     ╚████╔╝ ██║  ██║██║ ╚████║       ██║   ╚██████╔╝██║  ██║██║ ╚████║    ]],
[[╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝       ╚═══╝  ╚═╝  ╚═╝╚═╝  ╚═══╝       ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝    ]],
}
--
-- dashboard.section.header.val = {
-- [[$$\   $$\ $$\                           $$\             $$\ $$\           $$\         ]],
-- [[$$ | $$  |$$ |                          $$ |            $$ |\__|          $$ |        ]],
-- [[$$ |$$  / $$$$$$$\   $$$$$$\  $$$$$$$\  $$$$$$$\        $$ |$$\ $$$$$$$\  $$$$$$$\    ]],
-- [[$$$$$  /  $$  __$$\  \____$$\ $$  __$$\ $$  __$$\       $$ |$$ |$$  __$$\ $$  __$$\   ]],
-- [[$$  $$<   $$ |  $$ | $$$$$$$ |$$ |  $$ |$$ |  $$ |      $$ |$$ |$$ |  $$ |$$ |  $$ |  ]],
-- [[$$ |\$$\  $$ |  $$ |$$  __$$ |$$ |  $$ |$$ |  $$ |      $$ |$$ |$$ |  $$ |$$ |  $$ |  ]],
-- [[$$ | \$$\ $$ |  $$ |\$$$$$$$ |$$ |  $$ |$$ |  $$ |      $$ |$$ |$$ |  $$ |$$ |  $$ |  ]],
-- [[\__|  \__|\__|  \__| \_______|\__|  \__|\__|  \__|      \__|\__|\__|  \__|\__|  \__   ]], 
-- }
--


dashboard.section.buttons.val = {
  dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
  dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}
local function footer()
  return "                                  https://github.com/kaidev0711\
    'If I use an environment that has good automated refactorings, I can trust those refactorings'"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
