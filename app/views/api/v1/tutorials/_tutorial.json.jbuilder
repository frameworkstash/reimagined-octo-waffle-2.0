json.extract! tutorial, :id, :created_at
json.title tutorial.title
json.description tutorial.description
json.set! :author do
  json.id 1
  json.name tutorial.author
end
json.website tutorial.website
json.skill_level tutorial.skill_level
json.total_comments tutorial.total_comments
# json.set! :comments do
#   json.array! tutorial.comments, partial: 'api/v1/comments/comment', as: :comment
# end
json.total_likes tutorial.total_likes
