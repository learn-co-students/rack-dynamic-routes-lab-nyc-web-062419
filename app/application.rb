class Application

    @@items = []

def call(env)

    req = Rack::Request.new(env)
    resp = Rack::Response.new

    if req.path.match(/items/)
        new_item = req.path.split("/").last
        item_find = @@items.find{|item| item.name == new_item}
            if item_find 
                resp.write item_find.price
            else resp.write "Item not found"
                resp.status = 400
    end

        else 
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish

        end 
        end




      



