class MainController < ApplicationController 
    before_action :authenticate_user!
    def main
    end

    def home
        @business = current_user.business
    end

    def show
        if current_user.avatar.length > 1
            @hasavatar = "You have an avatar"
        else
            @hasavatar = "You do not have an avatar"
        end
    end

    def update
        current_user.avatar = params[:avatar]
        current_user.save
    end

    # def save_avatar
    #     params.require(current_user).permit(:avatar)
    # end
end