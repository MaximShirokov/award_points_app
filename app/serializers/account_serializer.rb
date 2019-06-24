class AccountSerializer < ActiveModel::Serializer
  attribute :name do
    object.user.name
  end
  
  attributes :balance
end
