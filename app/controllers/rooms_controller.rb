class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show ]

  # GET /rooms or /rooms.json
  def index
    @q = Room.ransack(params[:q])
    @rooms = @q.result
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    @room.increment_views_count
    @message = Message.new
    @comments = @room.comments.order(id: :desc)
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to rooms_url, notice: 'Sala criada com sucesso.' }
      else
        format.html { render :new, status: :unprocessqable_entity }
      end
    end
  end

  def enter
    @user = User.new(user_params)
    session[:user_id] = @user.id
    redirect_to room_url(params[:id])
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def room_params
    params.require(:room).permit(:name, :video_url)
  end
end
