require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Dejan", surname: "Acimovic", email: "dejan@example.com")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "user name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "user surname should be present" do
    @user.surname = ""
    assert_not @user.valid?
  end

  test "user email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email address should be unique" do
    dup_user = @user.dup
    # make sure it is not checking for case sensitivity
    dup_user.email = @user.email.upcase
    @user.save
    assert_not dup_user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TTD-DE@eee.hello.org user@example.com first.last@gmail.com laura+joe@mon.eu]
    valid_addresses.each do |email|
      @user.email = email
      # I want to know which one is failing
      assert @user.valid?, "#{email.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
    invalid_addresses.each do |email|
      @user.email = email
      # I want to know which one is failing
      assert_not @user.valid?, "#{email.inspect} should be invalid"
    end
  end

  test "email is saved in downcase" do
    email = "Dejan@Example.Com"
    @user.email = email
    @user.save
    assert_equal @user.email, email.downcase
  end

end
