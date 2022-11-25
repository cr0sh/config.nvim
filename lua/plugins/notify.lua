local notify = require("notify")
local stages_util = require("notify.stages.util")
notify.setup({
    background_colour = "Normal",
    fps = 15,
    icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
    },
    level = 2,
    minimum_width = 50,
    render = "default",
    stages = "slide",
    timeout = 5000,
    top_down = false
})


