require 'rails_helper'

RSpec.describe User, type: :model do
  context 'correctly validations for users' do
    let(:user) { User.create!(email: 'test@test.com', password: '123456') }

    it 'check a correct username length' do
      expect(user.valid?).to be true
    end
    it 'check an incorrect email ' do
      user = User.create(email: '123', password: '123456')
      expect(user.valid?).to be false
    end
    it 'check a incorrect password length' do
      user = User.create(email: '123', password: '12')
      expect(user.valid?).to be false
    end
    it 'check creation with the same email' do
      User.create(email: 'test@test.com', password: '123456')
      user2 = User.create(email: 'test@test.com', password: '123456')
      expect(user2.valid?).to be false
    end

    it 'check a correct password length' do
      user = User.create(email: 'test@test.com', password: '123456')
      expect(user.valid?).to be true
    end
    it 'check a incorrect password length' do
      user = User.create(email: 'test@test.com', password: '123')
      expect(user.valid?).to be false
    end
  end
end
