require 'rails_helper'

RSpec.describe User, type: :model do
	it 'should allow a user to log in' do
		user = User.create(email:'brooke@brooke.com', password:'1234')
		login_attempt = user.authenticate('1234') #if the password is correct, it returns the user object
		expect(login_attempt).to be_an_instance_of(User)
		expect(login_attempt).to eql(user)
	end
end
