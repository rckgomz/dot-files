--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
vim.opt.relativenumber = true
vim.opt.cursorcolumn = true
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
local _, actions = pcall(require, "telescope.actions")
lvim.builtin.telescope.defaults.mappings = {
  -- for input mode
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
  },
  -- for normal mode
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  },
}

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
  "markdown",
  "make",
  "regex",
  "dockerfile",
  "dot",
  "html",
  "jsdoc",
  "json5",
  "scss",
  "toml",
  "vim",
  "hcl",
  "gomod",
  "http",
  "go",
  "graphql",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
      { exe = "gofmt", filetypes = { "go" }},
      { exe = "goimports", filetypes = { "go" }},
}

-- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
     { exe = "golangci_lint", filetypes = { "go" }},
}

-- Additional Plugins
lvim.plugins = {
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },

    {
      "f-person/git-blame.nvim",
      event = "BufRead",
      config = function()
        vim.cmd "highlight default link gitblame SpecialComment"
        vim.g.gitblame_enabled = 0
      end,
    },
		{
		  "ruifm/gitlinker.nvim",
		  event = "BufRead",
		  config = function()
  		  require("gitlinker").setup {
  		        opts = {
  		          -- remote = 'github', -- force the use of a specific remote
  		            -- adds current line nr in the url for normal mode
  		            add_current_line_on_normal_mode = true,
  		          -- callback for what to do with the url
  		            action_callback = require("gitlinker.actions").copy_to_clipboard,
  		          -- print the url after performing the action
  		            print_url = false,
  		          -- mapping to call url generation
  		            mappings = "<leader>gy",
  		        },
  		      }
		  end,
		  requires = "nvim-lua/plenary.nvim",
		},
    {
		  "sindrets/diffview.nvim",
		  event = "BufRead",
		},
    {
      "p00f/nvim-ts-rainbow",
      config = function()
        require("nvim-treesitter.configs").setup {
          highlight = {
            enable = true,
          },
          rainbow = {
            enable = true,
            -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil, -- Do not enable for files with more than n lines, int
            -- colors = {}, -- table of hex strings
            -- termcolors = {} -- table of colour name strings
          }
        }
      end,
    },
    {
      "ray-x/lsp_signature.nvim",
      event = "BufRead",
      config = function()
        require "lsp_signature".setup()
      end,
    },
    {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
    },
    {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      setup = function()
        -- colores are too bright
        vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
        vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

        vim.g.indentLine_enabled = 1
        vim.g.indent_blankline_char = "▏"
        vim.g.indent_blankline_filetype_exclude = {"help", "terminal", "dashboard", "NvimTree" }
        vim.g.indent_blankline_buftype_exclude = {"terminal" }
        vim.g.indent_blankline_bufname_exclude= { "NvimTree" }
        vim.g.indent_blankline_show_trailing_blankline_indent = false
        vim.g.indent_blankline_show_first_indent_level = false
        vim.g.indent_blankline_space_char_blankline = " "
        vim.g.indent_blankline_show_current_context = true
        vim.g.indent_blankline_show_current_context_start = true
        vim.g.indent_blankline_char_highlight_list= {
          'IndentBlanklineIndent1',
          'IndentBlanklineIndent2',
          'IndentBlanklineIndent3',
          'IndentBlanklineIndent4',
          'IndentBlanklineIndent5',
          'IndentBlanklineIndent6',
        }
      end,
   },
    {
      "karb94/neoscroll.nvim",
      event = "WinScrolled",
      config = function()
        require('neoscroll').setup({
              -- All these keys will be mapped to their corresponding default scrolling animation
              mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
              '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
              hide_cursor = true,          -- Hide cursor while scrolling
              stop_eof = true,             -- Stop at <EOF> when scrolling downwards
              use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
              respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
              cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
              easing_function = nil,        -- Default easing function
              pre_hook = nil,              -- Function to run before the scrolling animation starts
              post_hook = nil,              -- Function to run after the scrolling animation ends
              })
      end
    },
    {
      "folke/todo-comments.nvim",
      event = "BufRead",
      config = function()
        require("todo-comments").setup()
      end,
    },
   {
 			"aserowy/tmux.nvim",
 		   config = function()
 			   require("tmux").setup({
 			    	-- here, e.g. to enable default bindings
 			      -- overwrite default configuration
 			      copy_sync = {
 			      	-- enables copy sync and overwrites all register actions to
 			      	-- sync registers *, +, unnamed, and 0 till 9 from tmux in advance
 			      	enable = true,
 			      },
 			      navigation = {
 			      	-- enables default keybindings (C-hjkl) for normal mode
 			        enable_default_keybindings = false,
              cycle_navigation = false,
 			      },
 			      resize = {
 			      	-- enables default keybindings (M-hjkl) for normal mode
 			      	enable_default_keybindings = false,
 			      }
      })
 			end
 		},
--   { 'alexghergh/nvim-tmux-navigation', config = function()
--         require'nvim-tmux-navigation'.setup {
--             disable_when_zoomed = true, -- defaults to false
--             keybindings = {
--                 left = "<C-h>",
--                 down = "<C-j>",
--                 up = "<C-k>",
--                 right = "<C-l>",
--                 last_active = "<C-\\>",
--                 -- next = "<C-Space>",
--             }
--         }
--     end
-- },
    {
      "preservim/vimux"
    },
}


lvim.builtin.treesitter.rainbow = {
  enable = true,
  extended_mode = true
}

lvim.builtin.lualine.style = "lvim"
local components = require("lvim.core.lualine.components")

lvim.builtin.lualine.sections.lualine_y = {
  -- components.spaces,
  components.location
}

vim.cmd([[
  :nnoremap <f12> a
  :inoremap <f12> <Esc>
]])

lvim.keys.normal_mode = {
   -- navigation
            ["<C-h>"] = ":lua require'tmux'.move_left()<cr>",
            ["<C-j>"] = ":lua require'tmux'.move_bottom()<cr>",
            ["<C-k>"] = ":lua require'tmux'.move_top()<cr>",
            ["<C-l>"] = ":lua require'tmux'.move_right()<cr>",
   -- resize
            ["<M-h>"] = ":lua require'tmux'.resize_left()<cr>",
            ["<M-j>"] = ":lua require'tmux'.resize_bottom()<cr>",
            ["<M-k>"] = ":lua require'tmux'.resize_top()<cr>",
            ["<M-l>"] = ":lua require'tmux'.resize_right()<cr>",
 }


lvim.builtin.which_key.mappings["v"] = {
  name = "+Tmux",
  p = { ":VimuxPromptCommand<cr>", "Prompt cmd" },
  l = { ":VimuxRunLastCommand<cr>", "Run last cmd" },
}
