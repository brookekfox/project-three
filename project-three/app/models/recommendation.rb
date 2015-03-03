class Recommendation < ActiveRecord::Base

	belongs_to :users

	validates_presence_of :social_media, :is_public, :handle
	validates_format_of :handle, with: /\A@[A-Za-z0-9_]{1,15}\Z/

end
