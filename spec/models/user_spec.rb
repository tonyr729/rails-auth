require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'class methods' do
    it 'should authenticate login' do
      good_user = User.create(name: 'x', email: 'y', password: 'z')

      user_1 = User.authenticate('y', 'z')
      user_2 = User.authenticate('y', 'fail')
      user_3 = User.authenticate('bob', 'fails')
      
      expect(user_1).to eq(good_user)
      expect(user_2).to eq(nil)
      expect(user_3).to eq(nil)
    end
  end
end
 