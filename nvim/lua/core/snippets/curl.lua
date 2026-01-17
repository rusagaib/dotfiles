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
ls.add_snippets("curl", {
  -- public function
  s("curlGet", {
    t({
      "curl -X GET https://jsonplaceholder.typicode.com/api/product?page={page}&category={category}&date={date} -i \\",
      "  -H 'Content-Type: application/json' \\",
      "  -H 'Accept: application/json' \\",
      "  -H 'Authorization: Bearer ' \\",
      "  -d '{\"name\":\"product name\"}'",
    }),
  }),

  s("curlPost", {
    t({
      "curl -X POST https://jsonplaceholder.typicode.com/api/product -i \\",
      "  -H 'Content-Type: application/json' \\",
      "  -H 'Accept: application/json' \\",
      "  -H 'Authorization: Bearer ' \\",
      "  -d '{\"name\":\"product name\"}'",
    }),
  }),

  s("curlPut", {
    t({
      "curl -X PUT https://jsonplaceholder.typicode.com/api/product/{ID} -i \\",
      "  -H 'Content-Type: application/json' \\",
      "  -H 'Accept: application/json' \\",
      "  -H 'Authorization: Bearer ' \\",
      "  -d '{\"name\":\"product name\"}'",
    }),
  }),

  s("curlDelete", {
    t({
      "curl -X DELETE https://jsonplaceholder.typicode.com/api/product/{ID} -i \\",
      "  -H 'Content-Type: application/json' \\",
      "  -H 'Accept: application/json' \\",
      "  -H 'Authorization: Bearer ' \\",
    }),
  }),

  -- end add_snippets
}, {
  -- adding key snippets for it's filetype
  key = "curl"
})
