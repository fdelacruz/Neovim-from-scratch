return {
  -- tools = {
  --   autoSetHints = false,
  --   hover_with_actions = true,
  --   inlay_hints = {
  --     show_parameter_hints = true,
  --     show_variable_name = true,
  --   },
  -- },
  settings = {
    ["rust-analyzer"] = {
      completion = {
        postfix = {
          enable = false,
        },
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
}
