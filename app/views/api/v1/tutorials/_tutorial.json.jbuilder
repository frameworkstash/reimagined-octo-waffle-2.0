json.extract! tutorial, :id, :created_at
json.set! :attributes do
  json.title tutorial.title
  json.description tutorial.description
  json.website tutorial.website
  json.author tutorial.author
end
json.set! :relationships do
  json.framework do
    json.extract! tutorial.framework, :id
    json.title tutorial.framework.title
  end
  json.level do
    json.extract! tutorial.level, :id
    json.level tutorial.level.skill_level
  end
end
