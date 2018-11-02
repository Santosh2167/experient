class TransactionsController < ApplicationController
before_action :authenticate_user!
before_action :add_params
    def new
        # @product = Product.find(params[:product_id])
        @transaction = Transaction.create(params[:id])
    end

    def add_params
        params.require().permit(:amount, :product_id, :user_id)
    end
end
