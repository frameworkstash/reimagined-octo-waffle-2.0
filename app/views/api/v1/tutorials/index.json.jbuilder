json.set! :data do
  json.set! :tutorials do
    @tutorials.each do |key, value|
      json.set! key do
        json.array! value, partial: 'api/v1/tutorials/tutorial', as: :tutorial
      end
    end
  end
end
