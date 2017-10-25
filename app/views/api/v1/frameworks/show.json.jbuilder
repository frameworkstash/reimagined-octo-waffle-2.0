json.set! :data do
  json.set! :framework do
    json.partial! "api/v1/frameworks/framework", framework: @framework
  end
end
