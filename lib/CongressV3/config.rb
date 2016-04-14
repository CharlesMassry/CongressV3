module CongressV3
  class Config
    @@api_key = ""

    def self.api_key
      @@api_key
    end

    def self.api_key=(new_key)
      @@api_key = new_key
    end
  end
end
