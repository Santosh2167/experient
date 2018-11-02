class TransactionsController < ApplicationController
before_action :authenicate_user!
    def new
        @transaction = Transaction.new
    end

    def create
        @transaction.user_id = current_user.user_id
    end
end
