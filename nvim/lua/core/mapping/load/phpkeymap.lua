local keymap = vim.keymap
-- solely for Laravel Projk (laravelutls)
-- M.laravelutls = require('utils.laravelutls')
--
-- Laravel Inertia::class/inertia() helper Pages path picker (lip)
-- M.PickInertiaPage = function()
keymap.set(
	"n",
	"<leader>lip",
	[[<Esc>:lua require('utils').laravelutls.PickInertiaPage()<CR>]],
	{ noremap = true, silent = true, desc = "[laravelutls] Laravel Inertia pages Picker (lip)" }
)
-- Laravel Blade resources/views path picker (lbv)
-- M.PickViewPage = function()
keymap.set(
	"n",
	"<leader>lbv",
	[[<Esc>:lua require('utils').laravelutls.PickViewPage()<CR>]],
	{ noremap = true, silent = true, desc = "[laravelutls] Laravel Blade resources View picker (lbv)" }
)
-- Laravel Go to Blade views (lgv)
-- M.GoToBladeView = function()
keymap.set(
	"n",
	"<leader>lgv",
	[[<Esc>:lua require('utils').laravelutls.GoToBladeView()<CR>]],
	{ noremap = true, silent = true, desc = "Laravel Go to Blade views (lgv)" }
)
-- Laravel Inertia Search Resources UI (lir)
-- M.SearchInertiaResources = function()
keymap.set(
	"n",
	"<leader>lir",
	[[<Esc>:lua require('utils').laravelutls.SearchInertiaResources()<CR>]],
	{ noremap = true, silent = true, desc = "[laravelutls] Laravel Inertia search Resources (lir)" }
)
-- Laravel named routes (lnr)
-- M.SearchRouteNames = function()
keymap.set(
	"n",
	"<leader>lnr",
	[[<Esc>:lua require('utils').laravelutls.SearchRouteNames()<CR>]],
	{ noremap = true, silent = true, desc = "[laravelutls] Laravel Named Routes picker (lnr)" }
)
-- Laravel Spatie Permission Picker (lpp)
-- M.SpatiePermisionPicker = function()
keymap.set(
	"n",
	"<leader>lpp",
	[[<Esc>:lua require('utils').laravelutls.SpatiePermisionPicker()<CR>]],
	{ noremap = true, silent = true, desc = "[laravelutls] Laravel spatie Permission Picker (lpp)" }
)
-- Laravel Named Method Picker (lnm)
-- M.LaravelMethodPicker = function()
keymap.set(
	"n",
	"<leader>lnm",
	[[<Esc>:lua require('utils').laravelutls.LaravelMethodPicker()<CR>]],
	{ noremap = true, silent = true, desc = "[laravelutls] Laravel Named Method Picker (lnm)" }
)
-- PHPStan Larevel App Analyze (lsa)
-- M.LaravelPhpStanAppAnalyze = function()
keymap.set(
	"n",
	"<leader>lsa",
	[[<Esc>:lua require('utils').laravelutls.LaravelPhpStanAppAnalyze()<CR>]],
	{ noremap = true, silent = true, desc = "[laravelutls] Laravel PhpStan App Analyze (lsa)" }
)

-- (Ide-Helper) Larevel Ide-Helper Generate (lg)
-- M.LaravelIdeHelperGenerate = function()
keymap.set(
	"n",
	"<leader>lg",
	[[<Esc>:lua require('utils').laravelutls.LaravelIdeHelperGenerate()<CR>]],
	{ noremap = true, silent = true, desc = "[laravelutls] (Ide-Helper) Laravel Ide-Helper Generate (lg)" }
)

-- (Ide-Helper) Larevel Ide-Helper Generate Models (lgm)
-- M.LaravelIdeHelperGenerateModels = function()
keymap.set(
	"n",
	"<leader>lgm",
	[[<Esc>:lua require('utils').laravelutls.LaravelIdeHelperGenerateModels()<CR>]],
	{ noremap = true, silent = true, desc = "[laravelutls] (Ide-Helper) Laravel Ide-Helper Generate Models (lgm)" }
)
