require 'rails_helper'

RSpec.describe AccountsController, type: :controller do

  before(:each) do
    @account = Account.create(first_name: "shivani", last_name: "solanki", city: "indore", password: "1234567")
  end


  describe "index#get" do 
  	it "index" do 
  		get :index
  		expect(response.status).to eq 200
  	end
  end

  describe "new#get" do 
  	it "new" do 
  		get :new
  		expect(response.status).to eq 200
  	end
  end

  describe "create#post" do 
    it "create accounts successfully" do
      post :create, params: { account: {first_name: "Ashish",last_name: @account.last_name, city: @account.city, password: @account.password }}
      expect(response.status).to eq 200
    end
  end
end
