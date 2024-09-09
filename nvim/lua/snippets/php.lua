local ls = require("luasnip")
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

-- spec snippet
ls.add_snippets("php", {

  -- public function
  s("pubfn", {
    t("public function "), i(1, "functionName"), t("("), i(2), t({") {", "\t"}),
    i(0),
    t({"", "}"}),
  }),

  -- public static function
  s("pubsfn", {
    t("public static function "), i(1, "functionName"), t("("), i(2), t({") {", "\t"}),
    i(0),
    t({"", "}"}),
  }),

  -- private function
  s("prfn", {
    t("private function "), i(1, "functionName"), t("("), i(2), t({") {", "\t"}),
    i(0),
    t({"", "}"}),
  }),

  -- private static function
  s("prsfn", {
    t("private static function "), i(1, "functionName"), t("("), i(2), t({") {", "\t"}),
    i(0),
    t({"", "}"}),
  }),

-- end add_snippets
},{
    -- adding key snippets for it's filetype
    key = "php"
})
