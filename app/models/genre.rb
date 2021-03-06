class Genre < ActiveRecord::Base

	has_many :song_genres
	has_many :songs, through: :song_genres
	has_many :artists, through: :songs

	def slug
		self.name.split(/[^\w]/).map{|l| l.downcase}.join("-")
	end

	def self.find_by_slug(slug)
		self.all.find {|a| a.slug ==slug}
	end

end
