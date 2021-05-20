class CharitiesController < ApplicationController
    before_action :authenticate_user!
    def index
        @charities = Charity.all.order("created_at DESC")
        @user = current_user
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

    def destroy
        @charity = Charity.find(params[:id])
        @charity.destroy

        redirect_to charities_path
    end

    def update
        @charity = Charity.find(params[:id])

        if @charity.update(charity_params)
            redirect_to charities_path
        else
            render 'edit'
        end
    end

    def edit
        @charity = Charity.find(params[:id])
    end
    

    private

    def charity_params
        params.require(:charity).permit(:name,:content,:user_id)
    end

end