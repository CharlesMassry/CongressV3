require 'spec_helper'

describe CongressV3::Legislator do
  describe '#full_name' do
    it 'returns the full name of the legislator' do
      VCR.use_cassette('legislators') do
        legislator = CongressV3::Legislator.all.results.first
        expect(legislator.full_name).to include(legislator.first_name)
        expect(legislator.full_name).to include(legislator.last_name)
      end
    end
  end

  describe '#term' do
    it 'returns a range of the start of term and the end of term for the legislator' do
      VCR.use_cassette('legislators') do
        legislator = CongressV3::Legislator.all.results.first
        expect(legislator.term.first).to eq(Time.parse(legislator.term_start))
        expect(legislator.term.last).to eq(Time.parse(legislator.term_end))
      end
    end
  end
end
