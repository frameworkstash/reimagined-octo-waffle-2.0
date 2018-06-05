json.set! :data do
  json.set! :user do
    json.auth_token auth_token
    json.partial! "api/v1/users/user", user: user
  end
end
