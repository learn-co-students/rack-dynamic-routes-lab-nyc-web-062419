class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path.split("/items/").last
      names = Item.all.collect do |item_instance|
        item_instance.name
      end
      if names.include?(item)
        item_new = Item.all.find do |i|
          i.name == item
        end
        resp.write item_new.price
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
