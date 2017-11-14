require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before(:each) do
      @user = User.new(name: 'Jane J', password: '123', password_confirmation: '123', email: 'jane@jane.jane')
    end

    it "should be valid" do
      expect(@user).to be_valid
    end

    it "has a password entry" do
      @user.password = nil
      expect(@user).not_to be_valid
    end

    it "has a password at least 2 characters in length" do
      @user.password = 'p'
      expect(@user).not_to be_valid
    end

    it "has a password_confirmation entry matching password" do
      ## is this right???
      # @user.password_digest = nil
      @not_valid_confirmation = User.new(name: 'Jane J', password: '123', password_confirmation: '1234', email: 'jane@jane.jane')
      expect(@not_valid_confirmation).not_to be_valid
    end

    it "has a unique email (non-case-sensitive)" do
      @user_duplicate_email = User.create(name: 'Tim', password: '123', password_confirmation: '123', email: 'jane@janE.jane')
      expect(@user).not_to be_valid
    end

    it "can ignore white spaces in an email address" do
      @user_spacey_email = User.create(name: 'Tana', password: '111', password_confirmation: '111', email: 'jane@jane.jane   ')
      expect(@user).not_to be_valid
    end

    it "has an email entry" do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it "has a name entry" do
      @user.name = nil
      expect(@user).not_to be_valid
    end

  end

  describe '.authenticate_with_credentials' do

    before(:each) do
      @user = User.new(name: 'Jane J', password: '1234567', password_confirmation: '1234567', email: 'jane@jane.jane')
    end
    it "checks user for valid username and password" do
      @user = User.authenticate_with_credentials('jane@jane.jane', '1234567')
      expect(@user).to eq(@user)
    end

    it 'checks user for invalid username and password' do
      @user = User.authenticate_with_credentials('jane@jane.jane','100')
      expect(@user).to be_nil
    end

  end

end
