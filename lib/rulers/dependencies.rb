class Object
  def self.const_missing(c)
    # Prevent an infinite loop of calls back and forth between const_missing and const_get
    # by bailing out if there's already a different call to const_missing on the call stack.
    caller.each do |call|
      return nil if call.to_s.include? "`const_missing'"
    end

    require Rulers.to_underscore(c.to_s)
    klass = Object.const_get(c)

    klass
  end
end
