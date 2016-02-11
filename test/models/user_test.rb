require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user = User.new(name: "Example User",
						 email: "user@example.com",
						 sid: "12345678",
						 paid: false)
	end

	test "should be valid" do
		assert @user.valid?
	end

	test "username should exist" do
		@user.name = "        "
		assert_not @user.valid?
	end

	test "name should be under 61 characters" do
		@user.name = "a" * 61
		assert_not @user.valid?
	end

	test "email should exist" do
		@user.email = "        "
		assert_not @user.valid?
	end

	test "email should be under 256 charcters" do
		@user.email = "a" * 256
		assert_not @user.valid?
	end

	test "email should be of format" do
		valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                             first.last@foo.jp alice+Bob@baz.cn]
        valid_addresses.each do |valid_address|
        	@user.email = valid_address
        	assert @user.valid?, "#{valid_address} should be valid"
        end
	end

	test "email validation should reject invalid addresses" do
	    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
	    invalid_addresses.each do |invalid_address|
	        @user.email = invalid_address
	        assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
        end
    end

    test "email addresses should be unique" do
    	duplicate_user = @user.dup
    	duplicate_user.email = @user.email.upcase
    	@user.save
    	assert_not duplicate_user.valid?
  	end

  test "sid should be 8 digits long" do
  		@user.sid = 1234567
  		assert_not @user.valid?

  		@user.sid = 123456789
  		assert_not @user.valid?

  		@user.sid = 12345678
  		assert @user.valid?
  	end	
end
