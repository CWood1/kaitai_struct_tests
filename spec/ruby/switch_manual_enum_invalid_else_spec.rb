require 'switch_manual_enum_invalid_else'

RSpec.describe SwitchManualEnumInvalidElse do
  it 'parses test properly' do
    r = SwitchManualEnumInvalidElse.from_file('src/enum_negative.bin')

    expect(r.opcodes.size).to eq 2

    expect(r.opcodes[0].code).to eq 255
    expect(r.opcodes[0].body.value).to eq 123

    expect(r.opcodes[1].code).to eq 1
    expect(r.opcodes[1].body.value).to eq 123
  end
end
