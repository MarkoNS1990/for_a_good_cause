module ApplicationHelper
    def donate_btn(charity)
        donation = Donation.find_by(charity: charity, user: current_user)
        if donation
            button_to('Undo donation!', charity_donation_path(id: donation.id, charity_id: charity.id), method: :delete)
          else
            button_to('Donate!', charity_donations_path(charity_id: charity.id), method: :post)
          end
    end
end
