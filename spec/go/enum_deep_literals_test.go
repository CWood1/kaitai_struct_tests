// Autogenerated from KST: please remove this line if doing any edits by hand!

package spec

import (
	"os"
	"testing"
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	. "test_formats"
	"github.com/stretchr/testify/assert"
)

func TestEnumDeepLiterals(t *testing.T) {
	f, err := os.Open("../../src/enum_0.bin")
	if err != nil {
		t.Fatal(err)
	}
	s := kaitai.NewStream(f)
	var r EnumDeepLiterals
	err = r.Read(s, &r, &r)
	if err != nil {
		t.Fatal(err)
	}

	tmp1, err := r.IsPet1Ok()
	if err != nil {
		t.Fatal(err)
	}
	assert.EqualValues(t, true, tmp1)
	tmp2, err := r.IsPet2Ok()
	if err != nil {
		t.Fatal(err)
	}
	assert.EqualValues(t, true, tmp2)
}
