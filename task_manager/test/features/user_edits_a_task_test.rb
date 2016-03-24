require_relative '../test_helper'
require 'tilt/erb'
require 'capybara/dsl'

Capybara.app = TaskManagerApp

class UserEditsATaskTest < Minitest::Test

  include TestHelpers
  include Capybara::DSL

  def test_user_can_edit_a_task
    # user arrives at the dashboard
    visit "/"

    # user creates the original task
    click_link("New Item")

    # user enters title and description of original task
    fill_in("task[title]", :with => "Original Title")
    fill_in("task[description]", :with => "Original description." )

    # user clicks create tasks
    click_on("Create Task")

    # user clicks "edit task" on the row in the list of tasks
    click_link("Edit")

    # user inputs new task information into edit form
    fill_in("task[title]", :with => "Updated Title")
    fill_in("task[description]", :with => "Updated Description" )
    
    # user clicks submit to register the changes
    click_on("Update Task")

    # user sees what the task is edited to
    within("#title") do
      assert page.has_content?("Updated Title")
    end

    within("#description") do
      assert page.has_content?("Updated Description")
    end
  end

end
