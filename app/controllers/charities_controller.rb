class CharitiesController < ApplicationController
    def index
        @charities = Charity.all.order("created_at DESC")
    end

    def new
        @charity = Charity.new
    end

    def create
        @user = current_user
        @charity = @user.charities.build(charity_params)

        if @charity.save
            redirect_to charities_path
        else
            render 'new'
        end
    end

    def show
        @charities = Charity.where(user_id:current_user.id)
    end
    

    private

    def charity_params
        params.require(:charity).permit(:name,:content,:user_id)
    end

end