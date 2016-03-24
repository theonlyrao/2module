require_relative '../test_helper'
require 'tilt/erb'
require 'capybara/dsl'

Capybara.app = TaskManagerApp

class UserCreatesNewTaskTest < Minitest::Test

  include TestHelpers
  include Capybara::DSL

  def test_user_can_see_a_submit_button
    visit '/tasks/new'

    within("#new_task") do
      assert page.has_button?("Create Task")
    end
  end

end
