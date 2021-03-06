// Autogenerated from KST: please remove this line if doing any edits by hand!

#include <boost/test/unit_test.hpp>
#include <repeat_eos_bit.h>
#include <iostream>
#include <fstream>
#include <vector>

BOOST_AUTO_TEST_CASE(test_repeat_eos_bit) {
    std::ifstream ifs("src/enum_0.bin", std::ifstream::binary);
    kaitai::kstream ks(&ifs);
    repeat_eos_bit_t* r = new repeat_eos_bit_t(&ks);

    BOOST_CHECK_EQUAL(r->nibbles()->size(), 16);

    delete r;
}
