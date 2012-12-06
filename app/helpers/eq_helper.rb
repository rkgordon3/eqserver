module EqHelper
  def results_list lst 
     out = "<table>"
     lst.each do |e| 
       if e[0].nil? then next end
       out += "<tr>"
       func = "f("
       e[0].each_pair do |k,v|
            out += "<td>#{k}=#{v}</td>"
            func += ", " unless func == "f(" 
            func += k  
       end
       func += ")"
       out += "<td>#{func}=#{e[1]}</td>"
       out += "</tr>"
     end 
     out += "</table>"
     out.html_safe
  end

  def csv_list(lst, sep)
     out = ""
     lst.each do |e| 
       e[0].each_value {  |v| out += "#{v}#{sep}" }
       out += "#{e[1]}<br/>" 
     end 
     out.html_safe
  end

end
