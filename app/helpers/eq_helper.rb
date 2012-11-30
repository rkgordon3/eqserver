module EqHelper
  def results_list lst 
     out = "<table>"
     lst.each do |e| 
       out += "<tr><td>x=#{e[0]}</td><td>y=#{e[1]}</td><td>f(x,y)=#{e[2]}</td></tr>" 
     end 
     out += "</table>"
     out.html_safe
  end

end
