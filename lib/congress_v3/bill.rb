class CongressV3::Bill
  def self.all(params={})
    CongressV3::Request.bills(params)
  end

  def self.search(params={})
    CongressV3::Request.bill_search(params)
  end

  def initialize(params)
    params.each do |key, value|
      instance_variable_set("@#{key}", value)
      self.class.send(:attr_reader, key)
    end
  end

  def text
    @text ||= if @last_version && @last_version['urls'] && @last_version['urls']['html']
                CongressV3::Request.bill_text(@last_version['urls']['html'])
              else
                "No text for this bill"
              end
  end

  def votes(params={})
    @votes ||= CongressV3::Request.bill_votes(bill_id, params)
  end
end
