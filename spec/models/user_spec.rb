require 'rails_helper'

describe User do
  before do
    @user = FactoryGirl.build(:user)
  end

    subject { @user }

  it { should respond_to(:email) }
  it { should respond_to(:crypted_password) }
  it { should respond_to (:salt)}
  it { should respond_to(:city) }
  it { should respond_to(:postal_code) }
  it { should respond_to(:bio) }
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:remember_me_token) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:longitude) }
  it { should respond_to(:latitude) }
  it { should respond_to(:looking_for) }
  it { should respond_to(:personal_url) }
  it { should respond_to(:genre_list) }
  it { should respond_to(:instrument_list) }
  it { should respond_to(:target_references) }
  it { should respond_to(:source_references) }
  it { should respond_to(:invitations) }
  it { should respond_to(:invitations_received) }

  it { should be_valid}

  describe "when first name is not present" do
    before { @user.first_name = " " }
    it { should_not be_valid }
  end

  describe "when first name is too long" do
    before { @user.first_name = "a" * 36 }
    it { should_not be_valid }
  end

  describe "when last name is not present" do
    before { @user.last_name = " " }
    it { should_not be_valid }
  end

  describe "when last name is too long" do
    before { @user.last_name = "a" * 36 }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when postal_code is not present" do
    before { @user.postal_code = " " }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user = FactoryGirl.build(:user, password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
end