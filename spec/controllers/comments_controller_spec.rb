require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:room) { create(:room) }
  let(:user) { create(:user) }

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'POST #create' do

    before do
      allow(controller).to receive(:current_user).and_return(user)
      request.env['HTTP_REFERER'] = room_url(room)
    end

    context 'with valid parameters' do
      let(:valid_params) { { content: Faker::Lorem.sentence, format: room.id } }

      before do
        post :create, params: valid_params
      end

      it 'creates a new comment' do
        expect(Comment.count).to eq(1)
      end

      it 'redirects back to the previous page' do
        expect(response).to redirect_to(room_url(room.id))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new comment' do
        expect {
          post :create, params: { comment: { content: nil }, format: room.id }
        }.to_not change(Comment, :count)
      end

      it 'redirects to the rooms page' do
        post :create, params: { comment: { content: '' }, format: room.id }
        expect(response).to redirect_to(rooms_path)
      end

      it 'sets an error message' do
        post :create, params: { comment: { content: '' }, format: room.id }
        expect(flash[:alert]).to eq('Erro ao criar o comentário.')
      end
    end
  end
end
