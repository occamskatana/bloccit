require 'rails_helper'
include RandomData

RSpec.describe Post, type: :model do
let(:topic) {Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph)}
	let(:user) {User.create!(name: "Bloccit User", email: "user@bloccit.com", password:"helloworld")}
		let(:post) {topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user )}
	

	it {should belong_to(:topic)}
	it {should validate_presence_of(:title)}
	it {should validate_presence_of(:body)}
	it {should validate_presence_of(:topic)}
	it {should belong_to(:user)}

	it {should validate_length_of(:title).is_at_least(5)}
	it {should validate_length_of(:body).is_at_least(20)}
	it {should validate_presence_of(:user)}
	it {should have_many(:labelings)}
	it {should have_many(:labels).through(:labelings)}
	it {should have_many(:votes)}

	it {should have_many(:comments)}
	it {should have_many(:favorites)}

	describe "attributes" do 
		it "should respond to a title" do 
			expect(post).to respond_to(:title)
		end

		it "should respond to a body" do 
			expect(post).to respond_to(:body)
		end
	end

	describe "voting" do 
		before do 
			3.times {post.votes.create!(value: 1)}
			2.times {post.votes.create!(value: -1)}

			@up_votes = post.votes.where(value: 1).count
			@down_votes = post.votes.where(value: -1).count
		end

		describe "up_votes" do 
			it "increases the number of votes with value = 1" do 
				expect(post.up_votes).to eq(@up_votes)
			end
		end

		describe "down_votes" do 
			it "decreases the number of votes with value = -1" do 
				expect(post.down_votes).to eq(@down_votes)
			end
		end

		describe "points" do
			it "returns the sum of all up votes and down votes" do 
				expect(post.points).to eq(@up_votes - @down_votes)
			end
		end
	

		describe "#update_rank" do 
			it "calculates the correct rank" do 
				post.update_rank
				expect(post.rank).to eq(post.points + (post.created_at - Time.new(1970,1,1)) / 1.day.seconds)
			end

			it "updates the rank when an upvote is created" do 
				old_rank = post.rank
				post.votes.create!(value: 1)
				expect(post.rank).to eq(old_rank + 1)
			end

			it "updates the rank when a downvote is called" do 
				old_rank = post.rank
				post.votes.create!(value: -1)
				expect(post.rank).to eq(old_rank - 1)
			end
		end

		describe "auto favorite" do 
			it "automatically favorites the post for the user upon creation" do 
				new_post = topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user)
				expect(user.favorites.find_by_post_id(new_post.id)).not_to be_nil 
			end
		end
	end
end
