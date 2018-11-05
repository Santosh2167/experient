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

    def advanced_search_process
        # render json: params
        # products = Product.all
        # byebug
        # query = Product.where(["keywords ILIKE ? AND category ILIKE ? AND cost ILIKE ?",
        #                     "%#{params[:keywords] if params[:keywords].present?}%", 
        #                     "%#{params[:category] if params[:category].present?}%",
        #                     "%#{params[:cost] if params[:cost].present?}%"
        #                 ])
        # byebug
        query = Product.all   
        query = Product.where("keywords ILIKE ?","%#{params[:keywords]}%")
            .where(category_id: params[:category_id].to_i)
            .where("cost >= ?",params[:min_cost].to_f)
            .where("cost <= ?",params[:max_cost].to_f)
        
        

            # render json: query

            render json: query

    end

    






end