json.array! @day.tasks do |task|
  json.task task.chore.title
  json.complete task.done
  json.id task.id
end
