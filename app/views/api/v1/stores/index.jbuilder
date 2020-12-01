json.array! @stores do |store|
  json.id store.id
  json.name store.name
  json.address store.address
  json.email store.email
  json.phone store.phone
  json.products store.products do |product|
    json.id product.id
    json.name product.name
    json.sku product.sku
    json.type product.type
    json.price product.price
  end
end
