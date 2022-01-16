json.day @day.chores do |chore|
  json.title chore.title
  json.done chore.manifests.first.done
  json.id chore.manifests.first.id
end
