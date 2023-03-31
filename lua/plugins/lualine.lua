local setup, plugin = pcall(require, "lualine")
if not setup then
    return
end

plugin.setup({
    sections = {
        lualine_a = {
            {
                "filename",
                file_status = true, -- displays file status (readonly status, modified status)
                path = 2, -- 0 = just filename, 1 = relative path, 2 = absolute path
            },
        },
    },
})
