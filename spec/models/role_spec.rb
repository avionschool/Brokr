require 'rails_helper'

RSpec.describe Role, type: :model do
  context "Validations" do
    it "is not valid without name" do
      role = Role.new
      role.save
      expect(role).to_not be_valid
      expect(role.errors).to be_present
      expect(role.errors.to_h.keys).to include(:name)
    end
  end
end
