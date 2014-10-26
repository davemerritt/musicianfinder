require 'rails_helper'

describe "User pages" do

  subject { page }

  describe "index" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) do
      login_user
      visit root_path
    end
    it { should_not have_content('login') }
  end
end