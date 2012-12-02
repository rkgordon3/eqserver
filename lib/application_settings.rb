module ApplicationSettings

  def get_equation
    @@equation
  end

  def set_equation(eq)
    @@equation = eq
  end

  module_function :set_equation, :get_equation
end
