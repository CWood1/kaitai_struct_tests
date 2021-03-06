# Checks coercion of two user types with size (with and without processing)
meta:
  id: process_coerce_usertype1
  endian: le
seq:
  - id: records
    type: record
    repeat: expr
    repeat-expr: 2
types:
  record:
    seq:
      - id: flag
        type: u1
      - id: buf_unproc
        size: 4
        type: foo
        if: flag == 0
      - id: buf_proc
        size: 4
        type: foo
        process: xor(0xaa)
        if: flag != 0
    instances:
      buf:
        value: 'flag == 0 ? buf_unproc : buf_proc'
  foo:
    seq:
      - id: value
        type: u4
