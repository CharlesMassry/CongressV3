class CongressV3::Legislator
  def self.all(params={})
    CongressV3::Request.legislators(params)
  end

  def initialize(params)
    params.each do |key, value|
      instance_variable_set("@#{key}", value)
      self.class.send(:attr_reader, key)
    end
  end

  def full_name
    if middle_name
      "#{first_name} #{middle_name} #{last_name}"
    else
      "#{first_name} #{last_name}"
    end
  end

  def term
    Time.parse(term_start)...Time.parse(term_end)
  end

  def votes(params={})
    @votes ||= CongressV3::Request.legislator_votes(bioguide_id, params)
  end
end
