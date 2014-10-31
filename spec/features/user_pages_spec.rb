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

    describe "show" do
    let(:user) { FactoryGirl.create(:user, password: 'foobar') }
    before(:each) do
      login_user('foobar')
      visit user_path(user)
    end

    it { should have_content('Leave a Reference') }
  end

  describe "reset password" do
    let(:user) { FactoryGirl.create(:user, password: 'foobar') }
    before do
      visit login_path
      within('#pwd_reset') { fill_in "Email", with: user.email }
      click_button "Reset my password"
    end
    it { should have_content('Instructions have been sent to your email') }
  end

  describe "signup" do

    before { visit join_path }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button 'Save' }.not_to change(User, :count)
      end
    end

    describe "after submission" do
      before { click_button 'Save' }

      it { should have_content('We will never sell')}
      it { should have_content('errors')}
    end

    describe "clicking the save button on registration" do
      before do
        visit join_path
        click_button "Save"
      end
      it { should have_content('errors') }
    end

    describe "with valid information" do
      before do
        fill_in "First Name",         with: "Albert"
        fill_in "Last Name",         with: "Einstein"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirm Password", with: "foobar"
        fill_in "Postal Code",  with: "M4K 2L7"
      end

      describe "after saving the user" do
        before { click_button 'Save' }
        let (:user) {User.find_by(email: 'user@example.com' )}

        it { should have_link('Logout') }
        it { should have_content('Welcome to Homebass.') }

        describe "followed by signout" do
          before { click_link 'Logout', match: :first }


        it { should have_link('Login') }
        end
      end

      it "should create a user" do
        expect { click_button 'Save' }.to change(User, :count).by(1)
      end
    end
  end
end