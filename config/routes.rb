Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :order_informations
    end
  end
end
