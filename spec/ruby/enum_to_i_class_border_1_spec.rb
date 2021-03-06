require 'enum_to_i_class_border_1'
require 'enum_to_i_class_border_2'

RSpec.describe EnumToIClassBorder1 do
  it 'parses test properly' do
    r = EnumToIClassBorder1.from_file('src/enum_0.bin')

    expect(r.pet_1).to eq :animal_cat
    expect(r.pet_2).to eq :animal_chicken
    expect(r.checker.is_dog()).to eq true
  end
end
