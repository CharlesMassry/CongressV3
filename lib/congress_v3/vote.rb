class CongressV3::Vote
  def self.all(params={})
    CongressV3::Request.votes(params)
  end

  def initialize(params)
    params.each do |key, value|
      instance_variable_set("@#{key}", value)
      self.class.send(:attr_reader, key)
    end
  end
end
