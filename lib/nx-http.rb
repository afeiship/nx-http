require "nx/version"
require 'net/http'
require 'uri'

module Nx
  module Http
    def self.request(inMethod, inUrl, inData={}, inOptions = {})
      # uri:
      uri = URI(inUrl)
      method = inMethod.downcase

      # http:
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'

      # request:
      method_class = Net::HTTP.const_get method.capitalize
      req = method_class.new(uri)

      # callback area:
      if method == 'get'
        uri.query = URI.encode_www_form(inData)
      else
          inOptions.each do |key, value|
            req[key] = value
          end
      end

      # yield(uri, method, req, http)
      begin
          http.request(req)    
      rescue => exception
          raise exception
      end
    end

    class << self
      ['get', 'post', 'put', 'options'].each do |item|
          define_method item.to_sym do |url, data, options|
            self.request(item, url, data || {}, options || {})
          end
      end
    end

  end
end
