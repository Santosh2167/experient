class SearchController < ApplicationController
    def index
        # @books = Book.search(params[:search])
    end

    def search_result
        @products = Product.search(params[:search])
    end

    






end