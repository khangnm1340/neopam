return {
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    -- Use the 'keys' table provided by Lazy.nvim for keybindings
    keys = {
      -- Add or skip cursor above/below the main cursor.
      -- stylua: ignore start
      { "<up>", mode = { "n", "x" }, function() require("multicursor-nvim").lineAddCursor(-1) end,
      desc = "Multicursor: Add cursor above", },
      { "<down>", mode = { "n", "x" }, function() require("multicursor-nvim").lineAddCursor(1) end,
      desc = "Multicursor: Add cursor below", },
      { "<leader><up>", mode = { "n", "x" }, function() require("multicursor-nvim").lineSkipCursor(-1) end,
      desc = "Multicursor: Skip cursor above", },
      { "<leader><down>", mode = { "n", "x" }, function() require("multicursor-nvim").lineSkipCursor(1) end,
      desc = "Multicursor: Skip cursor below", },


      -- Disable and enable cursors.
      { "<c-q>", mode = { "n", "x" }, function() require("multicursor-nvim").toggleCursor() end,
      desc = "Multicursor: Toggle Cursors", },

      -- { "<leader>m", mode = { "n", "x" }, function() require("multicursor-nvim").matchAddCursor(1) end, },
      -- { "<leader>M", mode = { "n", "x" }, function() require("multicursor-nvim").matchSkipCursor(1) end, },
      { "<leader>X", mode = "x", function() require("multicursor-nvim").splitCursors() end, },
      -- Append/insert for each line of visual selections.
      -- Similar to block selection insertion.
      { "I", mode = "x", function() require("multicursor-nvim").insertVisual() end, },
      { "A", mode = "x", function() require("multicursor-nvim").appendVisual() end, },
      { "gl", mode = "n", function() require("multicursor-nvim").restoreCursors() end, },
      { "<leader>gt", mode = "x", function() require("multicursor-nvim").transposeCursors(1) end, },
      { "<leader>gT", mode = "x", function() require("multicursor-nvim").transposeCursors(-1) end, },
      { "<leader>A", mode = { "n", "x" }, function() require("multicursor-nvim").matchAllAddCursors() end, },
      { "<leader>M", mode = "x", function() require("multicursor-nvim").matchCursors() end, },
-- Increment/decrement sequences, treaing all cursors as one sequence.
      {"g<c-a>",mode = {"n", "x"},  function() require("multicursor-nvim").sequenceIncrement() end},
      {"g<c-x>",mode = {"n", "x"},  function() require("multicursor-nvim").sequenceDecrement() end} 
,

      -- stylua: ignore end

      -- Keymap layer mappings (these will need to remain in the config function
      -- as they are added dynamically by multicursor.nvim itself)
      -- However, if you want to override specific LazyVim mappings that
      -- are also defined within the multicursor layer, you might need to
      -- reconsider if those mappings directly clash or if multicursor's
      -- layer handling is sufficient.
    },
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()
      -- Mappings defined in a keymap layer only apply when there are
      -- multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one.
        layerSet({ "n", "x" }, "<left>", mc.prevCursor)
        layerSet({ "n", "x" }, "<right>", mc.nextCursor)

        -- Delete the main cursor.
        -- layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

        -- Enable and clear cursors using escape.
        layerSet("n", "<M-esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)

      -- Customize how cursors look.
      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { reverse = true })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorMatchPreview", { link = "Search" })
      hl(0, "MultiCursorDisabledCursor", { reverse = true })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
  },
}
