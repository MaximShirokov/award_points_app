module Handlers
  class Account
    class AmountError < StandardError; end
    class BalanceError < StandardError; end

    attr_reader :account_id

    def initialize(account_id:)
      @account_id = account_id
    end

    def update_balance(amount:)
      raise(AmountError, 'Amount not indicated') if amount.blank?

      amount = amount.to_i

      raise(AmountError, 'Amount is zero') if amount.zero?

      ActiveRecord::Base.transaction do
        account = ::Account.lock.find(account_id)

        if amount.positive?
          account.balance += amount
          account.transactions.create!(operation_type: Transaction.operation_types[:increase], amount: amount)
        else
          raise(BalanceError, "Account ##{account_id} balance is zero") if account.balance.zero?
          raise(BalanceError, "Account ##{account_id} balance less than amount") if account.balance < amount.abs

          account.balance -= amount.abs
          account.transactions.create!(operation_type: Transaction.operation_types[:decrease], amount: amount.abs)
        end

        account.save!
        account
      end
    end
  end
end
