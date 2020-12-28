require 'rails_helper'

RSpec.describe User, type: :model do

  context "Validations" do
    it "is not valid without role_id" do
      user = User.new
      user.save
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:role_id)
    end

    it "is not valid without email" do
      user = User.new
      user.save
      expect(user).to_not be_valid
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:email)
    end
  end
end
