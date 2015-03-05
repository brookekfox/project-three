class Recommendation < ActiveRecord::Base

	belongs_to :user

	validates_presence_of :social_media, :handle
	# validates_format_of :handle, with: /\A@[A-Za-z0-9_]{1,15}\Z/

end
