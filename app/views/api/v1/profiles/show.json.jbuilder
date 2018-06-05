json.set! :data do
  json.set! :profile do
    json.partial! "api/v1/profiles/profile", user: @user
    json.upvotesTotal @user.likes.count
    json.submittedTotal @user.hunted_tutorials.count
    json.madeTotal @user.written_tutorials.count
    json.recent_comments @user.posts_with_comments, :id, :title, :slug
  end
end
