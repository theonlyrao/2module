What users want | CRUD | Action (url) | Method/Verb | Data Prep | Redirect/Render | View | built?
--- | --- | ---| --- | --- | --- | --- | ---
See all tasks | read | '/tasks' | GET | @tasks = task_manager.all | render | :index | yes
See one task | read | '/tasks/:id' | GET | @task = task_manager.find(id) | render | :show | yes
See form to input task info | create | 'tasks/new' | GET | none | render | :new | yes
Click Submit and save task | create | '/tasks' | POST | task_manager. create(params[:task]) | redirect | '/tasks/:id' | yes
See form to update task info | update | '/tasks/:id/edit' | GET | @task = task_manager.find(id) | render | :edit | yes
Click submit and save updated info | update | 'tasks/:id' | PUT/PATCH | task_manager.update(params[tasks].id) | redirect | '/tasks/:id' | yes
delete a task | delete | 'tasks/:id/delete' | DELETE | task_manager.delete(id) | redirect | '/tasks' | no
