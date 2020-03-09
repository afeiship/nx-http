module Nx
  class Http
    def self.upload(in_url, in_data)
      url = URI(in_url)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = url.scheme == "https"

      data = DataTransform.multipart(in_data)
      request = Net::HTTP::Post.new(url.path)
      request.set_form(data, ContentType::MULTIPART)
      if block_given?
        yield(http, request)
      end
      http.request(request)
    end

    def self.request(in_method, in_url, in_data = {}, in_options = {})
      # uri:
      uri = URI(in_url)
      method = in_method.downcase

      # http:
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == "https"

      # request:
      method_class = Net::HTTP.const_get method.capitalize
      request = method_class.new(uri)

      # callback area:
      if method == "get"
        uri.query = URI.encode_www_form(in_data)
      else
        in_options.each do |key, value|
          if key == "content_type"
            ContentType.const_get value.upcase
          else
            request[key] = value
          end
        end
      end

      if block_given?
        yield(uri, method, request, http)
      end

      begin
        http.request(request)
      rescue => exception
        raise exception
      end
    end

    class << self
      ["get", "post", "put", "delete", "options"].each do |item|
        define_method item.to_sym do |url, data = {}, options = {}|
          self.request(item, url, data, options)
        end
      end
    end
  end
end
