Rails.application.routes.draw do
  resources :boxes, except: %i[destroy] do
    get '/report' => 'boxes#report', on: :collection
    resources :items, only: %i[create destroy]
  end

  root to: redirect('/boxes')
end
