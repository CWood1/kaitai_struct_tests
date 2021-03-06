#include <boost/test/unit_test.hpp>

#include <bits_enum.h>

#include <iostream>
#include <fstream>
#include <vector>

BOOST_AUTO_TEST_CASE(test_bits_enum) {
    std::ifstream ifs("src/fixed_struct.bin", std::ifstream::binary);
    kaitai::kstream ks(&ifs);
    bits_enum_t* r = new bits_enum_t(&ks);

    // 50 41 (4 + 8 + 1) = 0101|0000 0100|0|001
    BOOST_CHECK_EQUAL(r->one(), bits_enum_t::ANIMAL_PLATYPUS);
    BOOST_CHECK_EQUAL(r->two(), bits_enum_t::ANIMAL_HORSE);
    BOOST_CHECK_EQUAL(r->three(), bits_enum_t::ANIMAL_CAT);

    delete r;
}
