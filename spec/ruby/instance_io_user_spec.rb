require 'instance_io_user'

RSpec.describe InstanceIoUser do
  it 'parses test properly' do
    r = InstanceIoUser.from_file('src/instance_io.bin')

    expect(r.qty_entries).to eq 3

    expect(r.entries[0].name).to eq 'the'
    expect(r.entries[1].name).to eq 'rainy'
    expect(r.entries[2].name).to eq 'day it is'
  end
end