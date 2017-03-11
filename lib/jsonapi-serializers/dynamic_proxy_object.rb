module JSONAPI
	class DynamicProxyObject < BasicObject

    def initialize(target)
      @cache = {}
      @target = target
    end

    def class
      @target.class
    end

    def cache_key(name, args)
      "#{name}_#{args.hash}"
    end

    def method_missing(name, *args, &block)
      key = cache_key(name, args)
      @cache[key] ||= @target.send(name, *args, &block)
      @cache[key]
    end
  
  end
end