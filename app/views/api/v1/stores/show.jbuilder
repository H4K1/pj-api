json.extract! @store, :id, :name, :address, :email, :phone, :created_at, :updated_at

json.orders do 
  json.array! @store.orders do |order|
    json.id order.id
    json.total order.total
  end

end
