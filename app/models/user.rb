require 'bcrypt'

class User < ActiveRecord::Base
	has_secure_password
	has_many :recommendation

	validates :email, presence: true,
										format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
										uniqueness: true

	validates_presence_of :first_name, message: 'you have to have a first name'
	validates :password_digest, presence: true

	validate :either_twitter_or_instagram
	def either_twitter_or_instagram
		if self.twitter == nil && self.instagram == nil
			self.errors.add(:twitter, 'you need either a handle or an email')
			self.errors.add(:instagram, 'you need either a handle or an email')
		# elsif self.twitter != nil && self.instagram == nil
		# 	validates_format_of :twitter, with: /\A@[A-Za-z0-9_]{1,15}\Z/, message: 'your twitter handle is not in the correct format'
		# 	return
		# elsif self.twitter == nil && self.instagram != nil
		# 	validates_format_of :instagram, with: /\A@[A-Za-z0-9_]{1,15}\Z/, message: 'your instagram handle is not in the correct format'
		# 	return
		end
	end

	def full_name
		puts self.first_name.capitalize + ' ' + self.last_name.capitalize
	end

	# has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' },
	# 									default_url: '/images/:style/missing.png'
	# validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
