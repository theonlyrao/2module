require 'yaml/store'

class TaskManager
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(task)
    database.transaction do
      database['tasks'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['tasks'] << { "id" => database['total'],
                             "title" => task[:title],
                             "description" => task[:description]
                           }
    end
  end

  def raw_tasks
    database.transaction do
      database['tasks'] || []
    end
  end

  def all
    raw_tasks.map { |data| Task.new(data) }
  end

  def raw_task(id)
    raw_tasks.find { |task| task["id"] == id }
  end

  def find(id)
    Task.new(raw_task(id))
  end

  def update(id, new_task_information)
    database.transaction do
      task_to_be_updated = database['tasks'].find do |data|
        data["id"] == id
      end
      task_to_be_updated["title"] = new_task_information[:title]
      task_to_be_updated["description"] = new_task_information[:description]
    end
  end

  def destroy(id)
    database.transaction do
      database['tasks'].delete_if do |task|
        task["id"] == id
      end
    end
  end

  def delete_all
    database.transaction do
      database['tasks'] = []
      database['total'] = 0
    end
  end
end
