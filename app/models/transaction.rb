class Transaction < ApplicationRecord
  belongs_to :account

  enum operation_type: %i[increase decrease]
end
