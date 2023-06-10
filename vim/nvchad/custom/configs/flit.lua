local present, flit = pcall(require, "flit")

if not present then
  return
end

flit.setup {
  keys = { f = 'f', F = 'F', t = 't', T = 'T' },
  labeled_modes = "nvo",
  -- A string like "nv", "nvo", "o", etc.
  -- labeled_modes = "nvo",
  multiline = true,
  -- Like `leap`s similar argument (call-specific overrides).
  -- E.g.: opts = { equivalence_classes = {} }
  -- opts = { labeled_modes = "nx" },
}

vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
