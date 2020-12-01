json.array! @orders do |order|
  json.id order.id
  json.store_id order.store 
  json.products order.products
end
