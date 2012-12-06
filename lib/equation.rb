class Equation
  attr_accessor :vars
  attr_reader   :standard_deviation

  def initialize(eq, sd)
   @eq = eq
   @vars = {}
   @regex = /[a-z][0-9]*/
   @standard_deviation = sd
   @erf = RandomGaussian.new(0.0, sd)
   eq.scan(@regex).flatten.each { |v| @vars[v] = nil }
  end

  def evaluate(hash)
     raise ArgumentError, 'Wrong number of variables'  unless hash.keys == @vars.keys 
     eval(@eq.gsub(@regex, hash)) + @erf.rand
  end
end
