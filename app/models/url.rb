require 'digest'

class Url < ApplicationRecord
	validates :long_url, presence: true
	# This is Sinatra! Remember to create a migration!
	def self.shorten(web)    
		short = Digest::SHA1.hexdigest(web)[8..13]
		latest = Url.find_by(long_url: web)
		latest.update(short_url: short)
	end
end
