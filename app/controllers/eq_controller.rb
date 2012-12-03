class EqController < ApplicationController

def expression(x,y)
    eval(ApplicationSettings.get_equation.gsub("x", x).gsub("y", y))+ApplicationSettings.error
end

def new
    eq = params[:eq]
    sd = params[:sd].to_f rescue 0.0
    puts "++++++++++++++++++++new equation is #{eq}"
    ApplicationSettings.set_equation(eq, sd)
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
        begin 
          @result = expression(params[:xvalue], params[:yvalue]) 

          @results << [ @x, @y, @result]
        end unless values_not_provided(params)
     end
end

def csv
     @results = session['results'] || (session['results'] = [])
end

end

