class ApplicationController < ActionController::Base
  protect_from_forgery

    def get_equation
      @@equation
    end

    def set_equation(val)
      @@equation = val
    end
end
