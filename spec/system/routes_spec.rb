require 'rails_helper'

it 'サインイン画面に遷移する' do
  expect(get: '/end_users/sign_in').to route_to('end_users/sessions#new')
end

it 'サインアップ画面に遷移する' do
  expect(get: '/end_users/sign_up').to route_to('end_users/registrations#new')
end