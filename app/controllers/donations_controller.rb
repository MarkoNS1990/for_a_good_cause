class DonationsController < ApplicationController
    def home
        @donations = Donation.all
    end
    def new
        @donation = Donation.new
    end

    def create
        @donation = current_user.donations.new(charity_id: params[:charity_id])
    
        if @donation.save
          redirect_to charities_path , notice: 'You donated 1$ successfully.'
        else
          redirect_to charities_path, alert: 'You cannot donate.'
        end
    end
    
end