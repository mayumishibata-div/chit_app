class RoomsController < ApplicationController
  def new 
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    # 保存の成功・失敗による条件分岐
    if 
      @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def room_params
    params.require(:room).permit(:name, user_ids: [])
    # 配列に対して保存を許可したい場合は、キーに対し[]を値として記述
  end
end
