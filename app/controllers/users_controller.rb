class UsersController < ApplicationController
  def edit
  end

  def update
    # 保存できた場合とできなかった場合で条件分岐の処理
    if 
      current_user.update(user_params)
    redirect_to root_path
      # current_user.updateに成功した場合、root（チャット画面）にリダイレクト
    else
      render :edit
      # 失敗した場合、editのビューが表示
    end 

  end
  
  private
  def user_params
      params.require(:user).permit(:name, :email)
  end
end
