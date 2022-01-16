json.array! @day.tasks do |task|
  json.title task.chore.title
  json.done task.done
  json.id task.id
end
