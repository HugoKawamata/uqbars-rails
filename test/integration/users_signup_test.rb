require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

	test "invalid signup information" do
		get join_path
		assert_no_difference "User.count" do
			post users_path, user: {
				name: "",
				email: "user@invalid",
				sid: "memed"
			}		
		end
		assert_template "users/new"

	end

end
