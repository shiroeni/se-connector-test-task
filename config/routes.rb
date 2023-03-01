# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tokens, only: :create
end
