class ResqueDelay::Job
  @queue = :delayed

  def self.perform(klass, method, args)
    object = deserialize_object(klass)
    args = args.map {|arg| deserialize_argument(arg) }

    result = object.send method, *args

    result.deliver if result.respond_to?(:deliver)
  end

  def self.enqueue(klass, method, *args)
    params =  args.map {|arg| serialize_argument(arg) }
    object =  serialize_object(klass)
    Resque.enqueue(self, object, method.to_s, params)
  end

  private

  def self.deserialize_object(arg)
    serialized_instance?(arg) ? arg['object_class'].constantize.find(arg['object_id']) : arg.constantize
  end

  def self.deserialize_argument(arg)
    serialized_instance?(arg) ? arg['object_class'].constantize.find(arg['object_id']) : arg
  end

  def self.serialize_object(arg)
    instance?(arg) ? { object_class: arg.class.to_s, object_id: arg.id } : arg.to_s
  end

  def self.serialize_argument(arg)
    instance?(arg) ? { object_class: arg.class.to_s, object_id: arg.id } : arg
  end

  def self.instance?(arg)
    arg.respond_to?(:id) && arg.class.respond_to?(:find)
  end

  def self.serialized_instance?(arg)
    arg.is_a?(Hash) && arg['object_class'].present?
  end

end
