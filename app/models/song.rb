class Song < ActiveRecord::Base

	belongs_to :artist
	has_many  :song_genres
	has_many :genres, through: :song_genres

	def slug
		self.name.split(/[^\w]/).map{|l| l.downcase}.join("-")
	end

	def self.find_by_slug(slug)
		self.all.find {|a| a.slug ==slug}
	end

end
