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
        @legislator = CongressV3::Legislator.all.results.first
      end

      expect(@legislator.term.first).to eq(Time.parse(@legislator.term_start))
      expect(@legislator.term.last).to eq(Time.parse(@legislator.term_end))
    end
  end

  describe '#votes' do
    it 'returns the votes of the legislator' do
      VCR.use_cassette('legislators') do
        @legislator = CongressV3::Legislator.all.results.first
      end

      VCR.use_cassette('legislator_votes') do
        @votes = @legislator.votes
      end

      expect(@votes.results.first).to be_a(CongressV3::Vote)
    end
  end
end
