require "rails_helper"

describe User, :type => :model do
 	it "should not validate users without an email address" do
    	expect(User.new(password:1234567)).to_not be_valid
  	end
end 