require 'spec_helper'

describe CongressV3::Bill do
  describe '.all' do
    it 'fetches the bills' do
      VCR.use_cassette('bills') do
        @bills = CongressV3::Bill.all
      end
      expect(@bills.results.first).to be_a(CongressV3::Bill)
    end
  end

  describe '#text' do
    it 'fetches the text of the bill' do
      VCR.use_cassette('bill_for_text') do
        @bills = CongressV3::Bill.all(bill_id: "hconres128-114")
      end
      @bill = @bills.results.first
      VCR.use_cassette('bill_text') do
        @bill.text
      end

      expect(@bill.text).to be_a(String)
    end
  end

  describe '#votes' do
    it 'fetches the text of the bill' do
      VCR.use_cassette('bill_find') do
        @bill = CongressV3::Bill.find('hr3590-111')
      end

      VCR.use_cassette('bill_votes') do
        @votes = @bill.votes
      end

      expect(@votes.results.first).to include(*%w{ voter_ids chamber required result vote_type voted_at })
    end
  end

  describe '.search' do
    it 'searches for a bill' do
      VCR.use_cassette('bill_search') do
        @bill = CongressV3::Bill.search(short_title: "Patient Protection and Affordable Care Act").results.first
      end

      expect(@bill.nicknames).to include('obamacare')
    end
  end
end
