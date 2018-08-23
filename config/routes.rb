Rails.application.routes.draw do
  root to: "home#index"
  get '/weather/forecast'     => 'weather#forecast'
  get '/climate'              => 'climate#index'
  post '/get_suggestions'     => 'cities#get_suggestions'
  get '/climate/forecast'     => 'climate#forecast'

  resource :api do
    resource :v1 do
      get '/climate/:code' => 'api/v1/climate#index', defaults: { format: 'json' }
    end
  end

end
