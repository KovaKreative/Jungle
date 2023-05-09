require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do
      @user = User.new(first_name: "Nolan", last_name: "North", email: "awesome.guy@gmail.com", password: "Treasure", password_confirmation: "Treasure")
      expect(@user).to be_valid
      expect(@user.errors.full_messages).to match_array([])
    end
    
    it "is invalid with first_name missing" do
      @user = User.new(first_name: nil, last_name: "North", email: "awesome.guy@gmail.com", password: "Treasure", password_confirmation: "Treasure")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "is invalid with last_name missing" do
      @user = User.new(first_name: "Nolan", last_name: nil, email: "awesome.guy@gmail.com", password: "Treasure", password_confirmation: "Treasure")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    
    it "is invalid with email missing" do
      @user = User.new(first_name: "Nolan", last_name: "North", email: nil, password: "Treasure", password_confirmation: "Treasure")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it "is invalid with email not unique" do
      User.create(first_name: "Bela", last_name: "Lugosi", email: "count@dracula.com", password: "Transylvania", password_confirmation: "Transylvania")

      @user = User.new(first_name: "Christopher", last_name: "Lee", email: "count@dracula.com", password: "Wallachia", password_confirmation: "Wallachia")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end
      
    it "is invalid with email not unique and case insensitive" do
      User.create(first_name: "Bela", last_name: "Lugosi", email: "count@dracula.com", password: "Transylvania", password_confirmation: "Transylvania")

      @user = User.new(first_name: "Christopher", last_name: "Lee", email: "COUNT@DRACULA.COM", password: "Wallachia", password_confirmation: "Wallachia")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end
    
    it "is invalid with password blank password" do
      @user = User.new(first_name: "Bela", last_name: "Lugosi", email: "count@dracula.com", password: "", password_confirmation: "")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it "is invalid with password less than 6 characters" do
      @user = User.new(first_name: "Bela", last_name: "Lugosi", email: "count@dracula.com", password: "Blood", password_confirmation: "Blood")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it "is invalid with password confirmation mismatched" do
      @user = User.new(first_name: "Bela", last_name: "Lugosi", email: "count@dracula.com", password: "Transylvania", password_confirmation: "Wallachia")
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
  end
  
  describe '.authenticate_with_credentials' do
    it "gets the user information if email and password are correct" do
      @newUser = User.create(first_name: "Bela", last_name: "Lugosi", email: "count@dracula.com", password: "Transylvania", password_confirmation: "Transylvania")
      @user = User.authenticate_with_credentials("count@dracula.com", "Transylvania")
      expect(@user).to be_an_instance_of User
    end
  end
  
  describe '.authenticate_with_credentials' do
    User.create(first_name: "Bela", last_name: "Lugosi", email: "count@dracula.com", password: "Transylvania", password_confirmation: "Transylvania")
    
    it "gets the user information if email and password are correct" do
      @user = User.authenticate_with_credentials("count@dracula.com", "Transylvania")
      expect(@user).to be_an_instance_of User
    end
    
    it "gets the user information if email and password are correct with white space" do
      @user = User.authenticate_with_credentials("  count@dracula.com ", "Transylvania")
      expect(@user).to be_an_instance_of User
    end
    
    it "gets the user information if email and password are correct but email is capitalized" do
      @user = User.authenticate_with_credentials("COUNT@DRACULA.COM", "Transylvania")
      expect(@user).to be_an_instance_of User
    end

    it "returns nil when the email is wrong" do
      @user = User.authenticate_with_credentials("kount@dracula.com", "Transylvania")
      expect(@user).to be(nil)
    end

    it "returns nil when the password is wrong" do
      @user = User.authenticate_with_credentials("count@dracula.com", "Wallachia")
      expect(@user).to be(nil)
    end

  end

end
