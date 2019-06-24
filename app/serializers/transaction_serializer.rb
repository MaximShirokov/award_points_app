class TransactionSerializer < ActiveModel::Serializer
  attribute :name do
    object.account.user.name
  end

  attributes :amount, :operation_type

  attribute :date do
    object.created_at.strftime('%d-%m-%Y')
  end
end
