local auto_session_status, auto_session = pcall(require, "auto-session")
if not auto_session_status then
    return
end

auto_session.setup({
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
})

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
