class MainController < ApplicationController 
    def main
    end

    def profile
        if current_user.avatar == nil
            @hasavatar = "You do not have an avatar"
        else
            @hasavatar = "You do have an avatar"
        end
    end
end