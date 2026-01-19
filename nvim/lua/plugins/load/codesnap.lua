return {
	-- // init env setup for version 1.6.3 (https://github.com/mistricky/codesnap.nvim/tree/be6d6b9a3b5e6999edbda76b16dace03d9bfcd3d)
	-- // also use commit id be6d6b9a3b5e6999edbda76b16dace03d9bfcd3d
	-- // on lazy-lock.json
	-- sudo apt-get install build-essential
	-- sudo apt-get install clang libclang-dev
	-- install rust:
	-- curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	"mistricky/codesnap.nvim",
	-- tag = "v2.0.0", -- just comment it if use 1.6.3
	-- // for version 1.6.3 use build = "make" cuz need to compile code using rust which needed init setup env for rust
	-- // for version v2.0^ no needed compile or setup rust env, just put exsac commit info & use version tag = "v2.xx"
	-- // for version v2.0^ still buggy on inital setup dunno why.., just close or kill nvim pid and open again, it's solved right now..
	build = "make",
	config = function()
		require("codesnap").setup({
			watermark = "",
			save_path = "~/Pictures", -- save_path doesn't work on v2.xx need to change on customkeymaps.lua manualy and set dir ~/Pictures/with_date_time_format.png
			-- save_path = "/home/rusagaib/Pictures", -- save_path doesn't work on v2.xx need to change on customkeymaps.lua manualy and set dir ~/Pictures/with_date_time_format.png
			-- save_path = vim.fn.expand("~/Pictures/."), -- save_path doesn't work on v2.xx need to change on customkeymaps.lua manualy and set dir ~/Pictures/with_date_time_format.png
			has_breadcrumbs = true,
			bg_theme = "bamboo",
		})
	end,
}
