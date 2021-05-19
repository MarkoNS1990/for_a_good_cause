class UsersController < ApplicationController
    

    def home
        @users = User.all
    end

    



end