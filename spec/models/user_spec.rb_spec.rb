require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "creates a user" do
      user = User.new ({password_digest: 'password123', email: 'fakefake@fake.com', name: 'fake'})
      user.save
      expect(user).to be_an_instance_of(User)
    end

    it "needs a matching password and password_confirmation" do
      user = User.new ({password: "password123", password_confirmation: "password456", email: "fakefake@fake.com", name: "fake"})
      user.save
      expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "has a unique email" do
      user = User.new({password_digest: "password123", email: "fakefake@fake.com", name: "fake"})
      user.save
      user2 = User.new({password_digest: "password456", email: "FAKEFAKE@fake.com", name: "fake2"})
      user2.save
      expect(user.valid?).to be_falsey
    end


  end
end