class TransactionsController < ApplicationController
before_action :authenticate_user!
    def new
        @product = Product.find(params[:product_id])
    end
end
