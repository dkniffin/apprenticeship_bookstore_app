require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new }

  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:password) }
  it { is_expected.to respond_to(:orders) }

  describe "valid user" do
    subject(:user) { build(:user) }

    it "is valid" do
      expect(user).to be_valid
    end
    it "has an email" do
      expect(user.email).to be_a(String)
    end
    it "has a password" do
      expect(user.password).to be_a(String)
    end
  end
  describe "invalid user" do
    let(:no_email) { build(:user, email: nil) }
    let(:invalid_email) { build(:user, email: 'bogus') }
    let(:no_password) { build(:user, password: nil) }

    it "is invalid without email" do
      expect(no_email).to_not be_valid
      expect(no_email.errors).to include(:email)
      expect(no_email.errors[:email]).to include("can't be blank")
    end
    it "is invalid with invalid email" do
      expect(invalid_email).to_not be_valid
    end
    it "is invalid without password" do
      expect(no_password).to_not be_valid
      expect(no_password.errors).to include(:password)
      expect(no_password.errors[:password]).to include("can't be blank")
    end
  end
end
