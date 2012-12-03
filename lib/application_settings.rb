module ApplicationSettings

  def get_equation
    @@equation
  end

  def set_equation(eq, mean = 0.0)
    puts "+++++++++ using mean =  #{mean}"
    @@mean = mean
    @@erf = RandomGaussian.new(mean)
    @@equation = eq
  end

  def mean
   @@mean
  end

  def error
    @@erf.rand
  end

  module_function :set_equation, :get_equation, :error, :mean
end
