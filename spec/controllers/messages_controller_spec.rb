require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:room) { create(:room) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new message' do
        expect {
          post :create, params: { message: { content: 'Test message' }, room_id: room.id }
        }.to change(Message, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new message' do
        expect {
          post :create, params: { message: { content: '' }, room_id: room.id }
        }.to_not change(Message, :count)
      end
    end
  end
end