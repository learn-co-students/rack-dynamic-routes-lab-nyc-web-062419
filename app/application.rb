class Application

    @@items = [Item.new("Corn", 4.20)]
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)         
        if req.path.match(/items/) 
            i_name = req.path.split("/items/").last
            record = @@items.find {|i| i.name == i_name}
            if record 
                resp.write record.price
            else 
                resp.status = 400
                resp.write "Item not found"
            end
        else
            resp.status = 404
            resp.write  "Route not found"
        end


        resp.finish
    end
    
end

 