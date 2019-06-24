module Api
  module V1
    class TransactionsController < ApplicationController
      def index
        result = Transaction.all
        render json: result
      end
    end
  end
end
