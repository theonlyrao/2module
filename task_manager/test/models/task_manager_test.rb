require_relative '../test_helper'
require_relative '../../app/models/task'
require 'pry'

class TaskManagerTest < Minitest::Test

  include TestHelpers

  def setup

    task_manager.create({:title => "one",
                         :description => "1 Description"})
    task_manager.create({:title => "two",
    :description => "2 Description"})
    task_manager.create({:title => "three",
    :description  => "3 Description"})
    task_manager.create({:title => "four",
    :description  => "4 Description"})

  end

  def test_it_creates_a_task
    task = task_manager.find(1)

    assert_equal "one", task.title
    assert_equal "1 Description", task.description
  end

  def test_it_finds_all_tasks
    manager = task_manager.all

    assert_equal 4, manager.count
    assert_equal Task, manager[0].class
  end

  def test_it_can_update_a_task
    task = task_manager.find(1)

    assert_equal "one", task.title

    task_manager.update(1, {:title => "test"})

    updated_task = task_manager.find(1)

    assert_equal "test",  updated_task.title
  end

  def test_it_destroys_a_task
    task = task_manager.find(1)

    assert_equal "one", task.title
    assert_equal 4, task_manager.all.count

    task_manager.destroy(1)

    assert_equal 3, task_manager.all.count
  end

end
