#include <boost/test/unit_test.hpp>

#include <meta_xref.h>

#include <iostream>
#include <fstream>
#include <vector>

BOOST_AUTO_TEST_CASE(test_meta_xref) {
    std::ifstream ifs("src/fixed_struct.bin", std::ifstream::binary);
    kaitai::kstream ks(&ifs);
    meta_xref_t* r = new meta_xref_t(&ks);

    delete r;
}