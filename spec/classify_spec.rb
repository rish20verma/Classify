require 'spec_helper'

describe Classify do
  let(:imei) { '490154203237518' }
  let(:expiry) { '02/20' }

  it 'should return Good if all detail is valid' do
		data = Classify::Classify.new(imei, expiry)
    expect(data.fraudulent?).to eq('Good') 
  end

	it 'should return Bad if imei number invalid' do
		data = Classify::Classify.new('4901542032', expiry)
    expect(data.fraudulent?).to eq('Bad')
  end

	it 'should return Bad if expiry invalid' do
		data = Classify::Classify.new(imei, '012')
    expect(data.fraudulent?).to eq('Bad')
  end

	it 'should return Bad if both data invalid' do 
		data = Classify::Classify.new('test', 'test')
    expect(data.fraudulent?).to eq('Bad')
  end
end