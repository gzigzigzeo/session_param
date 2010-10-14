module SessionParam
  class Ralitie < ::Rails::Railtie  
    initializer "session_param.initialize" do
      SessionParam.setup!
    end
  end
  
  def self.setup!
    ActionController::Base.send(:extend, SessionParam::ClassMethods)    
  end
  
  module ClassMethods
    # Parameters:
    #   :param_name - method & params name.
    #   :default - default value.
    #   :merge - for Array or Hash default value. Set this to true to ensure that default value will always
    #   present in result.
    def session_param(param_name, default, merge = false)
      define_method param_name do
        param = params[param_name]
        default = instance_exec(&default) if default.is_a?(Proc)
        param.deep_merge!(default) if default.is_a?(Hash) && merge
        param = param | default if default.is_a?(Array) && merge
        param = {} if default.is_a?(Hash) && (param.empty? || !param.is_a?(Hash))   # ?param=
        param = [] if default.is_a?(Array) && (param.empty? || !param.is_a?(Array)) # or type mismatch        
        session[param_name] = param || session[param_name] || default
      end
      helper_method param_name
      
      define_method :"#{param_name}=" do |value|
        session[param_name] = value
      end
    end    
  end  
end