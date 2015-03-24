require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @teacher = Teacher.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @teacher.valid?
  end

  test "email is wcupa"
  	if @teacher.email.include? "@wcupa.edu"
  		assert @teacher.valid?
  	else
  		assert_not @teacher.valid?
  	end
	end

end
