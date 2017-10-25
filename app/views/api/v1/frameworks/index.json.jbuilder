json.set! :data do
  json.set! :frameworks do
    json.array! @frameworks, partial: 'api/v1/frameworks/framework', as: :framework    
  end
end
