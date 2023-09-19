-- Default settings
return {
    -- For some reason --no-messages makes it stop working
    -- seprated by a space
    -- WARNING !!! Glob for '-g *{*}' will not use .gitignore file: https://github.com/BurntSushi/ripgrep/issues/2252
    cmd_flags = "--smart-case -g *.{*,py} -g !*.{min.js,pyc} --fixed-strings --no-fixed-strings --no-ignore --ignore -M 500",

    -- After a search, whether to set incsearch to be the pattern searched for
    incsearch_after = true,

    -- ui_top_line_char = "▄",
    --  Example chars: ━━━ ═══ ███  ▀▀▀ ▃▃▃   
    ui_top_line_char = "▃",

    -- The vim `completeopt` for when using autocomplete with the RgFlow UI open
    completeopt = "menuone,noinsert,noselect",

    mappings = {
        -- Mappings that all always present
        trigger = {
            -- Normal mode maps
            n = {
                ["<leader>rG"] = "open_blank", -- open UI - search pattern = blank
                ["<leader>rg"] = "open_cword", -- open UI - search pattern = <cword>
                ["<leader>rp"] = "open_paste", -- open UI - search pattern = First line of unnamed register as the search pattern
                ["<leader>ra"] = "open_again", -- open UI - search pattern = Previous search pattern
                ["<leader>rx"] = "abort",      -- close UI / abort searching / abortadding results
                ["<leader>rc"] = "print_cmd",  -- Print a version of last run rip grep that can be pasted into a shell
                ["<leader>r?"] = "print_status",  -- Print info about the current state of rgflow (mostly useful for deving on rgflow) 
            },
            -- Visual/select mode maps
            x = {
                ["<leader>rg"] = "open_visual", -- open UI - search pattern = current visual selection
            },
        },
        -- Mappings that are local only to the RgFlow UI
        ui = {
            -- Normal mode maps
            n = {
                ["<CR>"]  = "start", -- With the ui open, start a search with the current parameters
                ["<ESC>"] = "close", -- With the ui open, disgard and close the UI window
                ["?"]     = "show_rg_help", -- Show the rg help in a floating window, which can be closed with q or <ESC> or the usual <C-W><C-C>
                ["<BS>"]  = "nop",   -- No operation
                ["<C-^>"] = "nop",   -- No operation
                ["<C-6>"] = "nop",   -- No operation
            },
            -- Insert mode maps
            i = {
                ["<CR>"]  = "start", -- With the ui open, start a search with the current parameters (from insert mode)
                ["<TAB>"] = "auto_complete", -- start autocomplete if PUM not visible, if visible use own hotkeys to select an option
                ["<C-N>"] = "auto_complete", -- start autocomplete if PUM not visible, if visible use own hotkeys to select an option
                ["<C-P>"] = "auto_complete", -- start autocomplete if PUM not visible, if visible use own hotkeys to select an option
            },
        },
        -- Mapping that are local only to the QuickFix window
        quickfix = {
            -- Normal
            n = {
                ["d"] = "qf_delete",        -- QuickFix normal mode delete operator
                ["dd"] = "qf_delete_line",  -- QuickFix delete a line from quickfix
                ["<TAB>"] = "qf_mark",      -- QuickFix mark a line in the quickfix
                ["<S-TAB>"] = "qf_unmark",  -- QuickFix unmark a line in the quickfix window
                ["<BS>"]  = "nop", -- No operation
                ["<C-^>"] = "nop", -- No operation - Probably don't want to switch to a buffer in the little quickfix window
                ["<C-6>"] = "nop", -- No operation
            },
            -- Visual/select mode maps
            x = {
                ["d"] = "qf_delete_visual",       -- QuickFix visual mode delete operator
                ["<TAB>"] = "qf_mark_visual",     -- QuickFix visual mode mark operator
                ["<S-TAB>"] = "qf_unmark_visual", -- QuickFix visual mode unmark operator
            }
        },
    },

    quickfix = {
        -- Whether to use `set relativenumber`
        -- Quickfix window - Whether to show relative numbers
        relative_number = false,

        -- Quickfix window - Whether to wrap text
        wrap = false,

        -- Quickfix window - Blank string to not show color_column, or column number to set it at a certain width
        color_column = "",

        -- String to prepend when marking an entry in the quick fix
        mark_str = "▌",

        -- Open the quickfix window automatically after a serach
        open_qf_list = true,

        -- The QF window is set to the height of the number of matches, but bounded
        -- to be between a min of 3 and a max of this variable:
        max_height_lines = 7,

        -- By default a new search will create a search list after the current qf list
        -- Any lists afterwards will be lost
        -- Set to true such that if you navigate to older qf list with :colder, then
        -- starting a new list will append it after :clast
        new_list_always_appended = false,

        -- Disable CTRL+^ and CTRL + SHIFT + ^ to jump to alt file
        -- Generally don't wish to switch to an alt file within the small QF window
        disable_edit_alt_file = true,
    },

    colors = {
        -- The values map to vim.api.nvim_set_hl {val} parameters, see :h nvim_set_hl
        -- Examples:
        --      RgFlowInputPath    = {fg = "fg", bg="#1234FF", bold=true}
        --      RgFlowInputPattern = {link = "Title"}
        ---- UI
        -- Recommend not setting a BG so it uses the current lines BG
        RgFlowHead          = nil, -- The header colors for FLAGS / PATTERN / PATH blocks
        RgFlowHeadLine      = nil, -- The line along the top of the header
        -- Even though just a background, add the foreground or else when
        -- appending cant see the insert cursor
        RgFlowInputBg       = nil, -- The Input lines
        RgFlowInputFlags    = nil, -- The flag input line
        RgFlowInputPattern  = nil, -- The pattern input line
        RgFlowInputPath     = nil, -- The path input line
        ---- Quickfix
        RgFlowQfPattern     = nil, -- The highlighting of the pattern in the quickfix results
    },
}
