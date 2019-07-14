class Application

    @@items = [Item.new("Disney band-aids for adult size scrapes", 2.11)]
    
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.path.split("/items/").last
            item = @@items.find do |item_instance|
                item_instance.name == item_name
            end 
                    if item
                        resp.write "#{item.price}"
                    else 
                    resp.status = 400
                    resp.write "Item not found"
                end  
            else
                resp.status = 404
                resp.write "Route not found"
            end 
            resp.finish
        end 
    end 
                    
                
                

            