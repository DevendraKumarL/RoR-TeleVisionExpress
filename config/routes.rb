Rails.application.routes.draw do
  get 'televisioexpress/admin' => 'televisioexpress#admin'

  get 'televisioexpress/admin/tvshows' => 'televisioexpress#tvshows'
  get 'televisioexpress/admin/seasons' => 'televisioexpress#seasons'
  get 'televisioexpress/admin/episodes' => 'televisioexpress#episodes'


  get 'session/homepage'

  get 'session/tvshows' => 'session#tvshows'
  get 'session/tvshows/:id' => 'session#session_a_show', as: :a_show
  get 'session/tvshows/seasons/:season_id' => 'session#season', as: :a_season
  get 'session/tvshows/season/:episode_id' => 'session#episode', as: :a_episode
  get 'session/tvshows/episodes/:a_episode_id' => 'session#a_episode', as: :a_episode_detail

  get 'session/tvshows/view_reviews/:view_review' => 'session#view_review', as: :view_review
  get 'session/tvshows/give_reviews/:give_review' => 'session#give_review', as: :give_review
  post 'session/tvshows/review' => 'session#create_review'

  get 'session/tvshows/season_view_reviews/:season_view_review' => 'session#season_view_review', as: :season_view_review
  get 'session/tvshows/season_give_reviews/:season_give_review' => 'session#season_give_review', as: :season_give_review
  post 'session/tvshows/season/review' => 'session#create_season_review'

  get 'session/tvshows/episode_view_reviews/:episode_view_review' => 'session#episode_view_review', as: :episode_view_review
  get 'session/tvshows/episode_give_reviews/:episode_give_review' => 'session#episode_give_review', as: :episode_give_review
  post 'session/tvshows/season/episode/review' => 'session#create_episode_review'

  get 'session/tvshows/tvshow_view_ratings/:tvshow_view_rating' => 'session#tvshow_view_rating', as: :view_rating
  get 'session/tvshows/tvshow_give_ratings/:tvshow_give_rating' => 'session#tvshow_give_rating', as: :give_rating
  post 'session/tvshows/rating' => 'session#create_tvshow_rating'

  get 'session/tvshows/season_view_ratings/:season_view_rating' => 'session#season_view_rating', as: :season_view_rating
  get 'session/tvshows/season_give_ratings/:season_give_rating' => 'session#season_give_rating', as: :season_give_rating
  post 'session/tvshows/season/rating' => 'session#create_season_rating'

  get 'session/tvshows/episode_view_ratings/:episode_view_rating' => 'session#episode_view_rating', as: :episode_view_rating
  get 'session/tvshows/episode_give_ratings/:episode_give_rating' => 'session#episode_give_rating', as: :episode_give_rating
  post 'session/tvshows/season/episode/rating' => 'session#create_episode_rating'



  get 'session/profile' => 'session#profile'

  get 'welcome/register' => 'welcome#register'
  post 'welcome/create_user' => 'welcome#create_user'


  get 'session/log_user' => 'session#log_user'
  post 'session/login_user' => 'session#login_user'

  get 'session/destroy' => 'session#destroy'
 
  get 'session/team' => 'session#team'

  get 'discover/discover_shows' => 'discover#discover_shows'
  get 'discover/discover_by_category' => 'discover#discover_by_category'
  get 'discover/discover_by_year' => 'discover#discover_by_year'

  #get 'discover/discover_shows/:id' => 'discover#discover_a_show', as: :category

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'session#homepage'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
