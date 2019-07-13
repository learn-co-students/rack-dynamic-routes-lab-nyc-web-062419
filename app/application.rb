require 'pry'
class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item = req.path.split("/items/").last
            # binding.pry
            names = Item.all.collect {|item| item.name}
            if names.include?(item)
                item_f = @@items.find{|i| i.name == item}
                resp.write item_f.price
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