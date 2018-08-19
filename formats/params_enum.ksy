meta:
  id: params_enum
enums:
  animal:
    1: cat
    2: dog
seq:
  - id: one
    type: u1
    enum: animal
  - id: invoke_with_param
    type: with_param(one)
types:
  with_param:
    params:
      - id: enumerated_one
        type: u1
        enum: animal
    instances:
      is_cat:
        value: enumerated_one == animal::cat # would break if there's a bug
