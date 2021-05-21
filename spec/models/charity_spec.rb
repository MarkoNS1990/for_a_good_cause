require 'rails_helper'

RSpec.describe Charity, type: :model do
  context 'validations' do
    it 'should validate' do
      should validate_presence_of(:name)
    end
    it 'should validate' do
      should validate_presence_of(:content)
    end
  end

  context 'active record belongs to' do
    it 'belongs to users' do
      expect(Charity.reflect_on_association(:user).macro).to be :belongs_to
    end
  end

  context 'active record associations' do
    it { should have_many(:donations) }
  end
end
