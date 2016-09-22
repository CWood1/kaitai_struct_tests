#include <boost/test/unit_test.hpp>

#include <nested_same_name2.h>

#include <iostream>
#include <fstream>
#include <vector>

BOOST_AUTO_TEST_CASE(test_nested_same_name2) {
    std::ifstream ifs("src/nested_same_name2.bin", std::ifstream::binary);
    kaitai::kstream ks(&ifs);
    nested_same_name2_t* r = new nested_same_name2_t(&ks);

    BOOST_CHECK_EQUAL(r->version(), 0x42);
    BOOST_CHECK_EQUAL(r->main_data()->main_size(), 2);
    BOOST_CHECK_EQUAL(r->main_data()->foo()->data1(), std::string("\x11\x11\x11\x11"));
    BOOST_CHECK_EQUAL(r->dummy()->dummy_size(), 3);
    BOOST_CHECK_EQUAL(r->dummy()->foo()->data2(), std::string("\x22\x22\x22\x22\x22\x22"));

    delete r;
}
