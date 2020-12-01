class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :email, :phone
end
