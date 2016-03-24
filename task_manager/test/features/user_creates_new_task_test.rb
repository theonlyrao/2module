require_relative '../test_helper'
require 'tilt/erb'
require 'capybara/dsl'

Capybara.app = TaskManagerApp

class UserCreatesNewTaskTest < Minitest::Test

  include TestHelpers
  include Capybara::DSL

  def test_user_creates_a_new_task
    # user arrives at home page
    visit "/"

    # user clicks new task
    click_link("New Item")

    # user enters title, description
    fill_in("task[title]", :with => "New Task")
    fill_in("task[description]", :with => "New description.")

    # user clicks Create Task
    click_on("Create Task")

    # user sees title of new task in list
    within("tr:nth-child(2)") do
      assert page.has_content?("New Task")
    end

    # user clicks on the title
    click_link("New Task")

    # user sees title and description
    within("#title") do
      assert page.has_content?("New Task")
    end

    within("#description") do
      assert page.has_content?("New description.")
    end
  end

end
