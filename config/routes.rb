Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :accounts, only: %i[index update]

      scope :users do
        scope ':user_id' do
          resources :transactions, only: :index
        end
      end
    end
  end
end
