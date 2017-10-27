json.extract! tutorial, :id, :created_at
json.set! :attributes do
  json.title tutorial.title
  json.description tutorial.description
  json.website tutorial.website
  json.author tutorial.author
  json.skill_level tutorial.skill_level
end
json.total_comments tutorial.total_comments
json.total_likes tutorial.total_likes
