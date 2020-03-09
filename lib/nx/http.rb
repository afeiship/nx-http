module Nx
  class Http
    def self.upload(in_url, in_data)
      post(in_url, in_data) do |http, request, uri, method|
        data = DataTransform.multipart(in_data)
        request.set_form(data, ContentType::MULTIPART)
        yield(http, request, uri, method)
      end
    end

    def self.request(in_method, in_url, in_data = {}, in_options = {})
      default_options = { data_type: :urlencoded, response_type: :raw }
      options = default_options.merge(in_options)
      # uri:
      uri = URI(in_url)
      method = in_method.downcase

      # http:
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == "https"

      # request:
      method_class = Net::HTTP.const_get method.capitalize
      request = method_class.new(uri)
      request.content_type = ContentType.const_get(options[:data_type].upcase)

      # callback area:
      if method == "get"
        uri.query = URI.encode_www_form(in_data)
      else
        options.each do |key, value|
          request[key] = value
        end
        request.body = DataTransform.send(options[:data_type], in_data)
      end

      yield(http, request, uri, method) if block_given?

      begin
        response = http.request(request)
        options[:response_type] == :json ? JSON.parse(response) : response
      rescue => exception
        raise exception
      end
    end

    class << self
      ["get", "post", "put", "delete", "options"].each do |item|
        define_method item.to_sym do |url, data = {}, options = {}, &block|
          self.request(item, url, data, options) do |http, request|
            block.call(http, request) unless block.nil?
          end
        end
      end
    end
  end
end
