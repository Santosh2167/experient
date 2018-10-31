class MainController < ApplicationController 
    def main
    end

    def show
        if current_user.avatar == nil
            @hasavatar = "You do not have an avatar"
        else
            @hasavatar = "You do have an avatar"
        end
    end

    def update
        current_user.avatar = params[:avatar]
        current_user.save
    end

    def save_avatar
        params.require(current_user).permit(:avatar)
    end
end