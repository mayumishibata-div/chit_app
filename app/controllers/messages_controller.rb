class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room = Room.find(params[:room_id])
    # paramsにふくまれるroomのidを取得
    @messages = @room.messages.includes(:user)
    # チャットルームに紐付いている全てのメッセージ（@room.messages）を@messagesと定義
    # 全てのメッセージ情報に紐づくユーザー情報を、includes(:user)と記述をすることにより、ユーザー情報を1度のアクセスでまとめて取得することができます。
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
      @messages = @room.messages.includes(:user)
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

end
