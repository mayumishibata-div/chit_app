class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    # paramsにふくまれるroomのidを取得
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    # @room.messages.newでチャットルームに紐づいたメッセージのインスタンスを生成
    # message_paramsを引数にして、privateメソッドを呼び出し
    if @message.save
    # 生成したインスタンスを@messageに代入し、saveメソッドでメッセージの内容をmessagesテーブルに保存
      redirect_to  room_messages_path
    else
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end

end
