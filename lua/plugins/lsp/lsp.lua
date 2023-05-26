local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local saga = require("lspsaga")

saga.setup({
    border_style = "rounded",
    -- keybinds for navigation in lspsaga window
    move_in_saga = { prev = "<C-k>", next = "<C-j>" },
    -- use enter to open file with finder
    finder_action_keys = {
        open = "<CR>",
        scroll_down = "<C-f>",
        scroll_up = "<C-b>", -- quit can be a table
    },
    -- use enter to open file with definition preview
    definition_action_keys = {
        edit = "<CR>",
    },
    preview_lines_above = 20,
    max_preview_lines = 20,
    lightbulb = {
        enable = true,
        sign_priority = 0,
    },
    symbol_in_winbar = {
        hide_keyword = false, -- Temporarily fix formatting bug on Scala
    },
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- enable keybinds only for when lsp server available
LSP_ON_ATTACH = function(client, bufnr)
    -- keybind options
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- set keybinds
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<leader>ac", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set({ "n", "v" }, "<leader>ac", "<cmd>Lspsaga code_action<CR>", bufopts)
    vim.keymap.set("n", "L", "<cmd>Lspsaga show_cursor_diagnostics<CR>", bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<leader>ff", function()
        vim.lsp.buf.format()
    end, bufopts)

    local cfg = {
        debug = false, -- set to true to enable debug logging
        log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
        -- default is  ~/.cache/nvim/lsp_signature.log
        verbose = false, -- show debug line number
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        -- If you want to hook lspsaga or other signature handler, pls set to false
        doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
        -- set to 0 if you DO NOT want any API comments be shown
        -- This setting only take effect in insert mode, it does not affect signature help in normal
        -- mode, 10 by default

        max_height = 20, -- max height of signature floating_window
        max_width = 80, -- max_width of signature floating_window
        wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
        floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
        floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
        -- will set to true when fully tested, set to false will use whichever side has more space
        -- this setting will be helpful if you do not want the PUM and floating win overlap

        floating_window_off_x = 1, -- adjust float windows x position.
        floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
        close_timeout = 4000, -- close floating window after ms when laster parameter is entered
        fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
        hint_enable = true, -- virtual hint enable
        hint_prefix = "🐼 ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
        hint_scheme = "String",
        hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
        handler_opts = {
            border = "double", -- double, rounded, single, shadow, none
        },
        always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58
        auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
        extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
        zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom
        padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
        transparency = nil, -- disabled by default, allow floating win transparent value 1~100
        shadow_blend = 36, -- if you using shadow as border use this set the opacity
        shadow_guibg = "Black", -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
        timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
        toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
        select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
        move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
    }
    require("lsp_signature").on_attach(cfg, bufnr) -- Note: add in lsp client on-attach

    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 4000 })
            end,
        })
    end
end
