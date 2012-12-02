class EqController < ApplicationController

def expression(x,y)
    puts "inside expression #{ApplicationSettings.get_equation} x=#{x} y=#{y}"
    eval(ApplicationSettings.get_equation.gsub("x", x).gsub("y", y))
end

def new
    eq = params[:eq]
    ApplicationSettings.set_equation(eq)
    puts "new equation #{ApplicationSettings.get_equation}"
end

def evaluate


    if params[:button] == 'reset' then  
   	 @result = "" 
   	 @results = []
         session['results'] = nil
    else
       def values_not_provided(params) 
         @x = params[:xvalue]
         @y = params[:yvalue]
         @x.nil? || @y.nil? || @x.length == 0 || @y.length == 0
       end

        @results = session['results'] || (session['results'] = [])
        @result = expression(params[:xvalue], params[:yvalue]) unless values_not_provided(params)

        @results << [ @x, @y, @result]
     end
end

end

