module Api
  module V1
    class AccountsController < ApplicationController
      def index
        result = Account.all
        render json: result
      end

      def update
        amount, id = params.values_at(:amount, :id)

        Handlers::Account.new(account_id: id).update_balance(amount: amount)

        render json: :ok
      end
    end
  end
end
