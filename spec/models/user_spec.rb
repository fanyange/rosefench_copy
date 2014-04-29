require 'spec_helper'

describe User do
  before { @user = User.new(name: "fanyange", email: "mr.fanyange@gmail.com", password: "foobar", password_confirmation: "foobar") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }


  describe "when username is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end


  describe "when user name has wront chars" do
    it "should not be valid" do
      names = %W[+fanyange fan\ yange fan*fange 1agb]
      names.each do |n|
        @user.name = n
        expect(@user).to be_invalid
      end
    end
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
       foo@bar_baz.com foo@bar+baz.com]
       addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "Valid Password" do
    describe "when password is not present" do
      before { @user.password = " "; @user.password_confirmation= " " }

      it { should_not be_valid }
    end

    describe "when password doesn't match confirmation" do
      before { @user.password_confirmation = "foobarbar" }
      it { should_not be_valid }
    end
  end

  describe "password authenticate" do
    before do
      @user.save
    end
    let(:found_user) { User.find_by(email: @user.email) }
    describe "when give a wrong password" do
      it { should_not eq found_user.authenticate("invalid") }
    end

    describe "when give a correct password" do
      it { should eq found_user.authenticate(@user.password) }
    end
  end
end
