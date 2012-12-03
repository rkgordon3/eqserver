module EqHelper
  def results_list lst 
     out = "<table>"
     lst.each do |e| 
       out += "<tr><td>x=#{e[0]}</td><td>y=#{e[1]}</td><td>f(x,y)=#{e[2]}</td></tr>" 
     end 
     out += "</table>"
     out.html_safe
  end

  def csv_list(lst, sep)
     out = ""
     lst.each do |e| 
       out += "#{e[0]}#{sep}#{e[1]}#{sep}#{e[2]}<br/>" 
     end 
     out.html_safe
  end

end
