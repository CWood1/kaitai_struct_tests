<?php
namespace Kaitai\Struct\Tests;

class SwitchManualIntTest extends TestCase {
    public function testSwitchManualInt() {
        $r = SwitchManualInt::fromFile(self::SRC_DIR_PATH . "/switch_opcodes.bin");

        $this->assertEquals(4, count($r->opcodes));

        $this->assertEquals(83, $r->opcodes[0]->code);
        $this->assertEquals('foobar', $r->opcodes[0]->body->value);

        $this->assertEquals(73, $r->opcodes[1]->code);
        $this->assertEquals(0x42, $r->opcodes[1]->body->value);

        $this->assertEquals(73, $r->opcodes[2]->code);
        $this->assertEquals(0x37, $r->opcodes[2]->body->value);

        $this->assertEquals(83, $r->opcodes[3]->code);
        $this->assertEquals('', $r->opcodes[3]->body->value);
    }
}
