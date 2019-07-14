require 'pry'

class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

#if the req.path method matches the passed in regex items
    if req.path.match(/items/)
    #req.path="/items/Figs"
    #req.path.split = ["/items/Figs"] turns the string into n array
    #req.path.split("/items/") = ["", "Figs"]
    #req.path.split("/items/").last = "Figs"
      item_name = req.path.split("/items/").last
      #go into @@items array, use find method to locate variable.name that is equal to variable of item_name ("figs")
      if item = @@items.find{|i| i.name == item_name} 
      #output the value at the key of price for that variable. 
      resp.write item.price
      # binding.pry
      else
      resp.write "Item not found"
      resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
      resp.finish

  end

end
