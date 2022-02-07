json.array! @day.tasks.sort_by(&:id) do |task|
  json.task task.chore.title
  json.complete task.done
  json.id task.id
end
