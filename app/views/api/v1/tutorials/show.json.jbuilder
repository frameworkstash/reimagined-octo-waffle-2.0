json.set! :data do
  json.set! :framework do
    json.partial! "api/v1/tutorials/tutorial", tutorial: @tutorial
  end
end
