json.set! :data do
  json.set! :framework do
    json.partial! "api/v1/frameworks/framework", framework: @framework
    json.set! :relationships do
      json.set! :tutorials do
        json.array! @framework.tutorials, partial: 'api/v1/tutorials/tutorial', as: :tutorial
      end
    end
  end
end
