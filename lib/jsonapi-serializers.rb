require "jsonapi-serializers/version"
require "jsonapi-serializers/attributes"
require "jsonapi-serializers/serializer"
require "jsonapi-serializers/dynamic_proxy_object"

module JSONAPI
  module Serializer
    class Error < Exception; end
    class AmbiguousCollectionError < Error; end
    class InvalidIncludeError < Error; end
  end
end
