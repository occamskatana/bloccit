require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement){Advertisement.create!(title: "new advertisement", copy: "rawr", price: 1)}

  	describe "attributes" do 

  		it "should respond to a title" do 
  			expect(advertisement).to respond_to(:title)
  		end

  		it "should respond to a copy body text" do 
  			expect(advertisement).to respond_to(:copy)
  		end

  		it "should respond to a price integer" do
  			expect(advertisement).to respond_to(:price)
  		end
  	end
end
