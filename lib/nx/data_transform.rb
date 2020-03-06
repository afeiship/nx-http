module Nx
  class DataTransform
    def self.raw(data)
      data
    end

    def self.json(data)
      data.to_json
    end

    def self.urlencoded(data)
      URI.encode_www_form(data)
    end

    def self.multipart(data)
      res = []
      data.each do |key, value|
        res << [key.to_s, value]
      end
      res
    end
  end
end
