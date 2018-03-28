json.set! :data do
  json.set! :tutorial do
    json.partial! "api/v1/tutorials/tutorial", tutorial: @tutorial
    json.all_tags @tutorial.all_tags
    json.total_comments @tutorial.total_comments
    json.total_likes @tutorial.total_likes
    json.set! :related_tutorials do
      json.array! @tutorial.related_posts, partial: "api/v1/tutorials/tutorial", as: :tutorial
    end
    json.set! :comments do
      json.array! @tutorial.comments, partial: 'api/v1/comments/comment', as: :comment
    end
  end
end
