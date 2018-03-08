json.set! :data do
  json.set! :tutorial do
    json.partial! "api/v1/tutorials/tutorial", tutorial: @tutorial
    json.total_comments @tutorial.total_comments
    json.total_likes @tutorial.total_likes
    # json.set! :relationships do
      json.set! :comments do
        json.array! @tutorial.comments, partial: 'api/v1/comments/comment', as: :comment
      end
    # end
  end
end
