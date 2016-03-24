require_relative '../test_helper'
require 'tilt/erb'
require 'capybara/dsl'

Capybara.app = TaskManagerApp

class UserSeesGreetingOnHomePage < Minitest::Test

  include TestHelpers
  include Capybara::DSL

  def test_user_is_welcomed
    visit '/'

    within("#welcome") do
      assert page.has_content?("Your Task Manager")
    end
  end

end
