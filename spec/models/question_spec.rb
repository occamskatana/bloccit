require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { Question.new!(title: "New Question Title", body: "New Question Body", 
  	resolved: false)}

  	


  		it "should respond to a title" do 
  			expect(question).to respond_to(:title)
  		end

  		it "should respond to a body" do 
  			expect(question).to respond_to(:body)
  		end

  		it "should respond to a resolved status" do 
  			expect(question).to respond_to(:resolved)
  		end

  	
end
