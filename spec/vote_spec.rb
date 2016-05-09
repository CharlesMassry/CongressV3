require 'spec_helper'

describe CongressV3::Vote do
  describe '.all' do
    it 'returns a vote response' do
      VCR.use_cassette('vote_all') do
        @vote = CongressV3::Vote.all.results.first
      end

      expect(@vote).to be_a(CongressV3::Vote)
    end
  end
end
