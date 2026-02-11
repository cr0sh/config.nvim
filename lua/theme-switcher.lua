local M = {}

-- Flexoki light colors (matching Sorbet's highlight group structure)
local flexoki_light = {
    -- Base colors
    bg = "#FFFCF0", -- paper
    fg = "#403E3C", -- black

    -- UI colors
    base_100 = "#E6E4D9",
    base_200 = "#CECDC3",
    base_300 = "#B7B5AC",
    base_600 = "#6F6E69",
    base_700 = "#575653",
    base_850 = "#343331",

    -- Accent colors (400 variants for light mode)
    red = "#D14D41",
    orange = "#DA702C",
    yellow = "#D0A215",
    green = "#879A39",
    cyan = "#3AA99F",
    blue = "#4385BE",
    purple = "#8B7EC8",
    magenta = "#CE5D97",
}

function M.apply_flexoki_light()
    -- Set background
    vim.o.background = "light"

    local c = flexoki_light

    -- Base highlights (matching Sorbet structure)
    vim.api.nvim_set_hl(0, "Normal", { fg = c.fg, bg = c.bg })
    vim.api.nvim_set_hl(0, "Added", { fg = c.green })
    vim.api.nvim_set_hl(0, "Changed", { fg = c.blue })
    vim.api.nvim_set_hl(0, "Removed", { fg = c.red })
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = c.base_100 })
    vim.api.nvim_set_hl(0, "Conceal", {})
    vim.api.nvim_set_hl(0, "CurSearch", { fg = c.magenta, bg = c.bg, reverse = true })
    vim.api.nvim_set_hl(0, "Cursor", { reverse = true })
    vim.api.nvim_set_hl(0, "CursorColumn", { bg = c.base_100 })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = c.base_100 })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = c.base_850, bg = c.base_100 })
    vim.api.nvim_set_hl(0, "DiffAdd", { fg = c.green, bg = c.bg, reverse = true })
    vim.api.nvim_set_hl(0, "DiffChange", { fg = c.blue, bg = c.bg, reverse = true })
    vim.api.nvim_set_hl(0, "DiffDelete", { fg = c.red, bg = c.bg, reverse = true })
    vim.api.nvim_set_hl(0, "DiffText", { fg = c.magenta, bg = c.bg, reverse = true })
    vim.api.nvim_set_hl(0, "Directory", { fg = c.fg })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = c.base_300 })
    vim.api.nvim_set_hl(0, "FoldColumn", { fg = c.base_600 })
    vim.api.nvim_set_hl(0, "Folded", { fg = c.base_300, bg = c.bg })
    vim.api.nvim_set_hl(0, "IncSearch", { fg = c.yellow, bg = c.bg, reverse = true })
    vim.api.nvim_set_hl(0, "LineNr", { fg = c.base_300 })
    vim.api.nvim_set_hl(0, "MatchParen", { fg = c.magenta, bold = true })
    vim.api.nvim_set_hl(0, "ModeMsg", { fg = c.fg, bold = true })
    vim.api.nvim_set_hl(0, "MoreMsg", { fg = c.fg })
    vim.api.nvim_set_hl(0, "NonText", { fg = c.base_600 })
    vim.api.nvim_set_hl(0, "Pmenu", { fg = c.bg, bg = c.base_600 })
    vim.api.nvim_set_hl(0, "PmenuMatch", { fg = c.red, bg = c.base_600 })
    vim.api.nvim_set_hl(0, "PmenuExtra", { fg = c.bg, bg = c.base_600 })
    vim.api.nvim_set_hl(0, "PmenuKind", { fg = c.bg, bg = c.base_600, bold = true })
    vim.api.nvim_set_hl(0, "PmenuSbar", { fg = c.base_600, bg = c.base_300 })
    vim.api.nvim_set_hl(0, "PmenuSel", { fg = c.bg, bg = c.base_850 })
    vim.api.nvim_set_hl(0, "PmenuMatchSel", { fg = c.red, bg = c.base_850, bold = true })
    vim.api.nvim_set_hl(0, "PmenuExtraSel", { fg = c.bg, bg = c.base_850 })
    vim.api.nvim_set_hl(0, "PmenuKindSel", { fg = c.bg, bg = c.base_850, bold = true })
    vim.api.nvim_set_hl(0, "PmenuThumb", { fg = c.fg, bg = c.base_850 })
    vim.api.nvim_set_hl(0, "Question", { fg = c.fg })
    vim.api.nvim_set_hl(0, "QuickFixLine", { fg = c.magenta, bg = c.bg, reverse = true })
    vim.api.nvim_set_hl(0, "Search", { fg = c.cyan, bg = c.bg, reverse = true })
    vim.api.nvim_set_hl(0, "SignColumn", { fg = c.fg })
    vim.api.nvim_set_hl(0, "SpecialKey", { fg = c.base_300, bold = true })
    vim.api.nvim_set_hl(0, "SpellBad", { fg = c.red, underline = true, sp = c.red })
    vim.api.nvim_set_hl(0, "SpellCap", { fg = c.blue, underline = true, sp = c.blue })
    vim.api.nvim_set_hl(0, "SpellLocal", { fg = c.purple, underline = true, sp = c.purple })
    vim.api.nvim_set_hl(0, "SpellRare", { fg = c.cyan, underline = true, sp = c.cyan })
    vim.api.nvim_set_hl(0, "StatusLine", { fg = c.bg, bg = c.base_850, bold = true })
    vim.api.nvim_set_hl(0, "StatusLineNC", { fg = c.base_600, bg = c.bg, reverse = true })
    vim.api.nvim_set_hl(0, "TabLine", { fg = c.base_600, bg = c.bg, reverse = true })
    vim.api.nvim_set_hl(0, "TabLineFill", { fg = c.fg })
    vim.api.nvim_set_hl(0, "TabLineSel", { fg = c.bg, bg = c.base_850, bold = true })
    vim.api.nvim_set_hl(0, "Title", {})
    vim.api.nvim_set_hl(0, "VertSplit", { fg = c.base_300 })
    vim.api.nvim_set_hl(0, "Visual", { fg = c.yellow, bg = c.bg, reverse = true })
    vim.api.nvim_set_hl(0, "VisualNOS", { bg = c.base_100 })
    vim.api.nvim_set_hl(0, "WarningMsg", { fg = c.fg })
    vim.api.nvim_set_hl(0, "WildMenu", { fg = c.base_850, bg = c.bg, bold = true })

    -- Syntax highlighting
    vim.api.nvim_set_hl(0, "Comment", { fg = c.purple })
    vim.api.nvim_set_hl(0, "Constant", { fg = c.red })
    vim.api.nvim_set_hl(0, "String", { fg = c.yellow })
    vim.api.nvim_set_hl(0, "Error", { fg = c.red, bg = c.bg, bold = true, reverse = true })
    vim.api.nvim_set_hl(0, "Identifier", { fg = c.green })
    vim.api.nvim_set_hl(0, "Ignore", { fg = c.fg })
    vim.api.nvim_set_hl(0, "PreProc", { fg = c.blue })
    vim.api.nvim_set_hl(0, "Special", { fg = c.cyan })
    vim.api.nvim_set_hl(0, "Statement", { fg = c.blue })
    vim.api.nvim_set_hl(0, "Todo", { fg = c.cyan, bg = c.bg, bold = true, reverse = true })
    vim.api.nvim_set_hl(0, "Type", { fg = c.blue })
    vim.api.nvim_set_hl(0, "Underlined", { fg = c.fg, underline = true })

    -- Additional
    vim.api.nvim_set_hl(0, "CursorIM", { fg = c.bg, bg = c.green })
    vim.api.nvim_set_hl(0, "ToolbarLine", { bg = c.bg })
    vim.api.nvim_set_hl(0, "ToolbarButton", { fg = c.fg, bg = c.bg, bold = true })
    vim.api.nvim_set_hl(0, "debugBreakpoint", { fg = c.base_600, bg = c.bg, bold = true, reverse = true })

    -- Link groups (same as Sorbet)
    vim.api.nvim_set_hl(0, "Terminal", { link = "Normal" })
    vim.api.nvim_set_hl(0, "StatusLineTerm", { link = "StatusLine" })
    vim.api.nvim_set_hl(0, "StatusLineTermNC", { link = "StatusLineNC" })
    vim.api.nvim_set_hl(0, "Boolean", { link = "Constant" })
    vim.api.nvim_set_hl(0, "Character", { link = "Constant" })
    vim.api.nvim_set_hl(0, "Conditional", { link = "Statement" })
    vim.api.nvim_set_hl(0, "Define", { link = "PreProc" })
    vim.api.nvim_set_hl(0, "Debug", { link = "Special" })
    vim.api.nvim_set_hl(0, "Delimiter", { link = "Special" })
    vim.api.nvim_set_hl(0, "Exception", { link = "Statement" })
    vim.api.nvim_set_hl(0, "Float", { link = "Constant" })
    vim.api.nvim_set_hl(0, "Function", { link = "Identifier" })
    vim.api.nvim_set_hl(0, "Include", { link = "PreProc" })
    vim.api.nvim_set_hl(0, "Keyword", { link = "Statement" })
    vim.api.nvim_set_hl(0, "Label", { link = "Statement" })
    vim.api.nvim_set_hl(0, "Macro", { link = "PreProc" })
    vim.api.nvim_set_hl(0, "Number", { link = "Constant" })
    vim.api.nvim_set_hl(0, "Operator", { link = "Statement" })
    vim.api.nvim_set_hl(0, "PreCondit", { link = "PreProc" })
    vim.api.nvim_set_hl(0, "Repeat", { link = "Statement" })
    vim.api.nvim_set_hl(0, "SpecialChar", { link = "Special" })
    vim.api.nvim_set_hl(0, "SpecialComment", { link = "Special" })
    vim.api.nvim_set_hl(0, "StorageClass", { link = "Type" })
    vim.api.nvim_set_hl(0, "Structure", { link = "Type" })
    vim.api.nvim_set_hl(0, "Tag", { link = "Special" })
    vim.api.nvim_set_hl(0, "Typedef", { link = "Type" })
