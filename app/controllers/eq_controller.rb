class EqController < ApplicationController

def new
end

def create
    eq = params[:eq]
    sd = params[:sd].to_f rescue 0.0
    ApplicationSettings.set_equation(Equation.new(eq, sd))
end

def evaluate
        @results = session['results'] || (session['results'] = [])
        begin 
          @result = ApplicationSettings
                      .get_equation.evaluate(params[:variables]) 
          @results << [ params[:variables],  @result]
        end unless params[:variables].nil?
end

def csv
    if params[:button] == 'reset' then  
   	 @result = "" 
   	 @results = []
         session['results'] = nil
         redirect_to eq_evaluate_path, :action=> :get
    end
    @results = session['results'] || (session['results'] = [])
end

end

