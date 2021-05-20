module ApplicationHelper
    def donate_btn(charity)
        donation = Donation.find_by(charity: charity, user: current_user)
        if donation
            '<p class="donated">Thank you for donating to this charity</p>'.html_safe
            
          else
            button_to('Donate!', charity_donations_path(charity_id: charity.id), method: :post)
          end
    end
end
