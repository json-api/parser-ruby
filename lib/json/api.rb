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
      json = JSON.parse(source) if source.kind_of?(String)

      JSON::Validator.validate!('lib/json/api/schema.json', json)
    end
  end
end
