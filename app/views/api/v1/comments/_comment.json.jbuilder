json.extract! comment, :id, :created_at
json.set! :attributes do
  json.content comment.content
end
json.total_likes comment.total_likes
