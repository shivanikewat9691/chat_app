require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @user = User.create(email: "shivanisolanki9691@gmail.com", password: "1234567")
  end

  describe "index#get" do 
  	it "index" do 
  		get :index
  		expect(response.status).to eq 200
  	end
  end

  describe "new#get" do 
  	it " " do 
  		get :new
  		expect(response.status).to eq 200
  	end
  end

  describe "create#post" do 
    it "create users successfully" do
      post :create, params: { user: {email: @user.email, password: @user.password }}
      expect(response.status).to eq 201
    end
  end

  describe "create#verify_pin" do 
  	it "verify_pin successfully" do 
  		post :verify_pin, params: { user: {email: @user.email, pin: @user.pin}}
  		expect(response)
  	end
  end

  describe "create#login" do 
  	it "login successfully" do 
  		post :login, params: { user: {email: @user.email, password: @user.password}}
  		expect(response)
  	end
  end

  describe "update" do 
  	it " update successfully" do
  	    @user = User.create(email: "shivanisolanki9691@gmail.com", password: "1234567") 
  		put :update, params: { id: @user.id, user: { email: "shivanisolanki9691@gmail.com", password: "1234567"} }
  		expect(response)
  	end
  end

  describe "delete" do 
  	it " delete successfully" do 
  		delete :destroy, params: { id: @user.id, user: { email: " ", password: " "} }
  		expect(response.status)
  	end
  end
end
