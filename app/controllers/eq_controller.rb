class EqController < ApplicationController

def expression(x,y)
    puts "inside expression #{ApplicationSettings.get_equation} x=#{x} y=#{y}"
    eval(ApplicationSettings.get_equation.gsub("x", x).gsub("y", y))+ApplicationSettings.error
end

def new
    eq = params[:eq]
    mean = params[:mean].to_f rescue 0.0
    ApplicationSettings.set_equation(eq, mean)
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