end

function M.detect_and_apply(override)
    -- Clear existing highlights
    vim.cmd("hi clear")
    vim.cmd("syntax reset")

    local is_dark

    ---@diagnostic disable
    if override then
        -- Use parameter override
        is_dark = (override == "dark")
    else
        -- Detect system dark mode on macOS
        local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
        local result = handle:read("*a")
        handle:close()
        is_dark = result:match("Dark") ~= nil
    end

    if is_dark then
        vim.o.background = "dark"
        vim.cmd("colorscheme sorbet")
    else
        vim.o.background = "light"
        M.apply_flexoki_light()
    end

    if Snacks ~= nil and override then
        Snacks.notify(
            string.format("theme set to %s, override=%s", is_dark and "dark" or "light", (override or "unset"))
        )
    end
end

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "SnacksPicker", { bg = "none", nocombine = true })
        vim.api.nvim_set_hl(0, "Pmenu", { bg = "none", nocombine = true })
    end,
})

function M.setup()
    -- Start RPC server with a known address
    local socket_dir = "/tmp/nvim-theme-switcher"
    local server_addr = socket_dir .. "/" .. vim.fn.getpid() .. ".sock"

    vim.fn.mkdir(socket_dir, "p")
    vim.fn.delete(server_addr)
    vim.fn.serverstart(server_addr)

    -- Check whenever Neovim gains focus (works outside tmux)
    vim.api.nvim_create_autocmd({ "VimEnter", "FocusGained", "VimResume" }, {
        callback = function()
            M.detect_and_apply()
        end,
        desc = "Auto-switch theme based on system appearance",
    })
end

return M
