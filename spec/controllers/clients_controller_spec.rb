require 'spec_helper'
include Devise::TestHelpers

describe ClientsController do
  describe 'GET index' do
    let(:user) { FactoryGirl.create(:user) }
    let(:client) { FactoryGirl.create(:client, user: user) }
    before { sign_in user }

    it "assigns @clients" do
      get :index
      expect(assigns(:clients)).to eq([client])
    end
  end
end
