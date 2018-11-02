class SearchController < ApplicationController
    def index
        # @books = Book.search(params[:search])
    end

    def search_result
        @products = Product.search(params[:search])
    end

    def advanced_search
        @groups = AgeGroup.pluck("range","id")
        @category = Category.pluck("category","id")

    end

    






end