require 'spec_helper'

describe ClientsController do
  describe 'GET index' do
    it "assigns @clients" do
      client = FactoryGirl.create(:client)
      get :index
      expect(assigns(:clients)).to eq([client])
    end
  end
end
