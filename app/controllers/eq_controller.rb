class EqController < ApplicationController

def expression(x,y)
    x*x + y*y
end

def evaluate
    @results = session['results'] || (session['results'] = [])

    x = params[:xvalue].to_i
    y = params[:yvalue].to_i
    @result = expression(x,y)
    @results << [ x, y, @result]
    if params[:button] == 'reset' then  
   	 @result = "" 
   	 @results = []
         session['results'] = nil
    end
end

end
