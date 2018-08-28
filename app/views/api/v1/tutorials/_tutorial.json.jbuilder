json.extract! tutorial, :id
json.title tutorial.title
json.slug tutorial.slug
json.description tutorial.description
json.website tutorial.website
json.skill_level tutorial.skill_level
json.total_comments tutorial.total_comments
json.total_likes tutorial.total_likes
json.upvoted signed_in? ? current_user.favorited?(tutorial) : false
