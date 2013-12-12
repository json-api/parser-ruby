require "json/api/version"
require 'json'
require 'json-schema'

module JSON
  module Api
    def self.parse(source, opts={})
      json = JSON.parse(source, opts)

      validate(json, opts)

      json
#    rescue
#      nil
    end

    def self.validate(source, opts={})
      source = JSON.parse(source) if source.kind_of?(String)
      JSON::Validator.validate!(File.expand_path('api/schema.json', File.dirname(__FILE__)), source)
    end
  end
end
