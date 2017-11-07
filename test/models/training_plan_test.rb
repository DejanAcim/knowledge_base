require 'test_helper'

class TrainingPlanTest < ActiveSupport::TestCase

  def setup
    @user = User.create(name: "Dejan2", surname: "Acimovic2", email: "dejanacimovic@example.com")
    @training_plan = @user.training_plans.new(name: "Ruby on Rails Juniorship",
                     description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et do")
  end

  test "training plan should be valid" do
    assert @training_plan.valid?
  end

  test "user_id should be present" do
    @training_plan.user_id = nil
    assert_not @training_plan.valid?
  end

  test "name should be present" do
    @training_plan.name = ""
    assert_not @training_plan.valid?
  end

  test "name length should not be longer than 100 characters" do
    @training_plan.name = "a" * 101
    assert_not @training_plan.valid?
  end

  test "name length should not be too short" do
    @training_plan.name = "aaaa"
    assert_not @training_plan.valid?
  end

  test "description should be present" do
    @training_plan.description = ""
    assert_not @training_plan.valid?
  end

  test "description should not be longer than 500 characters" do
    @training_plan.description = "a" * 501
    assert_not @training_plan.valid?
  end

  test "description should not be shorter than 20 characters" do
    @training_plan.description = "a" * 19
    assert_not @training_plan.valid?
  end
end
