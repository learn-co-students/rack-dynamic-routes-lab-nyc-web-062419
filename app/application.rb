class Application

  @@items = [Item.new("Pears", 0.99), Item.new("Figs", 3.42)]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      created_item = req.path.split("/items/").last
      if item = @@items.find {|i| i.name == created_item}
        resp.write item.price
      else 
        resp.write "Item not found"
        resp.status = 400
      end
    else 
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end
end




# class Application
 
#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
 
#     if req.path=="/songs"
#       resp.write "You requested the songs"
#     else
#       resp.write "Route not found"
#       resp.status = 404
#     end
 
#     resp.finish
#   end
# end

# class Application
 
#   @@songs = [Song.new("Sorry", "Justin Bieber"),
#             Song.new("Hello","Adele")]
 
#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
 
#     @@songs.each do |song|
#       resp.write "#{song.title}\n"
#     end
 
#     resp.finish
#   end
# end

#     if req.path.match(/items/)
#       @@items.each do |item|
#         resp.write "#{item}\n"
#       end

#     elsif req.path.match(/search/)
#       search_term = req.params["q"]
#       resp.write handle_search(search_term)

#     elsif req.path.match(/cart/)
#       if @@cart == []
#         resp.write "Your cart is empty."
#       elsif 
#         @@cart.each do |item|
#           resp.write "#{item}\n"
#         end
#       end

#     elsif req.path.match(/add/)
#       add_item = req.params["item"]
#       if @@items.include?(add_item)
#         @@cart << add_item 
#         resp.write "added #{add_item}"
#       else 
#         resp.write "We don't have that item"
#       end

#       else 
#           resp.write "Path Not Found"
#       end

#     resp.finish
#   end

#   def handle_search(search_term)
#     if @@items.include?(search_term)
#       return "#{search_term} is one of our items"
#     else
#       return "Couldn't find #{search_term}"
#     end
#   end
# end
