local M = {}

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local telescope = require("telescope.builtin")
local Path = require("plenary.path")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

M.PickInertiaPage = function()
  telescope.find_files({
    prompt_title = "Search Inertia (Vue) Pages",
    cwd = "./resources/js/pages/",                                -- Search Path dir
    find_command = { "find", ".", "-type", "f", "-name", "*.vue" }, -- find all file *.vue
    attach_mappings = function(_, map)
      actions.select_default:replace(function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        if selection then
          -- Clear str path after "resources/js/pages/" and get the shi on it..
          local cleaned_path = selection.value:gsub("^%.?/?", "") -- del str `./`
          cleaned_path = cleaned_path:gsub("^resources/js/pages/", "") -- del str root path
          cleaned_path = cleaned_path:gsub("%.vue$", "")          -- del str .vue

          -- save teks on buffer Neovim
          -- local inertia_text = "return inertia('" .. cleaned_path .. "'"
          local inertia_text = "'" .. cleaned_path .. "'"
          vim.api.nvim_put({ inertia_text }, "", true, true)
        end
      end)
      return true
    end,
  })
end

M.PickViewPage = function()
  telescope.find_files({
    prompt_title = "Search Blade Pages",
    cwd = "./resources/views/",                                         -- Search Path dir
    find_command = { "find", ".", "-type", "f", "-name", "*.blade.php" }, -- find all file *.vue
    attach_mappings = function(_, map)
      actions.select_default:replace(function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        if selection then
          -- Clear str path after "resources/js/pages/" and get the shi on it..
          local cleaned_path = selection.value:gsub("^%.?/?", "") -- del str `./`
          cleaned_path = cleaned_path:gsub("^resources/views/", "") -- del str root path
          cleaned_path = cleaned_path:gsub("%.blade.php$", "") -- del str .vue

          -- save teks on buffer Neovim
          -- local inertia_text = "return inertia('" .. cleaned_path .. "'"
          local blade_view_text = "'" .. cleaned_path .. "'"
          vim.api.nvim_put({ blade_view_text }, "", true, true)
        end
      end)
      return true
    end,
  })
end

M.SearchInertiaResources = function()
  telescope.find_files({
    prompt_title = "Search Inertia resources UI",
    cwd = "./resources/js/",                                      -- Hanya cari di folder ini
    find_command = { "find", ".", "-type", "f", "-name", "*.vue" }, -- Cari file .vue
  })
end

M.SearchRouteNames = function()
  telescope.grep_string({
    prompt_title = "Search Route Names",
    cwd = "./routes/", -- Cari hanya di folder routes
    search = "->name(", -- Cari semua route dengan nama
    attach_mappings = function(_, map)
      actions.select_default:replace(function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        if selection then
          -- Ambil teks dari hasil pencarian
          local route_name = selection.text:match("->name%(['\"](.-)['\"]%)") -- Ambil isi dari ->name('xxx')

          if route_name then
            -- Masukkan ke dalam buffer
            local route_text = "'" .. route_name .. "'"
            vim.api.nvim_put({ route_text }, "", true, true)
          else
            print("Route name not found!")
          end
        end
      end)
      return true
    end,
  })
end

M.SpatiePermisionPicker = function()
  telescope.grep_string({
    prompt_title = "Spatie Permissions Picker",
    search = "Permission::create(", -- Cari permission di RoleSeeder.php
    cwd = "./database/seeders/",
    attach_mappings = function(prompt_bufnr, _)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        if selection then
          local line = selection.text -- Ambil baris yang dipilih

          -- STEP 1: Bersihkan awal "Permission::create(['name' => '"
          line = line:gsub(".*%['name'%]%s*=>%s*['\"]", "")

          -- STEP 2: Bersihkan akhir "']);"
          line = line:gsub("['\"]%s*%]%);.*", "")

          line = line:gsub("^%s*", "")

          line = line:gsub(".*=>%s*['\"]", "")

          -- STEP 3: Masukkan hasil bersih ke buffer
          vim.api.nvim_put({ "'" .. line .. "'" }, "", true, true)
        end
      end)
      return true
    end,
  })
end

M.LaravelMethodPicker = function()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1]

  local get_controller_path = function(controller_name)
    local controller_file = controller_name:gsub("\\", "/"):gsub("^App/", "") .. ".php"
    local base_path = vim.fn.getcwd()
    return base_path .. "/app/" .. controller_file
  end

  local extract_functions = function(file_path)
    local funcs = {}
    for line in io.lines(file_path) do
      local name = line:match("^%s*public function ([%w_]+)")
      if name then
        table.insert(funcs, name)
      end
    end
    return funcs
  end

  local extract_controller_from_line = function(current_line, current_row)
    -- Find controller name from current line 
    local short_name = current_line:match("%[([%w_]+)::class")
    if not short_name then return nil end

    -- Find controller definition `use ...Controller`
    local lines = vim.api.nvim_buf_get_lines(0, 0, current_row, false)
    for _, l in ipairs(lines) do
      local full = l:match("^%s*use%s+([%w\\_]+"..short_name..");")
      if full then
        return full:gsub(";", "")
      end
    end
    return nil
  end

  local controller = extract_controller_from_line(line, row)

  if not controller then
    print("Controller not found on this lines.")
    return
  end

  local file_path = get_controller_path(controller)
  if not Path:new(file_path):exists() then
    print("File controller not found: " .. file_path)
    return
  end

  local funcs = extract_functions(file_path)

  pickers.new({}, {
    prompt_title = "Select Function",
    finder = finders.new_table {
      results = funcs
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        if not selection then return end

        local new_line = line:gsub(", ]", ", '" .. selection[1] .. "']")
        vim.api.nvim_buf_set_lines(0, row - 1, row, false, { new_line })
      end)
      return true
    end
  }):find()
end


return M
