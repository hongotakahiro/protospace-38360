Rails.application.routes.draw do
  devise_for :users
  # get 'prototypes/index'
  root to: "prototypes#index"  
  resources :prototypes do
    # tweetsコントローラーの７つのアクションが作られる
    resources :comments, only: :create
    # commtentsコントローラーのcreate アクションのみが作られます。
    # 特定のツイートに対してコメントが保存できるようになる（ツイートとコメントが勝手に紐づくようになる）
  end
    # usersコントローラーのshowアクションのみが作られます。
    resources :users, only: :show

    resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy]
end

