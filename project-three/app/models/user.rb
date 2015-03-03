require 'bcrypt'

class User < ActiveRecord::Base
	has_secure_password
	has_many :recommendations

	validates :email, presence: true,
					 				  format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
									  uniqueness: true
	validates_presence_of :first_name, message: 'you have to have a first name'
	validates_format_of :twitter, with: /\A@[A-Za-z0-9_]{1,15}\Z/
	validates_format_of :instagram, with: /\A@[A-Za-z0-9_]{1,15}\Z/

	# has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' },
	# 									default_url: '/images/:style/missing.png'
	# validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
