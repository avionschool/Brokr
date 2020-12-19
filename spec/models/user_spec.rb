require 'rails_helper'

RSpec.describe User, type: :model do

  context "Validations" do
    it "is not valid without role_id" do
      user = User.new(email: 'mat@email.com', encrypted_password: '123456')
      user.save
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:role_id)
      
    end

    it "is not valid without email" do
      user = User.new(role_id: '1', encrypted_password: '123456')
      user.save
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:email) 
    end

    it "should save successfully" do
      user = User.new(role_id: '1', email: 'mat@email.com', encrypted_password: '123456')
      user.save
      expect(user).to be_valid
      expect(user.errors).to_not be_present
    end

  end
end
