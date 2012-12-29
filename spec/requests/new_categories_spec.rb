require 'spec_helper'

describe "NewCategories" do
  describe "GET /new_categories" do
    it "user creates category" do
      category = FactoryGirl(:category)      
      response.status.should be(200)
    end
  end
end
