require 'spec_helper'

describe "AuthenticationPages" do
  subject { page }

  describe "login page" do

    before { visit login_path }

    it { should have_selector('h1','Log in') }
  end

  describe 'log in' do
    
    before { visit login_path }

    describe 'with invalid information' do
      before { click_button 'Log in' }

      it { should have_selector('.error', "Invalid email / password") }
    end

    describe 'with valid information' do

      let(:user) { FactoryGirl.create(:user) }

      before do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Log in"
      end

      it { should have_selector('.success', 'Logged in') }
      it { should have_text(user.name.titlecase) }
      it { should have_text(user.email.downcase) }
    end
  end
end
