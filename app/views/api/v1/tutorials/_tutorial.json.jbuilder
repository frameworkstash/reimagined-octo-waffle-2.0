json.extract! tutorial, :id, :created_at
json.title tutorial.title
json.description tutorial.description
json.set! :author do
  json.id 1
  json.name tutorial.author.displayName
end
json.website tutorial.website
json.skill_level tutorial.skill_level
json.total_comments tutorial.total_comments
json.total_likes tutorial.total_likes
