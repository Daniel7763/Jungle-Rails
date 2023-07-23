require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    it "should only create a user is a password is present" do
  
      @user = User.new(email:"surfbeak@gmail.com", first_name:"Chicken", last_name:"Joe", password:"surfing", password_confirmation:"surfing")
      @user.save
      expect(@user).to be_valid
    end

    it "should only create a user if first name is present" do
  
      @user = User.new(email:"surfbeak@gmail.com", first_name:nil, last_name:"Joe", password:"surfing", password_confirmation:"surfing")
      @user.save
      expect(@user).to_not be_valid
    end

    it "should only create a user if last name is present" do
  
      @user = User.new(email:"surfbeak@gmail.com", first_name:"Chicken", last_name:nil, password:"surfing", password_confirmation:"surfing")
    
      expect(@user).to_not be_valid
    end

    it "should only create a user if email is present" do
  
      @user = User.new(email:nil, first_name:"Chicken", last_name:"Joe", password:"surfing", password_confirmation:"surfing")
      @user.save
      expect(@user).to_not be_valid
    end

    it 'should enforce uniqueness of email (case-insensitive)' do
      @user1 = User.new(email:"surf@gmail.com", first_name:"Chicken", last_name:"Joe", password:"surfing", password_confirmation:"surfing")
      @user1.save

      @user2 = User.new(email:"SURF@gmail.com", first_name:"Chicken", last_name:"Joe", password:"surfing", password_confirmation:"surfing")
      @user2.save
      
      expect(@user2).to_not be_valid
    end

    it "should only create a user pass is more than 6 chars" do
  
      @user = User.new(email:"surf@gmail.com", first_name:"Chicken", last_name:"Joe", password:"1234", password_confirmation:"1234")
      @user.save

      expect(@user).to_not be_valid
    end

  end

  describe ".authenticate_with_credentials" do
    it "athenticates a user with a user & pass" do
      @user = User.new(email:"surf@gmail.com", first_name:"Chicken", last_name:"Joe", password:"surfing", password_confirmation:"surfing")
      @user.save
      @verify = User.authenticate_with_credentials("surf@gmail.com", "surfing")

      expect(@user).to eql(@verify)
    end

    it "athenticates a user with email spaces before and after" do
      @user = User.new(email:" surf@gmail.com ", first_name:"Chicken", last_name:"Joe", password:"surfing", password_confirmation:"surfing")
      @user.save
      @verify = User.authenticate_with_credentials(" surf@gmail.com ", "surfing")

      expect(@user).to eql(@verify)
    end

    it "athenticates a user with mis mathed caps in email" do
      @user = User.new(email:"SURF@gmail.com", first_name:"Chicken", last_name:"Joe", password:"surfing", password_confirmation:"surfing")
      @user.save
      @verify = User.authenticate_with_credentials("sURF@gmail.com", "surfing")

      expect(@user).to eql(@verify)
    end

  end





end



