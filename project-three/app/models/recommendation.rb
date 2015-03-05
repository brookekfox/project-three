class Recommendation < ActiveRecord::Base
	# attr_accessor :user_email, :user_first_name, :user_id_to
	belongs_to :user

	accepts_nested_attributes_for :user

	validates_presence_of :social_media, :handle
	# validates_format_of :handle, with: /\A@[A-Za-z0-9_]{1,15}\Z/

end
