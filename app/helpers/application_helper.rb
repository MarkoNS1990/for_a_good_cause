module ApplicationHelper
    def donate_btn(charity)
        donation = Donation.find_by(charity: charity, user: current_user)
        if donation
            '<p class="donated">Thank you for donating to this charity</p>'.html_safe

          else
            button_to('Donate $1', charity_donations_path(charity_id: charity.id),class:'btn btn-block my-btn', method: :post, redirect_to: charities_path)
          end
    end

    
end
