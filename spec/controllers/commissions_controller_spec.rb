require 'spec_helper'

describe CommissionsController do

  describe "GET 'commissions'" do
    it "returns http success" do
      get 'commissions'
      response.should be_success
    end
  end

end
