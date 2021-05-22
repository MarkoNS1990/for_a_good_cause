require 'rails_helper'

RSpec.describe Donation, type: :model do
  context 'validations' do
    it 'should validate' do
      should validate_presence_of(:user_id)
    end
    it 'should validate' do
      should validate_presence_of(:charity_id)
    end
  end

  context 'active record belongs to' do
    it 'belongs to users' do
      expect(Donation.reflect_on_association(:user).macro).to be :belongs_to
    end
  end
end
