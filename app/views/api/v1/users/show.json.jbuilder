json.set! :data do
  json.set! :user do
    json.partial! "api/v1/users/user", user: user
    json.jwt_token @jwt
    json.set! :hunted_tutorials do
      json.array! user.hunted_tutorials, partial: "api/v1/tutorials/tutorial", as: :tutorial
    end
    json.set! :written_tutorials do
      json.array! user.written_tutorials, partial: "api/v1/tutorials/tutorial", as: :tutorial
    end
  end
end
