# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Store.destroy_all

complements = ["Carne", "Pimiento", "Tomate", "Cebolla", "Bacon", "Aceitunas", "Jamón", "Pollo", "Piña", "Pepperoni"] 

stores = [
  'Plaza de armas #234',
  'Providencia #847',
  'Avenida brasil #23'
]

# Metodo para generar un SKU unico
def uniqueSku()
  currentSku = Product.all.map{|product| product.sku}
  sku = rand.to_s[2..11]
 sku = rand.to_s[2..11] if currentSku.include?(sku) 
  return sku
end


# Generar stores
stores.each do |store| 
  Store.create(
    name: "Papa Johns",
    address: store,
    phone: rand.to_s[2..10],
  )
end




# Generar complemetnos(products)
complements.each do |complement|
  Product.create(
    name: complement,
    sku:uniqueSku,
    type: "Complement",
    price: rand(250..500)
  )

end

# Asigna productos aleatoreos a un store

Store.all.each do |store| 
  store.products << Product.all.shuffle[0..4]
end
