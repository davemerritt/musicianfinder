require 'rails_helper'

describe "User pages" do

  subject { page }

  describe "index" do
    let(:user) { FactoryGirl.create(:user, password: 'foobar') }
    before(:each) do
      login_user('foobar')
      visit root_path
    end

    it { should_not have_content('Login') }
    it { should have_content('My Messages') }
  end
end