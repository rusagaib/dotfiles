local M = {}

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local telescope = require("telescope.builtin")

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

return M
