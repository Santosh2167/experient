class TransactionsController < ApplicationController
before_action :authenticate_user!
before_action :add_params
    def new
        @transaction = Transaction.new
    end

    def create
        @transaction = Transaction.new(add_params)
        @transaction.save
    end

    def add_params
        params.require(@transaction).permit(:amount, :product_id, :user_id)
    end
end
