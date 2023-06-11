local present, auto_session = pcall(require, "auto-session")

if not present then
  return
end

auto_session.setup {
  log_level = "error",
  auto_session_suppress_dirs = { "~/code" },
}

-- local augroup = vim.api.nvim_create_augroup("SessionManager", {})