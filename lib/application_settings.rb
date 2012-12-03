module ApplicationSettings

  def get_equation
    @@equation
  end

  def set_equation(eq, sd = 0.0)
    puts "+++++++++ using sd =  #{sd}"
    @@sd = sd
    @@erf = RandomGaussian.new(0.0, sd)
    @@equation = eq
  end

  def standard_dev
   @@sd
  end

  def error
    @@erf.rand
  end

  module_function :set_equation, :get_equation, :error, :standard_dev
end
