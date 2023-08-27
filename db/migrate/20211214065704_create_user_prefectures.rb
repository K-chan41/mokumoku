# frozen_string_literal: true

class CreateUserPrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :user_prefectures do |t|
      t.references :user, null: false, foreign_key: true
      t.references :prefecture, null: false, foreign_key: true

      t.timestamps
    end
  end
end
