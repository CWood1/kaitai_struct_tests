// Autogenerated from KST: please remove this line if doing any edits by hand!

package spec

import (
	"os"
	"testing"
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	. "test_formats"
	"github.com/stretchr/testify/assert"
)

func TestTypeIntUnaryOp(t *testing.T) {
	f, err := os.Open("../../src/fixed_struct.bin")
	if err != nil {
		t.Fatal(err)
	}
	s := kaitai.NewStream(f)
	var r TypeIntUnaryOp
	err = r.Read(s, &r, &r)
	if err != nil {
		t.Fatal(err)
	}

	assert.EqualValues(t, 16720, r.ValueS2)
	assert.EqualValues(t, int64(4706543082108963651), r.ValueS8)
	tmp1, err := r.UnaryS2()
	if err != nil {
		t.Fatal(err)
	}
	assert.EqualValues(t, -16720, tmp1)
	tmp2, err := r.UnaryS8()
	if err != nil {
		t.Fatal(err)
	}
	assert.EqualValues(t, -int64(4706543082108963651), tmp2)
}
