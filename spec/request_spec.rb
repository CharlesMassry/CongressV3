require 'spec_helper'

describe CongressV3::Request do

  describe '.legislators' do
    it 'creates an array of legislators' do
      VCR.use_cassette('legislators') do
        expect(CongressV3::Request.legislators.first).to be_a(CongressV3::Legislator)
      end
    end
  end
end
