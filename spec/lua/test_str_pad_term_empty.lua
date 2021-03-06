local luaunit = require("luaunit")

require("str_pad_term_empty")

TestStrPadTermEmpty = {}

function TestStrPadTermEmpty:test_str_pad_term_empty()
    local r = StrPadTermEmpty:from_file("src/str_pad_term_empty.bin")

    luaunit.assertEquals(r.str_pad, "")
    luaunit.assertEquals(r.str_term, "")
    luaunit.assertEquals(r.str_term_and_pad, "")
    luaunit.assertEquals(r.str_term_include, "@")
end
