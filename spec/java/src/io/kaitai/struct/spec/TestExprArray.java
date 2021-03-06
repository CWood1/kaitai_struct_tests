// Autogenerated from KST: please remove this line if doing any edits by hand!

package io.kaitai.struct.spec;

import io.kaitai.struct.testformats.ExprArray;
import org.testng.annotations.Test;
import static org.testng.Assert.*;
public class TestExprArray extends CommonSpec {
    @Test
    public void testExprArray() throws Exception {
        ExprArray r = ExprArray.fromFile(SRC_DIR + "expr_array.bin");

        assertIntEquals(r.aintSize(), 4);
        assertIntEquals(r.aintFirst(), 7657765);
        assertIntEquals(r.aintLast(), 16272640);
        assertIntEquals(r.aintMin(), 49185);
        assertIntEquals(r.aintMax(), 1123362332);
        assertIntEquals(r.afloatSize(), 3);
        assertEquals(r.afloatFirst(), -2.6839530254859364E-121);
        assertEquals(r.afloatLast(), -1.1103359815095273E-175);
        assertEquals(r.afloatMin(), -8.754689149998834E+288);
        assertEquals(r.afloatMax(), -1.1103359815095273E-175);
        assertIntEquals(r.astrSize(), 3);
        assertEquals(r.astrFirst(), "foo");
        assertEquals(r.astrLast(), "baz");
        assertEquals(r.astrMin(), "bar");
        assertEquals(r.astrMax(), "foo");
    }
}
