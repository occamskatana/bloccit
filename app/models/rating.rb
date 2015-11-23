class Rating < ActiveRecord::Base

	belongs_to :topic
	belongs_to :post

	enum severity: [:PG, :PG13, :R]

	has_many :topics
	has_many :posts

	def self.update_rating(rating_string)
			return Rating.none if rating_string.blank?

			Rating.find_or_create_by(name: rating_string.strip)
	end

end
