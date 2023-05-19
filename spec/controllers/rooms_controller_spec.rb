require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  let(:user) { create(:user) }
  let(:room) { create(:room) }

  describe 'GET #index' do
    it 'assigns @rooms' do
      get :index
      expect(assigns(:rooms)).to eq(Room.all)
    end
  end

  describe 'GET #show' do
    it 'increments views_count' do
      expect {
        get :show, params: { id: room.id }
        room.reload
      }.to change(room, :views).by(1)
    end

    it 'assigns @message' do
      get :show, params: { id: room.id }
      expect(assigns(:message)).to be_a_new(Message)
    end

    it 'assigns @comments' do
      get :show, params: { id: room.id }
      expect(assigns(:comments)).to eq(room.comments.order(id: :desc))
    end
  end

  describe 'GET #new' do
    it 'assigns @room' do
      get :new
      expect(assigns(:room)).to be_a_new(Room)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new room' do
        expect {
          post :create, params: { room: { name: 'Test Room', video_url: 'https://example.com/video' } }
        }.to change(Room, :count).by(1)
      end

      it 'redirects to rooms index' do
        post :create, params: { room: { name: 'Test Room', video_url: 'https://example.com/video' } }
        expect(response).to redirect_to(rooms_url)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new room' do
        expect {
          post :create, params: { room: { name: '', video_url: 'https://example.com/video' } }
        }.to_not change(Room, :count)
      end

      it 'renders the new template' do
        post :create, params: { room: { name: '', video_url: 'https://example.com/video' } }
        expect(response).to render_template(:new)
      end
    end
  end
end
