require 'spec_helper'

describe "User Pages" do
  subject { page }


  describe "signup page" do
    before { visit signup_path }
    it { should have_selector('h1', text: "Sign up") }
  end

  describe "sign up" do
    let(:submit) { "Create an account" }
    before do 
      @user = User.new(email: "mr.fanyange@gmail.com", name: "fanyange", password: "foobar", password_confirmation: "foobar")
      visit signup_path
    end
    
    describe "with invalid user" do
      before do
        fill_in "Email", with: " "
        fill_in "Name", with: @user.name
        fill_in "Password", with: @user.password
        fill_in "Password confirmation", with: @user.password_confirmation
        click_button submit
      end

      it { should have_selector('h1', "Sign up") }
      it { should have_selector('div.field_with_errors') }
      it { should have_selector('.error-details') }
    end

    describe "with the same user" do
      before do
        @user.save
        fill_in "Email", with: @user.email
        fill_in "Name", with: @user.name
        fill_in "Password", with: @user.password
        fill_in "Password confirmation", with: @user.password_confirmation
      end

      it "should not create a new user" do
        expect do
          begin
            click_button submit
          rescue ActiveRecord::RecordNotUnique
          end
        end.not_to change(User,:count)
      end
    end

    describe "with valid user" do
      before do
        fill_in "Email", with: @user.email
        fill_in "Name", with: @user.name
        fill_in "Password", with: @user.password
        fill_in "Password confirmation", with: @user.password_confirmation
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button "Create an account" }

        it { should have_selector('.success', 'Your account has successfully created!') }
        it { should have_text(@user.name) }
      end
    end
  end

  describe "edit user profile" do
    let(:user) { FactoryGirl.create(:user) }

    describe "without logging in or wrong logged in user" do
      before do
        # log_out user
        visit edit_user_path(user)
      end

      it { should have_selector('#session_email') }
      it { should have_selector('.flash>.error', "Please first log in") }
    end

    describe "with valid user logged in" do
      before do
        log_in user
        visit edit_user_path(user)
      end

      it { should have_selector('#user_email') }
    end
  end
end