class CreateRoomUsers < ActiveRecord::Migration[6.0]
  # どのユーザーがどのチャットルームに参加しているかを管理しているテーブル
  def change
    create_table :room_users do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, nill: false, foreign_key: true
      t.timestamps
    end
  end
end
