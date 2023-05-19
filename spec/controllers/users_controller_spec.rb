require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe '#create' do
    let(:room) { create(:room) }
    let(:user) { create(:user) }
    let(:params) { { room_id: room.id, username: user.username } }

    it 'creates a new user' do
      expect {
        post :create, params: params
      }.to change(User, :count).by(2)
    end

    it 'sets the user_id in the session' do
      post :create, params: params
      expect(session[:user_id]).to eq(User.last.id)
    end

    it 'redirects to the room_url' do
      post :create, params: params
      expect(response).to redirect_to(room_url(room.id))
    end
  end
end
