require 'rails_helper'

describe Product do
	context "when the product has comments" do
		before do
  			 @product = FactoryGirl.create(:product)
      			 @user = FactoryGirl.create(:user)
			 @product.comments.create!(rating: 5, user: @user, body: "Lovely tea!")
			 @product.comments.create!(rating: 3, user: @user, body: "It's okay!")
			 @product.comments.create!(rating: 1, user: @user, body: "Horrible tea!")
		end

		it "returns the average rating of all comments" do
		      expect(@product.average_rating).to eq 3
		end

		it "should not validate products without full characteristica" do
			expect(Product.new(description: "Nice tea")).not_to be_valid
		end
	end	
end