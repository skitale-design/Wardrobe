require 'cloth'

describe 'Cloth' do
 test_cloth = Cloth.read_from_file('spec/fixtures/test.txt')

  it 'Read from test.txt file' do


    expect(test_cloth.name).to eq 'Тестовое название одежды'
    expect(test_cloth.type).to eq 'Тестовый тип'
    expect(test_cloth.temperature_range).to eq  -10..10
  end

  it 'Tests fits? method for temperature 0 and -15' do

    expect(test_cloth.fits?(0)).to eq true
    expect(test_cloth.fits?(-15)).to eq false

  end


end
